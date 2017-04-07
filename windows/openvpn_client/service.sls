{% from "vpnclient/map.jinja" import vpnclient with context -%}

include:
  - .install

openvpn-client-service-test:
  file.managed:
    - name: c:\alkivi\packages\vpnclient\test_service.ps1
    - source: salt://vpnclient/test/test_service.ps1
    - makedirs: True

openvpn-client-service:
  cmd.run:
    - name: Start-Service -Name {{ vpnclient.service }}
    - shell: powershell
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\vpnclient\test_service.ps1

