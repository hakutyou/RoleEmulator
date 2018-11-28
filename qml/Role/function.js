function check_menpai_sex(index) {
    role_menpai.disabled_list = [6];
    if (role_sex.default_choice === 1) { // Man
        role_menpai.disabled_list = [6, 7];
        if (role_menpai.default_choice === 7)
            role_menpai.default_choice = 0
    }
}
