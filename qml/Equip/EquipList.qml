import QtQuick 2.9
import QtQml.Models 2.2

Rectangle {
    property string font_family
    property int small_font_size
    property int font_size
    DelegateModel {
        id: equip_list_model
        model: listModel

        delegate: Row {
            spacing: 20
            height: 64
            width: parent.width
            Image {
                height: parent.height
                width: parent.height
                source: {
                    var region;
                    if (icon === undefined) {
                        return dmail.root_path() + '/image/equip/empty.png';
                    }
                    if (equip_main.active_region === 'left_ring' ||
                            equip_main.active_region === 'right_ring') {
                        region = 'ring';
                    }
                    region = equip_main.active_region;
                    return dmail.root_path() + '/image/equip/' + region + '/' + icon + '.png';
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        equips.equip_ids[equip_main.active_region].index = index;
                        equips.equip_ids[equip_main.active_region].icon = icon;
                        // dmail.save
                        dmail.save_config('equip', [equips.equip_ids]);
                        equips.equip_ids = dmail.load_config('equip')[0];
                    }
                }
            }
            Column {
                height: parent.height
                Text {
                    height: parent.height * 2 / 3

                    text: name
                    font.family: font_family
                    font.pointSize: font_size
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Text {
                    height: parent.height / 3

                    text: desc
                    font.family: font_family
                    font.pointSize: small_font_size
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    color: 'grey'
                }
            }
        }
    }
    ListView {
        anchors.fill: parent
        model: equip_list_model
        clip: true
    }
}
