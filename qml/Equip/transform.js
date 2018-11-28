function default_get(keka, item, default_value) {
    if (keka === undefined || keka[item] === undefined)
        return default_value;
    return keka[item];
}

function quality_color(keka) {
    const ret =  {'0': '8d9091', '1': '63b458', '2': '3e9cd5',
        '3': '9b58a6', '4': 'e4c840', '5': 'f1b645'};
    if (keka === undefined || keka['quality'] === undefined || ret[keka['quality']] === undefined)
        return 'ffffff';
    return ret[keka['quality']];
}

function transform_menpai(keka) {
    const ret = {'0': 'ZW', '1': 'TB', '2': 'SW', '3': 'GB',
        '4': 'TM', '5': 'WD', '6': 'SL', '7': 'TX', '8': 'SD',
        '9': 'YH'};
    if (keka === undefined || keka['menpai'] === undefined || ret[keka['menpai']] === undefined)
        return 'ALL';
    return ret[keka['menpai']];
}

function cut_string(str, start, end) {
    return str.substring(start, str.length - end);
}
