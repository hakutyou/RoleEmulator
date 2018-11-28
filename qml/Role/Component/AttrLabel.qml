import QtQuick 2.9

Rectangle {
    property string label
    property string font_family
    property int font_size

    Text {
        height: parent.height
        width: parent.width

        text: label
        font.family: font_family
        font.pointSize: font_size
    }
}
