__all__ = ['load', 'save']

import toml
from . import path

role_file = path.root_path(False) + '/role.toml'
default_role = {
        'name': 'Emilia',       # input
        'sex': 2,               # combo
        'level': '1',           # input
        'menpai': 7,            # combo
}


def load() -> dict:
        try:
                with open(role_file, 'r', encoding='utf-8') as f:
                        return toml.loads(f.read())
        except FileNotFoundError:
                return default_role


def save(role_info: dict) -> None:
        with open(role_file, 'w', encoding='utf-8') as f:
                f.write(toml.dumps(role_info))
