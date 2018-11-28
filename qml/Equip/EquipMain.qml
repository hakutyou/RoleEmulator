import QtQuick 2.9
import QtQuick.Layouts 1.3

Rectangle {
    id: equip_main

    property string font_family
    property int small_font_size
    property int font_size
    property string active_region
    Equips {
        id: equips
        height: parent.height
        width: 200

        font_family: equip_main.font_family
        font_size: equip_main.font_size
    }
    StackLayout {
        id: equip_stack
        x: equips.width
        height: parent.height
        width: parent.width - x

        currentIndex: 0
        Item {
            EquipList {
                id: equip_list
                height: parent.height
                width: parent.width

                font_family: equip_main.font_family
                small_font_size: equip_main.small_font_size
                font_size: equip_main.font_size
            }
        }
        Item {
            EquipShow {
                id: equip_show
                height: parent.height
                width: parent.width

                font_family: equip_main.font_family
                small_font_size: equip_main.small_font_size
                font_size: equip_main.font_size
            }
        }
    }

    ListModel {
        id: listModel
    }
}
