onDomChange(function () {
    setTimeout(() => {
        $.applyDataMask('[data-mask');
    }, 125);
});

const validation = () => {
    var valid = true;
    $(".swal2-html-container form").find('[required]').each(function (index, element) {
        if (element.value.trim() == "") {
            valid = false;
            $(element).addClass("!border-red-600")
            $(element).parents('[data-tip]').addClass("tooltip-open").removeClass('before:!hidden after:!hidden');
        }

        if ($(element).attr("data-mask"))
            if (element.value.trim().length < $(element).attr("data-mask").length)
                if ($(element).attr("data-mask").length != 4) {
                    valid = false;
                    $(element).addClass("!border-red-600")
                    $(element).parents('[data-tip]').addClass("tooltip-open").removeClass('before:!hidden after:!hidden');
                }
    });

    return valid;
}

const validate = () => {
    $input = $('[name="senha"]');

    const alertInput = () => {
        $input.addClass("!border-red-600");
        $input.parents('[data-tip]').addClass("tooltip-bottom tooltip-open").removeClass('before:!hidden after:!hidden');

        return false;
    }

    const senha = $input.val().trim();

    if (senha == "")
        return alertInput();

    return true;
}

const validateSenha = () => {
    $input = $('[name="senhaNova"]');

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
    $input = $('[name="confirmaSenha"]');

    const alertInput = () => {
        $input.addClass("!border-red-600");
        $input.parents('[data-tip]').addClass("tooltip-open").removeClass('before:!hidden after:!hidden');

        return false;
    }

    if ($('[name="senhaNova"]').val().trim() != $input.val().trim())
        return alertInput();

    return true;
}


$(document).on('blur', '[name="mes"], [name="ano"]', function () {
    $item = $(this);
    $input = $item.parents('.mm-yy').find('[type="hidden"]');

    var vencimento = $input.val().split('-');
    vencimento[$item.attr('name') == 'mes' ? 1 : 0] = $item.val();

    $input.val(vencimento.join('-'));
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

$(document).on('blur', '[name="senha"]', validate);
$(document).on('blur', '[name="senhaNova"]', validateSenha);
$(document).on('blur', '[name="confirmaSenha"]', validateSenhaConfirma);

$(document).on('input', '[required]', function () {
    if (this.value.trim() != "") {
        $(this).removeClass("!border-red-600")
        $(this).parents('[data-tip]').addClass("before:!hidden after:!hidden")
    }
});

$(document).on('click', '[data-click="eye"]', function () {
    $button = $(this);
    $input = $button.parents('.form-input').find('input');

    $input.attr("type", $input.attr("type") == "password" ? "text" : "password");
    $button.find('i').toggleClass("fa-eye fa-eye-slash");
});

$(document).on('click', "#trocar-senha-cliente", function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: $button.getData(),
        url: "/componente/client/alterasenha",
        success: function (response) {
            Swal.fire({
                html: response,
                showCancelButton: true,
                reverseButtons: true,
                title: "Alterar senha.",
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                confirmButtonText: 'Alterar',
                cancelButtonText: 'Cancelar',
                allowEnterKey: false,
                didOpen: () => {
                    Swal.hideLoading();
                },
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    if (!validateSenha())
                        return Swal.showValidationMessage(`Sua senha precisa de pelo menos 8 caracteres, uma letra maiuscula e uma minúscula e conter pelo menos um caractere especial.`);

                    if (!validateSenhaConfirma())
                        return Swal.showValidationMessage(`As senhas não conferem.`);

                    const user = $(".swal2-html-container").find('form').serializeJson();

                    const response = await $.ajax({
                        url: '/confirma/senha/cliente',
                        type: 'POST',
                        data: { user: user }
                    });

                    if (response.confirm)
                        return user;

                    return Swal.showValidationMessage(`A senha informada não confere, por favor tente novamente!`);
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Alterando senha, aguarde.",
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: false,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    });

                    $.ajax({
                        type: "POST",
                        data: {
                            client: result.value,
                            senha: result.value.senhaNova,
                        },
                        url: "/alterar/senha/cliente",
                        success: function (response) {
                            Swal.fire({
                                icon: 'success',
                                title: "Sua senha foi alterada",
                                showConfirmButton: false,
                                customClass: {
                                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                                },
                                timer: 1500,
                                didOpen: () => {
                                    Swal.hideLoading();
                                }
                            });
                        },
                        error: function (response) {
                            console.log(response);
                        },
                    });
                }
            });
        },
        error: function (response) {
            console.log(response);
        },
    });
});

