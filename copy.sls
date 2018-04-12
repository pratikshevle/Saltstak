[root@master test_1]# pwd
/srv/salt/test_1
[root@master test_1]# cat test.sls
#{% set deploy_path = salt['pillar.get']('variables', {}) -%}
#{% set localhost = grains['os_family'] %}
append_file:
  file.append:
    - name: '/tmp/abc.txt'
    - text:
       'welcome to gao shingham'

