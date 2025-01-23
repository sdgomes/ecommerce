window.addEventListener("load", (event) => {

    const codigo = cookie.Get("codigo");
    if (codigo == null) {
        const favoritos = sessionStorage.getItem("favoritos");
        let temp = favoritos == null ? [] : JSON.parse(favoritos);

        $.ajax({
            type: "POST",
            data: { produtos: temp },
            url: "/componente/favoritos",
            success: function (response) {
                $("#container-favoritos").html(response);
                $('[data-trigger="carregando"]').each(function (index, element) {
                    let data = $(element).getData()
                    $.ajax({
                        type: "POST",
                        data: { ...data },
                        url: "/favoritos/retorna/imagem",
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
                url: "/favoritos/retorna/imagem",
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
       $(document).on('click', '[data-trigger="remove-favorito"]', function () {
        $button = $(this);
        $button.parents('.cart-single-list').remove();
    
        if ($('.cart-single-list').length == 0) {
            $("#lista-produtos").find('tbody').html(`<div role="alert" class="alert rounded-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-info shrink-0 w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                <span>Nenhum item foi adicionado ao favoritos.</span>
            </div>`)
        }

        const codigo = cookie.Get("codigo");
        if (codigo != null) {
            $.ajax({
                type: "POST",
                data: { ...data, codigo },
                url: "/favoritos/remove/item",
                success: function (response) {
                    $("#favoritos").html(response.quantidade);
                },
                error: function (response) {
                    console.log(response);
                },
            });
        }
    })
});