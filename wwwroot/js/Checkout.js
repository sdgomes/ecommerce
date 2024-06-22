
document.addEventListener("DOMContentLoaded", function (event) {
    onDomChange(function () {
        setTimeout(() => {
            $.applyDataMask('[data-mask');

            $(".por-cartao").maskMoney({
                decimal: ",",
                thousands: "."
            });
        }, 125);
    });
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

$(document).on('click', '#novo-pagamento', function () {
    $button = $(this);
    const data = $button.getData();

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
                                                                                <input type="hidden" name="card[1].idCliente" value="${data.idCliente}">
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
                allowOutsideClick: false,
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
                    }).then(() => {
                        $.ajax({
                            type: "POST",
                            data: {
                                IdCliente: data.idCliente
                            },
                            url: "/componente/client/cartoes",
                            success: function (response) {
                                $("#container-cartoes").html(response)
                            },
                            error: function (response) {
                                console.log(response);
                            },
                        });
                    })
                }
            })
        },
        error: function (response) {
            console.log(response);
        },
    });
})

$(document).on('click', '#novo-endereco', function () {
    $button = $(this);
    const data = $button.getData();

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
                        <input type="hidden" name="adresses[0].idCliente" value="${data.idCliente}">
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
                allowOutsideClick: false,
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
                    }).then(() => {
                        $.ajax({
                            type: "POST",
                            data: {
                                Enderecos: [result.value.address]
                            },
                            url: "/componente/client/lista/endereco",
                            success: function (response) {
                                $card = $(response)
                                $card.find('[name="enderecoEntrega"]').prop("checked", true)
                                $("#container-enderecos").append($card)

                            },
                            error: function (response) {
                                console.log(response);
                            },
                        });
                    })
                }
            })
        },
        error: function (response) {
            console.log(response);
        },
    });
})

