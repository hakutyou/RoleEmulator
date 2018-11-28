__all__ = ['load', 'save']

import toml
from . import path

role_file = path.root_path(False) + '/equip.toml'
default_equip = {
        'weapon': {'index': '', 'icon': ''},
        'auxiliary': {'index': '', 'icon': ''},
        'dart': {'index': '', 'icon': ''},
        'left_ring': {'index': '', 'icon': ''},
        'right_ring': {'index': '', 'icon': ''},
        'bracelet': {'index': '', 'icon': ''},
        'head': {'index': '', 'icon': ''},
        'necklace': {'index': '', 'icon': ''},
        'coat': {'index': '', 'icon': ''},
        'undies': {'index': '', 'icon': ''},
        'belt': {'index': '', 'icon': ''},
        'cuff': {'index': '', 'icon': ''},
        'pants': {'index': '', 'icon': ''}}


def load() -> dict:
        try:
                with open(role_file, 'r', encoding='utf-8') as f:
                        return toml.loads(f.read())
        except FileNotFoundError:
                return default_equip


def save(role_info: dict) -> None:
        with open(role_file, 'w', encoding='utf-8') as f:
                f.write(toml.dumps(role_info))
