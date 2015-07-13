# saltstack-baseimage-formula

### baseimage

Formula to create a baseimage (for lxc as example) and call state.highstate on firstboot.

### states

#### baseimage.shutdown:
- remove salt/pki/minion/* /etc/ssh/ssh_host_*
- modify rc.local to do an state.highstate on the next boot.
- do an apt-get dist-upgrade
- poweroff

#### baseimage.firstboot
- modify rc.local back to the defaults.
- reboot

#### License

MIT (BSD 3-Clause)
