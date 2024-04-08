const Favoritos = {
    getItems: function () {
        var items = localStorage.getItem("produtos-favoritos");
        return items == null ? [] : JSON.parse(items);
    },

    Carrega: function () {
        var items = this.getItems();

        items.forEach(favorito => {
            $(`[data-id-produto=${favorito.idProduto}]`).attr('data-favorito', true)
        });

        $("#favoritos").html(items.length)
    },

    Adicona: function (idProduto) {
        var items = this.getItems();

        var tempFavoritos = [...items, { idProduto: idProduto }]

        localStorage.setItem("produtos-favoritos", JSON.stringify(tempFavoritos));

        $("#favoritos").html(tempFavoritos.length)
    },

    Remove: function (idProduto) {
        var items = JSON.parse(localStorage.getItem("produtos-favoritos"))

        var tempFavoritos = items.filter((item) => item.idProduto != idProduto)

        localStorage.setItem("produtos-favoritos", JSON.stringify(tempFavoritos));

        $("#favoritos").html(tempFavoritos.length)
    }
}

Favoritos.Carrega();

const Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.onmouseenter = Swal.stopTimer;
        toast.onmouseleave = Swal.resumeTimer;
    }
});

function b64DecodeUnicode(str) {
    return decodeURIComponent(atob(str).split('').map(function (c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
}

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

$(document).ready(function () {
    const urlParams = new URLSearchParams(location.search);
    const error = urlParams.get("error");

    if (error != null && error != "") {
        Toast.fire({
            icon: "error",
            title: b64DecodeUnicode(error)
        });

        history.pushState({}, window.document.title, `${location.origin}${location.pathname}`);
    }
});

(function (window) {
    var last = +new Date();
    var delay = 100; // default delay

    // Manage event queue
    var stack = [];

    function callback() {
        var now = +new Date();
        if (now - last > delay) {
            for (var i = 0; i < stack.length; i++) {
                stack[i]();
            }
            last = now;
        }
    }

    // Public interface
    var onDomChange = function (fn, newdelay) {
        if (newdelay) delay = newdelay;
        stack.push(fn);
    };

    // Naive approach for compatibility
    function naive() {

        var last = document.getElementsByTagName('*');
        var lastlen = last.length;
        var timer = setTimeout(function check() {

            // get current state of the document
            var current = document.getElementsByTagName('*');
            var len = current.length;

            // if the length is different
            // it's fairly obvious
            if (len != lastlen) {
                // just make sure the loop finishes early
                last = [];
            }

            // go check every element in order
            for (var i = 0; i < len; i++) {
                if (current[i] !== last[i]) {
                    callback();
                    last = current;
                    lastlen = len;
                    break;
                }
            }

            // over, and over, and over again
            setTimeout(check, delay);

        }, delay);
    }

    //
    //  Check for mutation events support
    //

    var support = {};

    var el = document.documentElement;
    var remain = 3;

    // callback for the tests
    function decide() {
        if (support.DOMNodeInserted) {
            window.addEventListener("DOMContentLoaded", function () {
                if (support.DOMSubtreeModified) { // for FF 3+, Chrome
                    el.addEventListener('DOMSubtreeModified', callback, false);
                } else { // for FF 2, Safari, Opera 9.6+
                    el.addEventListener('DOMNodeInserted', callback, false);
                    el.addEventListener('DOMNodeRemoved', callback, false);
                }
            }, false);
        } else if (document.onpropertychange) { // for IE 5.5+
            document.onpropertychange = callback;
        } else { // fallback
            naive();
        }
    }

    // checks a particular event
    function test(event) {
        el.addEventListener(event, function fn() {
            support[event] = true;
            el.removeEventListener(event, fn, false);
            if (--remain === 0) decide();
        }, false);
    }

    // attach test events
    if (window.addEventListener) {
        test('DOMSubtreeModified');
        test('DOMNodeInserted');
        test('DOMNodeRemoved');
    } else {
        decide();
    }

    // do the dummy test
    var dummy = document.createElement("div");
    el.appendChild(dummy);
    el.removeChild(dummy);

    // expose
    window.onDomChange = onDomChange;
})(window);

$(document).on('click', '[data-action="favoritos"]', function () {
    $button = $(this);

    const idProduto = $button.attr('data-id-produto')
    const toggleFavorito = $button.attr('data-favorito').parseBool();
    $button.attr('data-favorito', !toggleFavorito);

    if (!toggleFavorito)
        Favoritos.Adicona(idProduto);
    else
        Favoritos.Remove(idProduto);
})

$(document).on("click", ".button-qnt", function () {
    $button = $(this);
    $input = $button.parents('.count-input').find(".input-qnt");

    var operador = $button.attr("data-operador");
    var qnt = parseInt($input.val());

    if (operador == "menos" && qnt > 1)
        $input.val(qnt - 1)

    if (operador == "mais")
        $input.val(qnt + 1)
});