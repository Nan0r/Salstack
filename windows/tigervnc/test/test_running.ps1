{% set tigervnc = salt['grains.filter_by']({
    'Windows': {
        'password': 'DummyPassword',
        'port': '5900',
        },
}, grain='os', default='Windows', merge=salt['pillar.get']('tigervnc')) %}

{% set arch = salt['grains.filter_by']({
    'x86': {
        'installer': 'tigervnc32-installer.exe',
        'url': 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.7.0.exe',
        'hash': 'e9bfe3b9397ab19e9983e707e8383cd8ca3c892d3205675a9f8815fbabb147a3',
        },
    'AMD64':{
        'installer': 'tigervnc64-installer.exe',
        'url': 'https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc64-1.7.0.exe',
        'hash': '29167b79f48fc564ef0c81884d8e78b8875eaf9aacb91ff479d06025a2ff9186',
    },
}, grain='cpuarch', merge=salt['pillar.get']('tigervnc')) %}

{% do tigervnc.update(arch) %}

