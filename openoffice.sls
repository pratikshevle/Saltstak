open_office_tar:
  archive.extracted:
    - name: /opt/openoffice
    - source: salt://openoffice/Apache_OpenOffice_4.0.1_Linux_x86-64_install-rpm_en-US.tar.gz
    - archive_format: tar
    - tar_options: v

Install_RPM:
  cmd.run:
    - name: rpm -Uvh *rpm
    - cwd: /opt/openoffice/en-US/RPMS
    - require:
      - archive: open_office_tar

PKG_Install_Req:
  pkg.installed:
    - pkgs:
      - libXext
      - freetype

XWindows:
  pkg.group_installed:
    - name: 'X Window System'


accept_socket:
  cmd.run:
    - name: ./soffice -headless -nologo -nofirststartwizard -accept="socket,host=127.0.0.1,port=8100;urp" &
    - cwd: /opt/openoffice4/program


Push_Service_Script:
  file.managed:
    - name: /etc/init.d/openoffice.sh
    - source: salt://openoffice/service_script/openoffice.sh
    - mode: 755


Service_Running:
  cmd.run:
    - name: /etc/init.d/openoffice.sh start

Boot_enabled:
  cmd.run:
    - name: chkconfig openoffice.sh on

