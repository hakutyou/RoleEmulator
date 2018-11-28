import QtQuick 2.9
import QtQuick.Controls 2.1
import 'function.js' as Script

Column {
    id: equipment
    width: 64

    property string label
    property string show_label: equips_row.show_label[label]
    property string font_family
    property int font_size

    property string icon: equips.equip_ids[label].icon
    Image {
        width: parent.width
        height: parent.width
        source: {
            if (icon === '')
                return dmail.root_path() + '/image/equip/' + 'empty.png';
            else
                return dmail.root_path() + '/image/equip/' + label + '/' + icon + '.png';
        }
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: Script.get_equip(listModel, role.config, mouse.button);
        }
    }
    Text {
        width: parent.width

        text: equipment.show_label
        font.family: font_family
        font.pointSize: font_size
        horizontalAlignment: Text.AlignHCenter
    }
}
