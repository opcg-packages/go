
name = 'go'

version = ''

build_requires = {
    'curl'
}


def commands():
    env.GOROOT = '{root}'
