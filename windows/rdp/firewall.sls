{% from "rdp/map.jinja" import rdp with context %}
rdp_firewall_rule:
    win_firewall.add_rule:
        - name: open_rdp_access_{{ rdp.port }}
        - localport: {{ rdp.port }}
        - protocol: 'tcp'
        - action: 'allow'
        - dir: 'in'

