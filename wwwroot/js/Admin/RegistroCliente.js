$(document).ready(function () {
    const clientes = {
        tabela: new DataTable('#myTable', {
            "dom": 'Bfrtip',
            "scrollX": true,
            "ordering": true,
            "paging": true,
            "language": {
                "url": '/json/pt-BR.json',
            },
            "columnDefs": [{
                "targets": 11,
                "orderable": false
            }
            ]
        }),
    }
});