$(document).on('click', '[data-action="edita-endereco"]', function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: $button.getData(),
        url: "/componente/client/altera/endereco",
        success: function (response) {
            Swal.fire({
                html: response,
                width: 755,
                showCancelButton: true,
                reverseButtons: true,
                title: "Editar endereço.",
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                confirmButtonText: 'Salvar Edição',
                cancelButtonText: 'Cancelar',
                allowEnterKey: false,
                didOpen: () => {
                    Swal.hideLoading();
                },
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    if (!validation())
                        return Swal.showValidationMessage(`Todos os campos em vermelho precisam ser preenchidos.`);

                    const Address = $(".swal2-html-container").find('form').serializeJson();
                    console.log("Antes, ", Address)

                    const response = await $.ajax({
                        url: '/alterar/endereco/cliente',
                        type: 'POST',
                        data: { address: Address }
                    });

                    return response;
                },
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        icon: 'success',
                        title: "Endereço alterado",
                        showConfirmButton: false,
                        customClass: {
                            confirmButton: "!bg-[#ffcc00] !text-gray-800",
                        },
                        timer: 1500,
                        didOpen: () => {
                            Swal.hideLoading();
                        }
                    }).then(() => location.reload(true))
                }
            })
        },
        error: function (response) {
            console.log(response);
        },
    });
})

$(document).on('click', '#acicionar-cartao', function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: { Index: 1 },
        url: "/componente/client/adiciona/cartao",
        success: function (response) {
            Swal.fire({
                html: `<div class="checkout-steps-form-style-1" style="width: 500px; margin: auto;">
                        <form id="form-adiciona-cartao" class="text-start">
                            <input type="hidden" name="card[1].idCliente" value="${$button.data("id-cliente")}">
                            ${response}
                        </form>
                       </div>`,
                width: 575,
                showCancelButton: true,
                reverseButtons: true,
                title: "Adiciona novo cartão.",
                customClass: {
                    htmlContainer: '!overflow-hidden',
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                confirmButtonText: 'Cadastrar',
                cancelButtonText: 'Cancelar',
                allowEnterKey: false,
                didOpen: () => {
                    Swal.hideLoading();
                },
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    if (!validation())
                        return Swal.showValidationMessage(`Todos os campos em vermelho precisam ser preenchidos.`);

                    const form = $(".swal2-html-container").find('form').serializeJson();
                    var Cartao = {};

                    for (const key in form) {
                        if (Object.hasOwnProperty.call(form, key)) {
                            const value = form[key];
                            var chaves = key.split('.');
                            Cartao[chaves[1]] = value;
                        }
                    }

                    Cartao.Principal = form.mainCard == undefined ? false : true;

                    const response = await $.ajax({
                        url: '/cadastrar/novo/cartao',
                        type: 'POST',
                        data: { card: Cartao }
                    });

                    return response;
                },
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        icon: 'success',
                        title: "Cartão adicionado",
                        showConfirmButton: false,
                        customClass: {
                            confirmButton: "!bg-[#ffcc00] !text-gray-800",
                        },
                        timer: 1500,
                        didOpen: () => {
                            Swal.hideLoading();
                        }
                    }).then(() => location.reload(true))
                }
            })
        },
        error: function (response) {
            console.log(response);
        },
    });
})

