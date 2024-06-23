$(document).ready(function () {
    $('#chat-container').animate({ scrollTop: $('#chat-container')[0].scrollHeight });

    $("#serach-conversa").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("[data-id-notificacao]").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});

$(document).on('click', '#envia-conversa', function () {
    let chat = $(this).getData();
    let mensagem = $('[name="mensagem"]').val().trim();

    if (mensagem == "") {
        Swal.fire({
            icon: 'warning',
            title: "Atenção!",
            text: 'Escreva uma mensagem antes de enviar.',
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            timer: 500,
            confirmButtonText: "Tentar novamente",
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            },
        });

        return false;
    }

    $('[name="mensagem"]').val("");

    if ($('[data-id-notificacao]').length == 0)
        $("#chat-container").empty()

    $("#chat-container").append(`
                                <div data-id-notificacao="${$('[data-id-notificacao]').length + 1}"
                                    class='flex items-start bg-purple-100 py-2 px-3'>
                                  <div class="avatar placeholder mr-3">
                                      <div class="bg-neutral text-neutral-content rounded-full w-12 text-xl">
                                          <span>${chat.nomeCompleto.Avatar()}</span>
                                      </div>
                                  </div>
                                  <div class="w-full">
                                      <div class="flex justify-between items-center">
                                          <h3 class="font-semibold">${chat.nomeCompleto}</h3>
                                          <span class="text-gray-500 text-sm">${moment().fromNow()}</span>
                                      </div>
                                      <p>${mensagem}</p>
                                  </div>
                                </div>`)

    $('#chat-container').animate({ scrollTop: $('#chat-container')[0].scrollHeight });

    $.ajax({
        type: "POST",
        data: { notificacao: { ...chat, mensagem } },
        url: "/criar/nova/mensagem",
        success: function (response) {
            console.log(response);
        },
        error: function (response) {
            console.log(response);
        },
    });
})

$(document).on('keyup', '[name="motivoRecusa"]', function () {
    let palavras = $(this).val().length
    $('[data-target="motivo-recusa"]').html(palavras)

    if (palavras > 520)
        $('[data-target="motivo-recusa"]').addClass('text-red-600')
    else
        $('[data-target="motivo-recusa"]').removeClass('text-red-600')
})

$(document).on('click', '[data-trigger="manage"]', function () {
    let data = $(this).getData();

    Swal.fire({
        title: data.beforeTitle,
        text: data.beforeMessage,
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        showCancelButton: true,
        confirmButtonText: "Sim",
        cancelButtonText: 'Não',
        reverseButtons: true,
        customClass: {
            confirmButton: "!bg-[#130235] !twxt-white",
            cancelButton: "!bg-transparent !text-[#ffcc00] !border !border-solid !border-[#ffcc00] hover:!border-[#ffe990] hover:!text-gray-900 hover:!bg-[#ffe990]",
        }
    }).then(async (result) => {
        if (result.isConfirmed) {

            if (data.etapa == "CANCELADO") {
                Swal.fire({
                    html: `<form id="from-solicitacao">
                            <div>
                                <label class="form-control relative">
                                    <div class="label">
                                        <span class="label-text-alt">Motivo da recusa da solictação.</span>
                                    </div>
                                    <span data-target="motivo-recusa" class="block absolute bottom-2 right-3 text-sm font-bold">0</span>
                                    <textarea name="motivoRecusa" rows="15"
                                        class="textarea textarea-bordered h-24 placeholder:italic resize-none"
                                        placeholder="Descreva o motivo que deseja cancelar a solicitação de troca! Lembrando que a descrição do motivo é para o item selecionado."></textarea>
                                </label>
                            </div>
                        </form>`,
                    showCancelButton: true,
                    reverseButtons: true,
                    title: "Cancelar troca de item.",
                    customClass: {
                        confirmButton: "!bg-[#ffcc00] !text-gray-800",
                    },
                    confirmButtonText: 'Sim, cancelar',
                    cancelButtonText: 'Não',
                    allowEnterKey: false,
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.hideLoading();
                    },
                    showLoaderOnConfirm: true,
                    preConfirm: async () => {
                        try {
                            const item = $("#from-solicitacao").serializeJsonComplex()

                            if (item.motivoRecusa == "") {
                                return Swal.showValidationMessage(`É necessário informar o motivo da sua solicitação de troca.`);
                            }

                            if (item.motivoRecusa.length > 520) {
                                return Swal.showValidationMessage(`Sua descrição passou de 520 caracteres por favor reduza a quantidade`);
                            }

                            return item.motivoRecusa;
                        } catch (error) {
                            console.log(error)
                            return Swal.showValidationMessage('Um erro inesperado contate o TI.');
                        }
                    }
                }).then(async (result) => {
                    if (result.isConfirmed) {
                        const response = await $.ajax({
                            url: `/altera/etapa/solicitacao`,
                            type: 'POST',
                            data: { ...data, motivo: result.value }
                        });

                        if (response.success) {
                            Swal.fire({
                                position: "center",
                                icon: "success",
                                title: data.afterTitle,
                                text: data.afterMessage,
                                showConfirmButton: false,
                                timer: 1500
                            }).then(() => location.reload())
                        }
                    }
                })
            } else {
                const response = await $.ajax({
                    url: `/altera/etapa/solicitacao`,
                    type: 'POST',
                    data: data
                });

                if (response.success) {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: data.afterTitle,
                        text: data.afterMessage,
                        showConfirmButton: false,
                        timer: 1500
                    }).then(() => location.reload())
                }
            }
        }
    });
})