import QtQuick 2.9
import 'Component'

Rectangle {
    property string font_family
    property int font_size
    property int vertical_space: 10
    property int horizontal_space: 20
    property var equip_ids: dmail.load_config('equip')[0]
    Row {
        id: equips_row
        height: parent.height
        width: parent.width

        spacing: horizontal_space
        property var show_label: {
            'weapon': qsTr('ZhuWuQi'),
                    'auxiliary': qsTr('FuWuQi'),
                    'dart': qsTr('AnQi'),
                    'left_ring': qsTr('L.JieZhi'),
                    'right_ring': qsTr('R.JieZhi'),
                    'bracelet': qsTr('ShouZhuo'),
                    'head': qsTr('TouShi'),
                    'necklace': qsTr('XiangLian'),
                    'coat': qsTr('ShangYi'),
                    'undies': qsTr('NeiChen'),
                    'belt': qsTr('YaoDai'),
                    'cuff': qsTr('HuWan'),
                    'pants': qsTr('XieZi'),
        }

        // LEFT PART
        Column {
            spacing: vertical_space
            Repeater {
                id: left_equips
                model: ['weapon', 'auxiliary', 'dart', 'left_ring', 'right_ring', 'bracelet']
                Equipment {
                    label: modelData
                    font_family: equips.font_family
                    font_size: equips.font_size
                }
            }
        }

        // RIGHT PART
        Column {
            spacing: vertical_space
            Repeater {
                id: right_equips
                model: ['head', 'necklace', 'coat', 'undies', 'belt', 'cuff', 'pants']
                Equipment {
                    label: modelData
                    font_family: equips.font_family
                    font_size: equips.font_size
                }
            }
        }
    }
}