$(document).on('click', '#acicionar-endereco', function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: { Index: 0 },
        url: "/componente/client/adiciona/endereco",
        success: function (response) {
            Swal.fire({
                html: `<div class="checkout-steps-form-style-1">
                        <form id="form-adiciona-endereco" class="text-start">
                            <input type="hidden" name="adresses[0].idCliente" value="${$button.data("id-cliente")}">
                            <div class="flex flex-wrap">
                                <div class="px-3">
                                    <div class="form-control">
                                        <label class="cursor-pointer label gap-3">
                                            <input type="checkbox" class="toggle toggle-secondary" name="adresses[0].principal" value="true" />
                                            <span class="label-text !text-sm">Endereço principal</span>
                                        </label>
                                    </div>
                                </div>

                                <div class="px-3">
                                    <div class="form-control">
                                        <label class="cursor-pointer label gap-3">
                                            <input type="checkbox" class="toggle toggle-secondary" name="adresses[0].cobranca"  value="true" />
                                            <span class="label-text !text-sm">Endereço de cobrança</span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            ${response}
                        </form>
                       </div>`,
                width: 755,
                showCancelButton: true,
                reverseButtons: true,
                title: "Adiciona novo endereço.",
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                confirmButtonText: 'Cadastrar',
                cancelButtonText: 'Cancelar',
                allowEnterKey: false,
                didOpen: () => {
                    Swal.hideLoading();
                },
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    if (!validation())
                        return Swal.showValidationMessage(`Todos os campos em vermelho precisam ser preenchidos.`);

                    const form = $(".swal2-html-container").find('form').serializeJson();
                    var Address = {};

                    for (const key in form) {
                        if (Object.hasOwnProperty.call(form, key)) {
                            const value = form[key];
                            var chaves = key.split('.');
                            Address[chaves[1]] = value;
                        }
                    }

                    const response = await $.ajax({
                        url: '/cadastrar/novo/endereco',
                        type: 'POST',
                        data: { address: Address }
                    });

                    return response;
                },
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        icon: 'success',
                        title: "Endereço adicionado",
                        showConfirmButton: false,
                        customClass: {
                            confirmButton: "!bg-[#ffcc00] !text-gray-800",
                        },
                        timer: 1500,
                        didOpen: () => {
                            Swal.hideLoading();
                        }
                    }).then(() => location.reload(true))
                }
            })
        },
        error: function (response) {
            console.log(response);
        },
    });
});

$(document).on('click', '[data-action="altera-cliente"]', function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: $button.getData(),
        url: "/componente/client/altera/cliente",
        success: function (response) {
            Swal.fire({
                html: response,
                width: 755,
                showCancelButton: true,
                reverseButtons: true,
                title: "Edita dados cadastrais.",
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                confirmButtonText: 'Salvar Edição',
                cancelButtonText: 'Cancelar',
                allowEnterKey: false,
                didOpen: () => {
                    Swal.hideLoading();
                },
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    if (!validation())
                        return Swal.showValidationMessage(`Todos os campos em vermelho precisam ser preenchidos.`);

                    const Client = $(".swal2-html-container").find('form').serializeJson();

                    const response = await $.ajax({
                        url: '/alterar/dados/cliente',
                        type: 'POST',
                        data: { client: Client }
                    });

                    return response;
                },
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        icon: 'success',
                        title: "Dados atualizados",
                        showConfirmButton: false,
                        customClass: {
                            confirmButton: "!bg-[#ffcc00] !text-gray-800",
                        },
                        timer: 1500,
                        didOpen: () => {
                            Swal.hideLoading();
                        }
                    }).then(() => location.reload(true))
                }
            })
        },
        error: function (response) {
            console.log(response);
        },
    });
})

$(document).on('click', '[data-id-cartao]', function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: $button.getData(),
        url: "/remove/cartao",
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: "Cartão Removido",
                showConfirmButton: false,
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                timer: 1500,
                didOpen: () => {
                    Swal.hideLoading();
                }
            }).then(() => location.reload(true))
        },
        error: function (response) {
            console.log(response);
        },
    });
})

$(document).on('click', '[data-action="remove-endereco"]', function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: $button.getData(),
        url: "/remove/endereco",
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: "Endereço Removido",
                showConfirmButton: false,
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                timer: 1500,
                didOpen: () => {
                    Swal.hideLoading();
                }
            }).then(() => location.reload(true))
        },
        error: function (response) {
            console.log(response);
        },
    });
})