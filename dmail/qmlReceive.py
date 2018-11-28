__all__ = ['QmlReceive']

import PyQt5.QtCore
import save
import csv


class QmlReceive(PyQt5.QtCore.QObject):
        def __init__(self, parent=None):
                super(__class__, self).__init__(parent)

        @PyQt5.QtCore.pyqtSlot(result=str, name='root_path')
        def root_path(self, qml_mode=True) -> str:
                return save.path.root_path(qml_mode)

        @PyQt5.QtCore.pyqtSlot(str, result=list, name='load_config')
        def load_config(self, config: str) -> list:
                if config == 'role':
                        return [save.role.load()]
                if config == 'equip':
                        return [save.equip.load()]

        @PyQt5.QtCore.pyqtSlot(str, list, name='save_config')
        def save_config(self, config: str, config_info: list) -> None:
                if config == 'role':
                        save.role.save(config_info[0])
                if config == 'equip':
                        save.equip.save(config_info[0])

        def equip_filter(self, only=False):
                def _equip_filter(region: str, filter_func) -> list:
                        result = []
                        with open(prefix_path + region + '.csv', 'r', encoding='UTF-8') as f:
                                csv_reader = csv.DictReader(f)
                                for item in csv_reader:
                                        if filter_func(item['id'], item['limitLVMin'], item['menpai']):
                                                if only:
                                                        return [dict(item)]
                                                result.append(
                                                        {'index': item['id'],
                                                         'name': item['name'],
                                                         'icon': item['icon'],
                                                         'desc': item['catDesc']}
                                                )
                        return result

                prefix_path = self.root_path(False) + '/data/equip/'
                return _equip_filter

        @PyQt5.QtCore.pyqtSlot(str, int, int, result=list, name='usable_list')
        def usable_list(self, region: str, level: int, menpai: int) -> list:
                def __equip_filter(_, _level: str, _menpai: str) -> bool:
                        if int(_level) > level:
                                return False
                        if (_menpai != '-1') and (_menpai != str(menpai)):
                                return False
                        return True
                return self.equip_filter()(region, __equip_filter)

        @PyQt5.QtCore.pyqtSlot(str, str, result=list, name='equip_detail')
        def equip_detail(self, region: str, index: str):
                def __index_filter(_index: str, _1, _2) -> bool:
                        if _index == index:
                                return True
                        return False
                result = self.equip_filter(only=True)(region, __index_filter)
                return result
