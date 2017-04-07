{% from "rdp/map.jinja" import rdp with context %}
rdp_reg_port:
    reg.present:
        - name: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\
        - vname: PortNumber
        - vdata: {{ rdp.port }}
        - vtype: REG_DWORD
        - reflection: True

