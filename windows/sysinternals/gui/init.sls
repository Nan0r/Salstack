sysinternals-cli-path:
  win_path.exists:
    - name: c:\sysinternals\cli\
sysinternals-cli-install:
  archive.extracted:
    - name: c:\sysinternals\
    - source: https://download.sysinternals.com/files/SysinternalsSuite-Nano.zip
    - source_hash: sha256=75ec02a227b1bc168ca3d749c7f104bcf6d828780e0889a50a74a77c40127527
    - archive_format: zip
    - if_missing: c:\sysinternals\cli\

