import QtQuick 2.9
import QtQuick.Controls 2.4
import 'function.js' as Script

Row {
    id: attr_combo

    property string label
    property var choices
    property string show_label: role.show_label[label]
    property int default_choice: main_role.config[label]
    property var index_changed: function(index) {}
    property var disabled_list: []
    property string font_family
    property int font_size
    AttrLabel {
        id: attr_label
        height: parent.height
        width: parent.width / 4

        label: show_label
        font_family: attr_combo.font_family
        font_size: attr_combo.font_size
    }

    Rectangle {
        x: attr_label.width
        height: parent.height
        width: parent.width - x

        ComboBox {
            height: parent.height
            width: parent.width

            font.family: font_family
            font.pointSize: font_size
            model: choices
            currentIndex: default_choice
            delegate: ItemDelegate {  // down-drop
                width: parent.width

                text: modelData
                font.family: font_family
                font.pointSize: font_size
                enabled: Script.check_disable_item(disabled_list, index)
            }
            onCurrentIndexChanged: {
                default_choice = currentIndex;  // refresh menpai
                Script.save_config(main_role.config, label, currentIndex);
                attr_combo.index_changed(currentIndex)
            }
        }
    }
}
