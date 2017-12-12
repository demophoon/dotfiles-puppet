class dotfiles (
  String $user = 'britt',
  String $homedir = "/home/${user}",
){
  vcsrepo { "${homedir}/.dotfiles":
    ensure   => latest,
    provider => git,
    user     => $user,
    source   => 'https://github.com/demophoon/dotfiles.git',
    notify   => Exec['Install Dotfiles'],
  }

  exec { 'Install Dotfiles':
    command     => "${homedir}/.dotfiles/setup.sh --force",
    user        => $user,
    environment => "HOME=${homedir}",
    cwd         => $homedir,
    refreshonly => true,
    logoutput   => true,
  }

}
