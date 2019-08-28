
name = 'go'

version = '1.12.9'

build_requires = {
    'curl'
}


def commands():
    env.GOROOT = '{root}'
