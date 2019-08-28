
name = 'go'

version = '1.12.9'

variants = [
    ['platform-windows', 'arch-AMD64']
]

build_requires = [
    'curl',
    '7za'
]

@early()
def build_command():
    import os

    if os.name == 'nt':
        return 'cmd.exe /C {root}/build.cmd {install}'

    return '{root}/build.sh {install}'

def commands():
    env.GOROOT = '{root}'
