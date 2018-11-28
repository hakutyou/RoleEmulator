import QtQuick 2.9

Text {
    visible: { val != '0' && val != '' }
    width: parent.width
    // horizontalAlignment: Text.AlignHCenter

    property string desc
    property string val: '0'
    property string font_family
    property int font_size
    text: '<font color="red">' + desc + ': </font>' + val
    font.family: font_family
    font.pointSize: font_size
}
