window.addEventListener("load", (event) => {

    const codigo = cookie.Get("codigo");
    if (codigo == null) {
        const carrinho = sessionStorage.getItem("carrinho");
        let temp = carrinho == null ? [] : JSON.parse(carrinho);

        $.ajax({
            type: "POST",
            data: { produtos: temp },
            url: "/componente/carrinho",
            success: function (response) {
                $("#container-carrinho").html(response);
                $('[data-trigger="carregando"]').each(function (index, element) {
                    let data = $(element).getData()
                    $.ajax({
                        type: "POST",
                        data: { ...data },
                        url: "/carrinho/retorna/imagem",
                        success: function (response) {
                            $(element).parent().html(`<img src="${response.imagem}" class="w-14" alt="..."></img>`)
                        },
                        error: function (response) {
                            console.log(response);
                        },
                    });
                });
            },
            error: function (response) {
                console.log(response);
            },
        });
    } else {
        $('[data-trigger="carregando"]').each(function (index, element) {
            let data = $(element).getData()
            $.ajax({
                type: "POST",
                data: { ...data },
                url: "/carrinho/retorna/imagem",
                success: function (response) {
                    $(element).parent().html(`<img src="${response.imagem}" class="w-14" alt="..."></img>`)
                },
                error: function (response) {
                    console.log(response);
                },
            });
        });
    }
});

document.addEventListener("DOMContentLoaded", function (event) {

    $(document).on('click', '#container-carrinho .button-qnt', function () {
        let data = $(this).getData();
        data.quantidade = $(this).parent().find('input').val();

        const codigo = cookie.Get("codigo");
        if (codigo != null) {
            $.ajax({
                type: "POST",
                data: { ...data, codigo },
                url: "/carrinho/altera/quantidade/item",
                success: function (response) {
                    console.log(response);
                },
                error: function (response) {
                    console.log(response);
                },
            });
        }
    })

    $(document).on('click', '#container-carrinho [data-trigger="remove-produto"]', function () {
        let data = $(this).getData();

        const codigo = cookie.Get("codigo");
        if (codigo != null) {
            $.ajax({
                type: "POST",
                data: { ...data, codigo },
                url: "/carrinho/remove/item",
                success: function (response) {
                    $("#carrinho").html(response.quantidade);
                },
                error: function (response) {
                    console.log(response);
                },
            });
        }
    })
});