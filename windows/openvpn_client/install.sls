{% from "vpnclient/map.jinja" import vpnclient with context -%}

openvpn-cert-test:
  file.managed:
    - name: c:\alkivi\packages\vpnclient\test_cert.ps1
    - source: salt://vpnclient/test/test_cert.ps1
    - makedirs: True

openvpn-cert-copy:
  file.managed:
    - name: c:\alkivi\packages\vpnclient\{{ vpnclient.cert_file  }}
    - source: salt://vpnclient/cert/{{ vpnclient.cert_file  }}
    - source_hash: sha256={{ vpnclient.cert_hash }}
    - makedirs: True
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\vpnclient\test_cert.ps1

openvpn-cert-install:
  cmd.run:
    - name: certutil.exe -addstore "TrustedPublisher" {{ vpnclient.cert_file  }}
    - cwd: c:\alkivi\packages\vpnclient\
    - shell: powershell
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\vpnclient\test_cert.ps1
    - require:
      - file: c:\alkivi\packages\vpnclient\{{ vpnclient.cert_file  }}

openvpn-client-test:
  file.managed:
    - name: c:\alkivi\packages\vpnclient\test_registry.ps1
    - source: salt://vpnclient/test/test_registry.ps1
    - makedirs: True

openvpn-client-packages:
  file.managed:
    - name: c:\alkivi\packages\vpnclient\{{ vpnclient.installer_file }}
    - source: {{ vpnclient.installer_url  }}
    - source_hash: sha256={{ vpnclient.installer_hash }}
    - makedirs: True
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\vpnclient\test_registry.ps1

openvpn-client-install:
  cmd.run:
    - name: .\{{ vpnclient.installer_file }} /S /SELECT_SHORTCUTS=1 /SELECT_OPENVPN=1 /SELECT_SERVICE=1 /SELECT_TAP=1 /SELECT_OPENVPNGUI=1 /SELECT_ASSOCIATIONS=1 /SELECT_OPENSSL_UTILITIES=1 /SELECT_EASYRSA=1 /SELECT_PATH=1 /SELECT_LAUNCH=1 /SELECT_OPENSSLDLLS=1 /SELECT_LZODLLS=1 /SELECT_PKCS11DLLS=1
    - cwd: c:\alkivi\packages\vpnclient\
    - shell: powershell
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\vpnclient\test_registry.ps1
    - require:
      - file: c:\alkivi\packages\vpnclient\{{ vpnclient.installer_file }}

