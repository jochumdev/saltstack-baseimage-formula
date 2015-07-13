#!jinja|yaml

{%- from "baseimage/map.jinja" import datamap with context %}

/etc/rc.local-shutdown:
  file:
    - managed
    - name: /etc/rc.local
    - source: salt://baseimage/files/rc.local-shutdown
    - user: root
    - group: root
    - mode: 0755

baseimage_shutdown:
  file.managed:
    - name: /tmp/baseimage_shutdown.sh
    - source: {{ datamap.shutdown_script_template }}
    - template: jinja
    - user: root
    - group: root
    - mode: 0700

  cmd.run:
    - name: '/bin/sh -c /tmp/baseimage_shutdown.sh &'
    - require:
      - file: baseimage_shutdown
