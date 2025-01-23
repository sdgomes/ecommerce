onDomChange(function () {
    setTimeout(() => {
        $('.cartoes-slider')
            .not('.slick-initialized')
            .slick({
                centerMode: true,
                infinite: false,
                slidesToShow: 1,
                slidesToScroll: 1
            });

        $.applyDataMask('[data-mask');

        $(".por-cartao").maskMoney({
            decimal: ",",
            thousands: "."
        });
    }, 95);
});

$(document).on('click', '#estorno', function () {
    Swal.fire({
        position: "center",
        icon: "success",
        title: "Feito!",
        text: "Aguarde que em até 12h o seu estorno será feito e estará acessível na sua lista de descontos.",
        showConfirmButton: false,
        timer: 1500
    })
})

$(document).on('click', '#cancelar-transasao', PedidoAcoes)

var totalTravado;

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

$(document).on('click', '#refazer-pagamento', function () {
    $button = $(this);

    Swal.fire({
        title: "Aguarde",
        allowEscapeKey: false,
        allowEnterKey: false,
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: $button.getData(),
        url: "/componente/client/pagar/novamente",
        success: function (response) {
            Swal.fire({
                html: response,
                width: 500,
                showCancelButton: true,
                reverseButtons: true,
                title: "Pagamento.",
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                confirmButtonText: 'Concluir Pagamento',
                cancelButtonText: 'Cancelar',
                allowEnterKey: false,
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.hideLoading();
                },
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    const qntCartoes = $('.swal2-container [name="cartaoPagamento"]:checked').length;

                    if (qntCartoes == 0) {
                        return Swal.showValidationMessage(`Escolha pelo menos um cartão para efetuar o pagamento.`);
                    }

                    var cartoes = [];
                    $('.swal2-container [name="cartaoPagamento"]:checked').each(function (index, element) {
                        cartoes.push($(element).val())
                    });

                    return {
                        qntCartoes,
                        cartoes: (qntCartoes > 1 ? cartoes : [{
                            IdCartao: cartoes[0],
                            Total: $('.swal2-container [total-compra]').toFloat()
                        }]),
                        totalDescontos: $('.swal2-container [total-descontos]').toFloat(),
                        total: $('.swal2-container [total-compra]').toFloat(),
                        totalCompra: $('.swal2-container [total-compra]').text().replace(/R\$/g, '').toFloat()
                    };
                },
            }).then((result1) => {
                if (result1.isConfirmed) {
                    if (result1.value.qntCartoes > 1) {
                        var htmlCartoes = "";
                        result1.value.cartoes.forEach(card => {
                            htmlCartoes += `<div class="w-1/2 mb-3 px-3">
                                                        <div class="border rounded-lg p-5 text-start">
                                                            <div class="text-base !text-gray-800 font-bold w-full">
                                                                ${$(`#pagamentos input[value="${card}"]`).parents('.card-body')
                                    .find('[data-name="nome-cartao"]').text()}</div>
                                                            <div class="text-sm w-full">Número Cartão</div>
                                                            <div class="text-base w-full font-bold">${$(`input[value="${card}"]`).parent('label').find('.tracking-wider').text().trim()}</div>
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
                            html: `
                                                                    <div>
                                                                        <h1 id="total-pagar-cartao" class="font-bold text-3xl text-gray-800">R$ <span total-sem-atribuicao>${result1.value.totalCompra.toMoney()}</span></h1>
                                                                        <p class="w-1/2 mx-auto mb-4 font-bold text-sm">Total da compra sem atribuição. Ao adicionar um valor no cartão selecionado ele será subitraido do valor tatal.</p>
                                                                    </div>

                                                                    <div class="mb-3">
                                                                        <p>Escolha quais valores serão passados em cada cartão </p>
                                                                        <small>Lembre-se o valor minimo a ser paga em pelo menos um dos cartões é de R$ 10,00</small>
                                                                    </div>

                                                                    <form class="flex flex-wrap">
                                                                        ${htmlCartoes}
                                                                    </form>`,
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
                                totalTravado = result1.value.totalCompra
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
                            if (result.isConfirmed) {
                                processanovopagamento({
                                    ...$button.getData(),
                                    ...{
                                        Cartoes: result.value,
                                        Descontos: result1.value.totalDescontos,
                                        Total: result1.value.total
                                    }
                                })
                            }
                            else
                                console.log(false)
                        })
                    } else {
                        processanovopagamento({
                            ...$button.getData(),
                            ...{
                                Cartoes: result1.value.cartoes,
                                Descontos: result1.value.totalDescontos,
                                Total: result1.value.total
                            }
                        })
                    }
                }
            })
        },
        error: function (response) {
            console.log(response);
        },
    });
})

