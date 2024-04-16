const toFloat = (palavra) => {
    return parseFloat(palavra.toString().replace(/\./g, '').replace(/\,/g, '.'));
}

const currency = (number) => {
    return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(number)
}

const Carrinho = {
    getItems: function () {
        var items = localStorage.getItem("produtos-carrinho")
        return items == null ? [] : JSON.parse(items);
    },

    AtualizaFreCalculos: function () {
        var items = this.getItems();

        var frete = localStorage.getItem("frete");
        frete = frete == null ? 0 : frete;

        const subtotal = items.length == 0 ? 0 : items.map((item) => (item.qntCompra * toFloat(item.preco))).reduce((prev, current) => prev + current);
        $("[menu-total-amount]").html(currency(subtotal))

        $('[valor-frete]').html(currency(frete))

        var descontos = items.length == 0 ? 0 : items.map((item) => toFloat(item.desconto)).reduce((prev, current) => prev + current);
        
        $('[total-descontos]').html(currency(descontos))

        $('[total-compra]').html(currency((subtotal + parseFloat(frete)) - descontos))

        localStorage.removeItem("frete")
    },

    AtualizaQuantidade: function (idProduto, qntCompra) {
        var items = this.getItems();
        var tempCarrinho = items.map((item) => {
            if (item.idProduto == idProduto)
                item.qntCompra = qntCompra

            return item
        })

        localStorage.setItem("produtos-carrinho", JSON.stringify(tempCarrinho));

        this.Carrega()
    },

    Carrega: function () {
        var items = this.getItems();

        $("#carrinho, #carrinho-items-count").html(items.length)

        $("#carrinho-items").empty();

        items.map((item, index) => {
            $(`[preco-unitario="${item.idProduto}"]`).html(currency(parseInt(item.qntCompra) * parseFloat(item.preco)))

            if (index < 3) {
                $("#carrinho-items").append(`<li class="relative">
                            <button class="!text-white right-0 btn btn-xs btn-error btn-circle absolute remove-carrinho" data-id-produto="${item.idProduto}">
                                <i class="fa-light fa-xmark"></i>
                            </button>
                            
                            <div class="cart-img-head">
                                <a class="cart-img" href="https://localhost:44388/produtos/${item.tipoProduto}/${item.subcategoria}/detalhes/${item.idProduto}">
                                    <img src="${item.imagem}" alt="...">
                                </a>
                            </div>

                            <div class="content">
                                <h4>
                                    <a class="line-clamp-2" href="https://localhost:44388/produtos/${item.tipoProduto}/${item.subcategoria}/detalhes/${item.idProduto}">
                                        ${item.nome}
                                    </a>
                                </h4>
                                <p class="quantity">${item.qntCompra}x - <span class="amount">${currency(parseInt(item.qntCompra) * parseFloat(item.preco))}</span></p>
                            </div>
                        </li>`)
            }
        });

        this.AtualizaFreCalculos()
    },

    Adicona: function ({ idProduto, qntCompra, imagem, preco, nome, tipoProduto, subcategoria, desconto }) {
        var items = this.getItems();

        if (items.length == 0 || !items.some((item) => item.idProduto == idProduto)) {

            var tempCarrinho = [...items, { idProduto, qntCompra, imagem, preco, nome, tipoProduto, subcategoria, desconto }]

            localStorage.setItem("produtos-carrinho", JSON.stringify(tempCarrinho));

            $("#carrinho, #carrinho-items-count").html(tempCarrinho.length)

            this.Carrega()
        }
    },

    Remove: function (idProduto) {
        var items = JSON.parse(localStorage.getItem("produtos-carrinho"))

        var tempCarrinho = items.filter((item) => item.idProduto != idProduto)

        localStorage.setItem("produtos-carrinho", JSON.stringify(tempCarrinho));

        $("#carrinho, #carrinho-items-count").html(tempCarrinho.length)

        this.Carrega()
    }
}

Carrinho.Carrega();

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
    var current = 0;

    if (operador == "menos")
        current = (qnt - 1)

    if (operador == "mais")
        current = (qnt + 1)

    if (current >= 1) {
        $input.val(current)

        var data = $button.data();
        if (data.idProduto)
            Carrinho.AtualizaQuantidade(data.idProduto, current)

        if (data.single)
            $button.parents('.top-area').find('[data-action="carrinho"]').attr('data-qnt-compra', current)
    }
});

$(document).on("click", '[data-action="carrinho"]', function () {
    $button = $(this);

    const data = $button.data();
    Carrinho.Adicona(data);

    $button.html(`<span class="loading loading-spinner loading-sm"></span> Carregando`)
    setTimeout(() => {
        $button.html(`<i class="fa-solid fa-check"></i> Adicionado`);
        setTimeout(() => {
            $button.html(`<i class="fa-light fa-cart-circle-plus text-sm"></i> Carrinho`)
        }, 325);
    }, 325);
})

$(document).on("click", ".remove-carrinho", function () {
    $(this).parent().remove();
    Carrinho.Remove($(this).attr("data-id-produto"));
});

$(document).on("click", ".remove-item-carrinho", function () {
    $(this).parents(".cart-single-list").remove();
    Carrinho.Remove($(this).attr("data-id-produto"));
})

$(document).on('click', '[data-action="finalizar-carrinho"]', function (e) {
    e.preventDefault();
    AlertFunalizar();
})

const AlertFunalizar = () => {
    Swal.fire({
        title: "Caso você sejá cliente informe seu código!",
        input: "text",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        inputAttributes: {
            autocapitalize: "off",
            autocomplete: "off"
        },
        showCancelButton: true,
        showDenyButton: true,
        confirmButtonText: "Ir para compra",
        denyButtonText: "Criar Cadastro",
        cancelButtonText: 'Cancelar',
        showLoaderOnConfirm: true,
        reverseButtons: true,
        customClass: {
            confirmButton: "!bg-[#130235] !twxt-white",
            denyButton: "!bg-[#ffcc00] !text-gray-800",
        },
        preConfirm: async (Codigo) => {
            try {
                if (Codigo == "" || Codigo == null) {
                    Swal.showValidationMessage(`Informe um código de cliente`);
                    return false;
                }

                const response = await $.ajax({
                    url: `/buscar/cliente/${Codigo}`,
                    type: 'POST'
                });

                return response;
            } catch (error) {
                console.log(error);
                Swal.showValidationMessage(`Request failed: ${error}`);
            }
        },
    }).then((result) => {
        if (result.isConfirmed) {
            if (result.value.isCliente)
                location.href = `/finalizar?Codigo=${result.value.codigo}`                    

            else if (!result.value.isCliente)
                Swal.fire({
                    icon: 'warning',
                    title: "Atenção!",
                    text: 'Seu código não é válido ou foi digitado errado.',
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    showCancelButton: true,
                    showDenyButton: true,
                    denyButtonText: "Ir assim mesmo",
                    confirmButtonText: "Tentar novamente",
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true,
                    customClass: {
                        confirmButton: "!bg-[#ffcc00] !text-gray-800",
                        denyButton: "!bg-[#130235] !twxt-white",
                    },
                }).then((result) => {
                    if (result.isConfirmed)
                        AlertFunalizar()
                    else if (result.isDenied)
                        location.href = `/finalizar`
                })
        }
        else if (result.isDenied)
            location.href = `/finalizar`
    });
}