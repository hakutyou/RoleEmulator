import QtQuick 2.9
import 'function.js' as Script

Row {
    id: attr_input

    property string label
    property string show_label: role.show_label[label]
    property string default_value: main_role.config[label]
    property string font_family
    property int font_size
    property var limit_regExp: /.*/

    AttrLabel {
        id: attr_label
        height: parent.height
        width: parent.width / 4

        label: show_label
        font_family: attr_input.font_family
        font_size: attr_input.font_size
    }

    Rectangle {
        x: attr_label.width
        height: parent.height
        width: parent.width - x

        border.width: 2
        border.color: 'grey'
        TextInput {
            id: text_input
            x: 5
            height: parent.height
            width: parent.width - 10

            text: default_value
            font.family: font_family
            font.pointSize: font_size
            verticalAlignment: Text.AlignVCenter
            validator: RegExpValidator{ regExp: limit_regExp }
            onTextChanged: Script.save_config(main_role.config, label, text_input.text)
        }
    }
}
