__all__ = ['root_path']

import sys


def root_path(qml_mode=True) -> str:
        prefix = ''
        if qml_mode:
                prefix = 'file:///'
        return (prefix + sys.path[0]).replace('\\', '/')
