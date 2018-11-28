function save_config(config, attr, value) {
    config[attr] = value;
    // dmail.save
    dmail.save_config('role', [main_role.config])
}

function check_disable_item(disabled_list, index) {
    return disabled_list.indexOf(index) < 0;
}
