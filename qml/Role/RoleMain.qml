import QtQuick 2.9
import 'Component'
import 'function.js' as Script

Rectangle {
    id: main_role

    property int item_height: 30
    property string font_family
    property int font_size
    property var config: dmail.load_config('role')[0]
    Column {
        id: role
        height: parent.height
        width: parent.width
        spacing: 20

        property var show_label: { 'name': qsTr('Name'),
                                   'sex': qsTr('Sex'),
                                   'level': qsTr('Level'),
                                   'menpai': qsTr('Menpai')}
        AttrInput {
            height: item_height
            width: parent.width

            label: 'name'
            font_family: main_role.font_family
            font_size: main_role.font_size
        }

        AttrCombo {
            id: role_sex
            height: item_height
            width: parent.width

            label: 'sex'
            choices: [qsTr('Woman'), qsTr('Man'), qsTr('Girl')]
            font_family: main_role.font_family
            font_size: main_role.font_size
            index_changed: Script.check_menpai_sex
        }

        AttrInput {
            height: item_height
            width: parent.width

            label: 'level'
            font_family: main_role.font_family
            font_size: main_role.font_size
            limit_regExp: /(100|[1-9][0-9]{0,1})/
        }

        AttrCombo {
            id: role_menpai
            height: item_height
            width: parent.width

            label: 'menpai'
            choices: [qsTr('ZW'), qsTr('TB'), qsTr('SW'), qsTr('GB'),
                qsTr('TM'), qsTr('WD'), qsTr('SL'), qsTr('TX'),
                qsTr('SD'), qsTr('YH')]
            font_family: main_role.font_family
            font_size: main_role.font_size
        }
    }
}
