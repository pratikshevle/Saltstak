ssm_dir:
  file.directory:
    - name: /tmp/ssm
    - makedirs: True

Download_ssm:
  cmd.run:
    - name: curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -o /tmp/ssm/amazon-ssm-agent.rpm     
    - cwd: /tmp/ssm/

Install_ssm:
  cmd.run:
    - name: yum install -y /tmp/ssm/amazon-ssm-agent.rpm

Stop_SSM:
  cmd.run:
{% if grains['osmajorrelease'] == '7' %}
    - name: systemctl stop amazon-ssm-agent
{% else %}
    - name: stop amazon-ssm-agent
{% endif %}

Run_script:
  cmd.run:
    - name: amazon-ssm-agent -register -code "ukNkN4LKzH1AzOK60yNl" -id "fdb79411-31f1-4bc1-8785-f56a82b693ba" -region "us-east-1"

Start_SSM:
  cmd.run:
{% if grains['osmajorrelease'] == '7' %}
    - name: systemctl start amazon-ssm-agent
{% else %}
    - name: start amazon-ssm-agent
{% endif %}
