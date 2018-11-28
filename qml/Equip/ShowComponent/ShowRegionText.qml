import QtQuick 2.9

Text {
    visible: { val_min != '0' }
    width: parent.width
    // horizontalAlignment: Text.AlignHCenter

    property string desc
    property string val_min: '0'
    property string val_max: '0'
    property string font_family
    property int font_size
    text: '<font color="red">' + desc + ': </font>' + val_min + '-' + val_max
    font.family: font_family
    font.pointSize: font_size
}