function alerta(cards) {
    return new Promise((resolve, reject) => {
        let formHtml = "";
        cards.forEach(card => {
            formHtml += `<div class="w-1/2 mb-3 px-3">
                <div class="border rounded-lg p-5 text-start">
                    <div class="text-base !text-gray-800 font-bold w-full">
                        ${$(`#pagamentos input[value="${card}"]`).parents('.card-body').find('[data-name="nome-cartao"]').text()}</div>
                    <div class="text-sm w-full">Número Cartão</div>
                    <div class="text-base w-full font-bold">
                        ${$(`input[value="${card}"]`).parent('label').find('.tracking-wider').text().trim()}
                    </div>
                    <label class="form-control w-full">
                        <div class="label">
                            <span class="label-text-alt">Quantia que será passada nessa cartção?</span>
                        </div>
                        <input name="${card}" type="text" class="por-cartao input input-bordered w-full" />
                    </label>
                </div>
            </div>`
        });

        Swal.fire({
            title: "Infromações de pagamento.",
            html: `<div>
                <div>
                    <h1 id="total-pagar-cartao" class="font-bold text-3xl text-gray-800">R$ <span total-sem-atribuicao>${$('[total-compra]').text().replace(/R\$/g, '').toFloat().toMoney()}</span></h1>
                    <p class="w-1/2 mx-auto mb-4 font-bold text-sm">Total da compra sem atribuição. Ao adicionar um valor no cartão selecionado ele será subitraido do valor tatal.</p>
                </div>
                <div class="mb-3">
                    <p>Escolha quais valores serão passados em cada cartão </p>
                    <small>Lembre-se o valor minimo a ser paga em pelo menos um dos cartões é de R$ 10,00</small>
                </div>
                <form class="flex flex-wrap">
                    ${formHtml}
                </form>
            </div>`,
            width: 645,
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            showCancelButton: true,
            confirmButtonText: "Confirmar",
            cancelButtonText: "Cancelar",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
            didOpen: () => {
                totalTravado = $('[total-compra]').text().replace(/R\$/g, '').toFloat()
            },
            preConfirm: () => {
                try {
                    var validate = false;
                    var allInput = 0;

                    $(".por-cartao").each(function (index, element) {
                        if ($(element).val() == "") {
                            Swal.showValidationMessage('Todos os cartões devem ter um valor minimo de R$ 10,00');
                            validate = true;
                            return false;
                        }

                        if ($(element).val().toFloat() < 10) {
                            Swal.showValidationMessage('Todos os cartões devem ter um valor minimo de R$ 10,00');
                            validate = true;
                            return false;
                        }

                        allInput += $(element).val().toFloat();
                    });

                    if (validate)
                        return false;

                    allInput = allInput.toTwo()

                    if (allInput > totalTravado) {
                        Swal.showValidationMessage('Os valores informados do pagamento é maior que o valor da compra');
                        validate = true;
                        return;
                    }

                    if (allInput < totalTravado) {
                        Swal.showValidationMessage('Os valores informados do pagamento é menor que o valor da compra');
                        validate = true;
                        return;
                    }

                    if (validate)
                        return false;

                    var retornoCards = []
                    const cardsOBJ = $(".swal2-html-container").find('form').serializeJson();
                    for (const key in cardsOBJ) {
                        if (Object.hasOwnProperty.call(cardsOBJ, key)) {
                            const value = cardsOBJ[key];
                            retornoCards.push({
                                IdCartao: key,
                                Total: value.toFloat().toMoney()
                            })
                        }
                    }

                    return retornoCards;
                } catch (error) {
                    console.log(error);

                    const result = error.responseJSON;
                    Swal.showValidationMessage(`${result.message}`);
                }
            }
        }).then((result) => {
            if (result.isConfirmed)
                resolve(result.value)
            else
                reject(false)
        })
    });
}

$(document).ready(function () {
    $('form').keypress(function (e) {
        if ((e.keyCode == 10) || (e.keyCode == 13)) {
            e.preventDefault();
        }
    });
});



var totalTravado;
var descontoPlus = 0;

$(document).on("keyup", ".por-cartao", function (e) {
    const numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    var total = $('[total-sem-atribuicao]').text().toFloat();
    var allInput = 0;

    $(".por-cartao").each(function (index, element) {
        if ($(element).val() != "")
            allInput += $(element).val().toFloat();
    });

    allInput = allInput.toTwo()

    $('[total-sem-atribuicao]').html((totalTravado - allInput).toMoney());

    if (totalTravado - allInput < 0)
        $('#total-pagar-cartao').removeClass("text-green-500 text-gray-800").addClass("text-red-500")
    else if (totalTravado - allInput == 0)
        $('#total-pagar-cartao').removeClass("text-gray-800 text-red-500").addClass("text-green-500")
    else
        $('#total-pagar-cartao').removeClass("text-green-500 text-red-500").addClass("text-gray-800")
});

$(document).on("click", '[comprar]', async function () {
    if ($.isEmptyObject($("#lista-produtos").serializeJsonComplex())) {
        Swal.fire({
            icon: 'warning',
            title: "Atenção!",
            text: 'Sua lista de compras está vazia, por favor adicione itens.',
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            confirmButtonText: "Tentar novamente",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
        });
        return false;
    }

    if ($('[name="enderecoEntrega"]:checked').length == 0) {
        Swal.fire({
            icon: 'warning',
            title: "Atenção!",
            text: 'Selecione um endereço para entrega.',
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            confirmButtonText: "Tentar novamente",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
        });
        return false;
    }

    if ($('[name="cartaoPagamento"]:checked').length == 0) {
        Swal.fire({
            icon: 'warning',
            title: "Atenção!",
            text: 'Escolha pelo menos um cartão para efetuar o pagamento.',
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            confirmButtonText: "Tentar novamente",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
        });

        return false;
    }

    if ($('[calculo-frete]').val() == "") {
        Swal.fire({
            icon: 'warning',
            title: "Atenção!",
            text: 'Informe seu CEP para calculo de frete.',
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            confirmButtonText: "Tentar novamente",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
        });

        return false;
    }

    if ($('[valor-frete]').text().replace(/R\$/g, '').toFloat() == 0) {
        Swal.fire({
            icon: 'warning',
            title: "Atenção!",
            text: 'Por favor, clique em Calcular frete.',
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            confirmButtonText: "Tentar novamente",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
        });

        return false;
    }

    var CEPEndereco = $('[name="enderecoEntrega"]:checked').parents('.card-body').find('[data-type="CEP"]').text();
    var calculoCEP = $('[calculo-frete]').val();

    if (CEPEndereco != calculoCEP) {
        Swal.fire({
            icon: 'warning',
            title: "Atenção!",
            text: 'O CEP informado é diferente do que foi selecionado no endereço de entrega.',
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            confirmButtonText: "Tentar novamente",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
        });

        return false;
    }

    var cartoes = [];
    $('[name="cartaoPagamento"]:checked').each(function (index, element) {
        cartoes.push($(element).val())
    });

    var validation = false;
    var EnviaCartoes = [];

    if (cartoes.length > 1) {
        EnviaCartoes = await alerta(cartoes)

        if (EnviaCartoes == false)
            return false;
    }
    else
        EnviaCartoes.push({
            IdCartao: cartoes[0],
            Total: $('[total-compra]').toFloat()
        })

    if (validation)
        return false;

    var transaction = {
        ...$("#lista-produtos").serializeJsonComplex(),
        ...{
            Cartoes: EnviaCartoes,
            IdEndereco: $('[name="enderecoEntrega"]:checked').val(),
            IdCliente: $('[name="idCliente"]').val(),
            Subtotal: $('[menu-total-amount]').toFloat(),
            Frete: $('[valor-frete]').toFloat(),
            Descontos: $('[total-descontos]').toFloat(),
            Total: $('[total-compra]').toFloat()
        }
    }

    $.ajax({
        type: "POST",
        url: `/registra/transacao`,
        data: { Transaction: transaction, Codigo: $('[name="codigo"]').val() },
        success: function (data) {
            localStorage.setItem('transacao', JSON.stringify(data))
            localStorage.removeItem('produtos-carrinho')
            localStorage.removeItem('frete')

            location.href = data.url;
        },
        error: function (response) {
            console.log(response);
        },
    });

})

$(document).on("click", '[data-action="frete"]', function () {
    $button = $(this);
    $input = $button.parents('form').find('input');

    if ($input.val().trim() == "")
        Toast.fire({
            icon: "error",
            title: "O campo CEP precisa ser preenchido."
        });
    else {
        $button.html(`<span class="loading loading-spinner loading-sm"></span> Calculando`)

        $.ajax({
            type: "GET",
            url: `/calcular/frete/${$input.val()}`,
            success: function (data) {
                $button.html(`Cálcular frete`)

                Toast.fire({
                    icon: data.response.success ? "success" : "error",
                    title: data.response.message
                });

                $('.frete').html(`R$ ${data.response.preco.toMoney()}`)
                atualizaTabelaPrecos()
            },
            error: function (response) {
                console.log(response);
            },
        });
    }
})

$(document).on("click", "[data-action='desconto'], [data-action='cupons']", function () {
    $button = $(this);
    $input = $button.parents('form').find('input');

    const buttonData = $button.getData();

    if ($input.val().trim() == "")
        Toast.fire({
            icon: "error",
            title: "Informe um código para aplicar o cupom."
        });
    else {
        $button.html(`<span class="loading loading-spinner loading-sm"></span> Aguarde...`)

        $.ajax({
            type: "GET",
            url: `/buscar/desconto/${$input.val()}/${buttonData.action.toUpperCase()}`,
            success: function (data) {
                $button.html(buttonData.action == 'cupons' ? 'Aplicar' : 'Resgatar')

                Toast.fire({
                    icon: data.response.success ? "success" : "error",
                    title: data.response.message
                });

                if (buttonData.action == 'cupons') {
                    $('.cupons').html(`${data.response.desconto}%`)
                }else{
                    descontoPlus = data.response.desconto
                }

                atualizaTabelaPrecos()
            },
            error: function (response) {
                console.log(response);
            },
        });
    }
})
