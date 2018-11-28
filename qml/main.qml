import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import './Role'
import './Equip'

Window {
    id: main_window
    title: qsTr('WX Emulator')
    visible: true
    height: 100 // 800
    width: 320 // 640

    property string font_family: 'LiHu Mono Regular'
    property int small_font_size: 8
    property int font_size: 12
    property int item_space: 10

    TabBar {
        id: main_tab
        z: 9
        width: parent.width

        currentIndex: 0
        Repeater {
            model: [qsTr('Role'), qsTr('Equip')]
            TabButton {
                text: modelData
                font.family: font_family
                font.pointSize: font_size
            }
        }
    }

    StackLayout {
        x: item_space // left_space
        y: main_tab.height + item_space // top_space
        z: 1
        height: parent.height - y - item_space // bottom space
        width: parent.width - x - item_space // right space

        currentIndex: main_tab.currentIndex
        Item {
            id: role_item
            RoleMain {
                id: role
                height: parent.height
                width: parent.width

                font_family: main_window.font_family
                font_size: main_window.font_size
            }
        }
        Item {
            id: equip_item
            EquipMain {
                id: equip
                height: parent.height
                width: parent.width

                font_family: main_window.font_family
                small_font_size: main_window.small_font_size
                font_size: main_window.font_size
            }
        }
    }
}