const processanovopagamento = (e) => {
    $.ajax({
        type: "POST",
        url: `/registra/novo/pagamento/transacao`,
        data: { Transaction: e },
        success: function (response) {
            if (response.success)
                location.reload()
        },
        error: function (response) {
            console.log(response);
        },
    });
}

$(document).on('keyup', '[name="motivoSolicitacao"]', function () {
    let palavras = $(this).val().length
    $('[data-target="motivo-solicitacao"]').html(palavras)

    if (palavras > 520)
        $('[data-target="motivo-solicitacao"]').addClass('text-red-600')
    else
        $('[data-target="motivo-solicitacao"]').removeClass('text-red-600')
})

$(document).on('change', '[data-target="solicitacao"]', function () {
    let validate = $('[data-target="solicitacao"]').length == $('[data-target="solicitacao"]:checked').length;
    $('#todos-solicitacao').prop("checked", validate)
})

$(document).on('change', '#todos-solicitacao', function () {
    if ($(this).prop("checked"))
        $('[data-target="solicitacao"]').check()
    else
        $('[data-target="solicitacao"]').uncheck()
})

$(document).on('click', '#solicitar-troca, #solicitar-devolucao', function () {
    $button = $(this);
    const data = $button.getData();

    Swal.fire({
        title: "Aguarde... Listando Itens",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    $.ajax({
        type: "POST",
        data: data,
        url: "/componente/client/solicitar",
        success: function (response) {
            Swal.fire({
                html: response,
                width: 905,
                showCancelButton: true,
                reverseButtons: true,
                title: data.tipo == "TROCA" ? "Solicitação de troca." : "Solicitação de devolução.",
                customClass: {
                    confirmButton: "!bg-[#ffcc00] !text-gray-800",
                },
                confirmButtonText: 'Fazer Solicitação',
                cancelButtonText: 'Cancelar',
                allowEnterKey: false,
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.hideLoading();
                },
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    try {
                        const itens = $("#from-solicitacao").serializeJsonComplex()

                        if (!itens.codigos)
                            return Swal.showValidationMessage(`Escolha pelo menos um item para fazer a solicitação`);

                        if (itens.motivoSolicitacao == "") {
                            return Swal.showValidationMessage(`É necessário informar o motivo da sua solicitação de troca.`);
                        }

                        if (itens.motivoSolicitacao.length > 520) {
                            return Swal.showValidationMessage(`Sua descrição passou de 520 caracteres por favor reduza a quantidade`);
                        }

                        const solicitacao = [];
                        itens.codigos.forEach(item => {
                            solicitacao.push({
                                ...$(`[value="${item}"]`).getData(),
                                ...{
                                    tipo: data.tipo,
                                    motivoSolicitacao: itens.motivoSolicitacao
                                }
                            })
                        });

                        const response = await $.ajax({
                            url: '/criar/nova/solicitacao',
                            type: 'POST',
                            data: { solicitacao }
                        });

                        if (response.data.sucesso)
                            return response.data;

                        return Swal.showValidationMessage(response.data.message);
                    } catch (error) {
                        console.log(error)
                        return Swal.showValidationMessage('Um erro inesperado contate o TI.');
                    }
                }
            }).then((result) => {
                if (result.isConfirmed)
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Feito!",
                        text: result.value.message,
                        showConfirmButton: false,
                        timer: 1500
                    }).then(() => {
                        const  codigo = cookie.Get("codigo");
                        location.href = `/cliente/perfil/${codigo}/${data.tipo == "TROCA" ? "trocas" : "devolucoes"}/${result.value.grupoCodigo}`
                    })
            });
        },
        error: function (response) {
            console.log(response);
        },
    });
})