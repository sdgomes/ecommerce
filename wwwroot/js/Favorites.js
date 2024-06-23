document.addEventListener("DOMContentLoaded", function (event) {
    $(document).on("click", ".remove-item", function () {
        $(this).parents('.cart-single-list').remove();

        if ($('.cart-single-list').length == 0) {
            $('.cart-list-head').append(`<div role="alert" class="rounded-none alert"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-info shrink-0 w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg><span>Nenhum item foi adicionado a lista de favoritos.</span></div>`)
        }
    })

    $.ajax({
        type: "POST",
        data: { Produtos: Favoritos.getItems() },
        url: "/componente/favorites",
        success: function (response) {
            $("#container-favorites").html(response);
        },
        error: function (response) {
            console.log(response);
        },
    });
});