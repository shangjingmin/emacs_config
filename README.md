
Emacs config using el-get and package.

Tested in Emacs24 on Ubuntu12.04.

* when installed, need three times to new startting emacs: first, install el-get; second, install packages; third, byte compile ecb, then will using all packages. On your staring, please use `emacs --debug-init`, it will see the errors when error accord

* need tools: sudo apt-get install git bzr cvs
git/cvs/bzr, and some lib for some packages


** win10
*** make dir ~\.emacs.d
>rmdir "D:\win_users\sjm\AppData\Roaming\.emacs.d"
>mklink /J "D:\win_users\sjm\AppData\Roaming\.emacs.d" "F:\appdata\emacs_config"

*** make file ~\AppData\Roaming\.emacs
(load-file "~/.emacs.d/init.el")