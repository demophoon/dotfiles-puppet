class dotfiles (
  String $user = 'britt',
  String $homedir = "/home/${user}",
){
  vcsrepo { "${homedir}/.dotfiles":
    ensure   => present,
    provider => git,
    user     => $user,
    source   => {
      'origin' => 'git@github.com:demophoon/dotfiles.git',
    },
    notify   => Exec['Install Dotfiles'],
  }

  exec { 'Install Dotfiles':
    command     => "${homedir}/.dotfiles/setup.sh --force",
    user        => $user,
    environment => "HOME=${homedir}",
    cwd         => $homedir,
    refreshonly => true,
  }

}
