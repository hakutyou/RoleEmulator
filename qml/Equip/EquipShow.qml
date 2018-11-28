import QtQuick 2.9
import 'ShowComponent'
import 'transform.js' as Transform

Column {
    property string font_family
    property int small_font_size
    property int font_size
    property var keka
    Row {
        height: 64
        width: parent.width
        Image {
            id: show_image
            height: parent.height
            width: parent.height

            source: {
                const prefix = dmail.root_path() + '/image/equip/';
                if (keka === undefined || keka.icon === undefined)
                    return prefix + 'empty.png';
                else
                    return prefix + equip_main.active_region + '/' + keka.icon + '.png';
            }
        }
        Column {
            x: 70
            width: parent.width - show_image.width

            spacing: 3
            ShowName {
                color: Transform.quality_color(keka)
                name: Transform.default_get(keka, 'name', qsTr('unnamed'))
                font_family: equip_show.font_family
                font_size: equip_show.font_size
            }
            Repeater {
                model: [{desc: qsTr('MenPai'), val: qsTranslate('RoleMain', Transform.transform_menpai(keka))},
                    {desc: qsTr('EvalLv'), val: Transform.default_get(keka, 'evaluationLV', '0')}]
                ShowText {
                    desc: modelData.desc
                    val: modelData.val
                    font_family: equip_show.font_family
                    font_size: equip_show.font_size
                }
            }
        }
    }
    Repeater {
        property var pos_translate_addition: [QT_TRANSLATE_NOOP('Equips', 'JieZhi')]
        model: [{desc: qsTr('Lv'), val: Transform.default_get(keka, 'limitLVMin', '0')},
            {desc: qsTr('Pos'), val: qsTranslate('Equips', (Transform.default_get(keka, 'equipPos', '')))},
            {desc: qsTr('Dur'), val: Transform.cut_string(
                                         Transform.default_get(keka, 'durable', '0'), 0, 1)}]
        ShowText {
            desc: modelData.desc
            val: modelData.val
            font_family: equip_show.font_family
            font_size: equip_show.font_size
        }
    }
    Repeater {
        model: [{desc: qsTr('Wg'), val_min: Transform.default_get(keka, 'wgMin', 0),
                val_max: Transform.default_get(keka, 'wgMax', 0)},
            {desc: qsTr('Ng'), val_min: Transform.default_get(keka, 'ngMin', 0),
                val_max: Transform.default_get(keka, 'ngMax', 0)}]
        ShowRegionText {
            desc: modelData.desc
            val_min: modelData.val_min
            val_max: modelData.val_max
            font_family: equip_show.font_family
            font_size: equip_show.font_size
        }
    }
}
