#!jinja|yaml

/var/cache/salt/firstboot:
  file:
    - absent

/etc/rc.local-firstboot:
  file:
    - managed
    - name: /etc/rc.local
    - source: salt://baseimage/files/rc.local
    - user: root
    - group: root
    - mode: 0755
    - watch:
      - file: /var/cache/salt/firstboot

reboot:
  cmd:
    - run
    - watch:
      - file: /var/cache/salt/firstboot
