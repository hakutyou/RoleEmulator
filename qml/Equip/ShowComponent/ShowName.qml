import QtQuick 2.9

Text {
    width: parent.width
    // horizontalAlignment: Text.AlignHCenter

    property string color
    property string name
    property string font_family
    property int font_size
    text: '<font color="#' + color + '">' + name + '</font>'
    font.family: font_family
    font.pointSize: font_size
}
