Dotfiles-Puppet
===============

This repo is for installing the doftiles found at https://github.com/demophoon/dotfiles

This will automatically install them for the `britt` user on a machine, however
this can be changed by including it as a class.

```puppet
class { 'dotfiles':
  user    => 'YOUR_USERNAME_HERE',
  homedir => '/home/YOUR_USERNAME_HERE/' # Optional
}
```
