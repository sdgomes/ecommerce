let tabela = new DataTable('#registros', {
    dom: 'Bfrtip',
    order: [[0, 'desc']],
    ordering: true,
    order: [[0, 'desc']],
    language: {
        url: '/json/pt-BR.json',
    },
})

$(document).on("click", '[data-trigger="manage"]', PedidoAcoes)