$(function () {
    setTimeout(() => {
        const urlParams = new URLSearchParams(location.search);

        const produtos = urlParams.get("Produtos");
        if (produtos != null && produtos != "") {
            const newAction = $("body > main > div.my-10.px-5.checkout-steps-form-style-1 > form").attr('action')
            $("body > main > div.my-10.px-5.checkout-steps-form-style-1 > form").attr('action', `${newAction}${produtos}`)
        }
    }, 125);
});

onDomChange(function () {
    setTimeout(() => {
        $.applyDataMask('[data-mask');
    }, 125);
});

$(document).ready(function () {
    $('form').bind("keypress", function (e) {
        if ((e.keyCode == 10) || (e.keyCode == 13)) {
            e.preventDefault();
        }
    });
});

$(document).on('blur', '[name="mes"], [name="ano"]', function () {
    $item = $(this);
    $input = $item.parents('.mm-yy').find('[type="hidden"]');

    var vencimento = $input.val().split('-');
    vencimento[$item.attr('name') == 'mes' ? 1 : 0] = $item.val();

    $input.val(vencimento.join('-'));
});

const AddressReorder = () => {
    $(".address-capsule").each(function (index, element) {
        $(element).find('[name^="address"]').each(function (_, item) {
            const name = $(item).attr("name");
            $(item).attr("name", `adresses[${index}].${name.split('.')[1]}`)
        });
    });
}

const CardReorder = () => {
    $(".checkout-payment-form").each(function (index, element) {
        $(element).find('[name^="card"]').each(function (_, item) {
            const name = $(item).attr("name");
            $(item).attr("name", `cards[${index}].${name.split('.')[1]}`)
        });
    });
}

$(document).on("click", '[data-click="remove"]', function () {
    $(this).parents('[data-target="removible"]').remove();
    AddressReorder();
});

$(document).on("click", '[data-click="remove-card"]', function () {
    $(this).parents('[data-target="removible"]').remove();
    CardReorder();
});

$(document).on('click', '#novo-cartao', function () {
    $.ajax({
        type: "POST",
        data: {
            Index: $('.checkout-payment-form').length
        },
        url: "/componente/client/adiciona/cartao",
        success: function (response) {
            $("#container-cartao").append(`<div data-target="removible" class="px-3 w-1/2">${response}</div>`)
        },
        error: function (response) {
            console.log(response);
        },
    });
});

$(document).on('click', '#novo-endereco', function () {
    $.ajax({
        type: "POST",
        data: {
            Index: $('[data-mask="00000-000"]').length
        },
        url: "/componente/client/adiciona/endereco",
        success: function (response) {
            $("#container").append(`<div data-target="removible" class="mt-5 relative"><hr class="mt-10"><button type="button" data-click="remove" class="absolute top-4 right-4 btn btn-circle btn-error btn-sm"><i class="fa-solid fa-xmark"></i></button>${response}</div>`)
        },
        error: function (response) {
            console.log(response);
        },
    });
});

$cobranca = $("#item-cobranca").clone();
$(document).on('change', '#endereco-cobranca', function () {
    $input = $(this);

    $('#conditional-next-step').attr('data-index', !$input.prop("checked") ? 3 : 4);
    $('[name="adresses[0].cobranca"]').val($input.prop("checked"));
    $("#item-cobranca").parents('.collapse').toggle(!$input.prop("checked"));

    if ($input.prop("checked"))
        $("#item-cobranca").empty();
    else
        $("#item-cobranca").html($cobranca.html());

    AddressReorder();
});

document.querySelector('#submit').addEventListener('click', function (event) {
    const urlParams = new URLSearchParams(location.search);
    const param = urlParams.get("finalizar");

    if (param != null && param != "")
        if (param.parseBool())
            $('[name="retorno"]').val(true);

    if (validation($('form')) && validateSenha() && validateSenhaConfirma()) {
        return true;
    }

    event.preventDefault();
    return false;
});

$(document).on('change', '[required]', function () {
    if (this.value.trim() != "") {
        $(this).removeClass("!border-red-600")
        $(this).parents('[data-tip]').addClass("before:!hidden after:!hidden")
    }
});

$(document).on('input', '[required]', function () {
    if (this.value.trim() != "") {
        $(this).removeClass("!border-red-600")
        $(this).parents('[data-tip]').addClass("before:!hidden after:!hidden")
    }
});

const validation = ($item) => {
    var valid = true;
    $item.find('[required]').each(function (index, element) {
        if (element.value.trim() == "") {
            valid = false;
            $(element).addClass("!border-red-600")
            $(element).parents('[data-tip]').addClass("tooltip-open").removeClass('before:!hidden after:!hidden');
        }
    });

    return valid;
}

$(document).on('click', '[data-action="next"]', function () {
    $button = $(this);

    if (validation($button.parents('.collapse')))
        $('[name="accordion"]').eq($button.attr('data-index')).check();
});

$(document).on('click', '.viacep', function () {
    $button = $(this);
    $button.disabled().html('<span class="loading loading-spinner loading-sm"></span>');

    fetch(`https://viacep.com.br/ws/${$button.parent('.form-input').find('input').val()}/json/`)
        .then(response => {
            return response.json();
        })
        .then(data => {
            const conteudo = {
                cep: data.cep,
                logradouro: data.logradouro,
                complemento: data.complemento,
                bairro: data.bairro,
                cidade: data.localidade,
                estado: data.uf,
                pais: "Brasil",
            }

            populate($button.parents(".address-capsule"), conteudo);

        }).catch(error => {
            console.error(error);
        }).finally(function () {
            $button.enabled().html('<i class="fa-regular fa-magnifying-glass"></i>');
        });
});

const validateSenha = () => {
    $input = $('[name="client.senha"]');

    const alertInput = () => {
        $input.addClass("!border-red-600");
        $input.parents('[data-tip]').addClass("tooltip-open").removeClass('before:!hidden after:!hidden');

        return false;
    }

    const senha = $input.val().trim();

    if (senha == "" || senha.length < 8)
        return alertInput();

    if (senha.search(/[a-z]/g) == -1 || senha.search(/[A-Z]/g) == -1)
        return alertInput();

    if (senha.search(/[0-9]/g) == -1 || senha.search(/[.!@#$%^&*()_+-=]/g) == -1)
        return alertInput();

    return true;
}

const validateSenhaConfirma = () => {
    $input = $('[name="client.confirmaSenha"]');

    const alertInput = () => {
        $input.addClass("!border-red-600");
        $input.parents('[data-tip]').addClass("tooltip-open").removeClass('before:!hidden after:!hidden');

        return false;
    }

    if ($('[name="client.senha"]').val().trim() != $input.val().trim())
        return alertInput();

    return true;
}

$(document).on('blur', '[name="client.senha"]', function () {
    validateSenha();
});

$(document).on('blur', '[name="client.confirmaSenha"]', function () {
    validateSenhaConfirma();
});

$(document).on('click', '[data-click="eye"]', function () {
    $button = $(this);
    $input = $button.parents('.form-input').find('input');

    $input.attr("type", $input.attr("type") == "password" ? "text" : "password");
    $button.find('i').toggleClass("fa-eye fa-eye-slash");
});
