const toBool = (param) => {
    const string = typeof param == "string" ? param.toLowerCase().trim() : param;

    const isTrueSet = (string === 'true');
    const isFalseSet = (string === 'false');
    return isTrueSet || isFalseSet ? (string === 'true') : param
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function populate(frm, data) {
    $.each(data, async function (key, value) {
        $ctrl = $(frm).find(`[name$="${key}"]`);

        switch ($ctrl.prop("type")) {
            case "radio":
                $ctrl.each(function (index, element) {
                    if (toBool($(element).val()) == value)
                        $(element).prop("checked", true).change();
                });
                break;
            case "checkbox":
                $ctrl.each(function (index, element) {
                    $(element).prop("checked", value).change();
                });
                break;
            default:
                if ($ctrl.tagName == "SELECT") {
                    $ctrl.val(value).change();
                    await sleep(500);
                }
                else
                    $ctrl.val(value);
                break;
        }

        if ($ctrl.val().trim() != "") {
            $ctrl.removeClass("!border-red-600")
            $ctrl.parents('[data-tip]').removeClass("tooltip tooltip-open")
        }
    });
}