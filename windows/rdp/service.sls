{% from "rdp/map.jinja" import rdp with context %}
rdp_service_running:
  service.running:
    - name: {{ rdp.service }}
    - enable: True

