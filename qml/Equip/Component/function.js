function get_equip(list_model, config, button) {
    list_model.clear();
    equip_main.active_region = equipment.label;
    if (button & Qt.RightButton) { // right
        equip_show.keka = dmail.equip_detail(equipment.label, equip_ids[equipment.label]['index'])[0];
        equip_stack.currentIndex = 1;
    } else {
        list_model.append(dmail.usable_list(label, config['level'], config['menpai']));
        equip_stack.currentIndex = 0;
    }
}
