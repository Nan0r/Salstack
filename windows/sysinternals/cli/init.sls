sysinternals-gui-path:
  win_path.exists:
    - name: c:\sysinternals\gui\
sysinternals-gui-install:
  archive.extracted:
    - name: c:\sysinternals\
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256=
    - archive_format: zip
    - if_missing: c:\sysinternals\gui\

