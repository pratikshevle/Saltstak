{% set dst_path = ‘/usr/share/tomcat/webapps’ %}
{% set bck_path = ‘/usr/share/tomcat/webapps/bck_up’ %}


# Stop Tomcat service
Tomcat_stop:
  service.dead:
    - name: tomcat

#Push war files from src to dst
push_warfile:
  file.managed:
    - name: {{ dst_path }}/abc.war
    - source: salt://test_deployment/abc.war

# Start tomcat service
tomcat:
  service.running:
    - name: tomcat

