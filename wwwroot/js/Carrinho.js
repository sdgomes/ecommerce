document.addEventListener("DOMContentLoaded", function (event) {
    onDomChange(function () {
        setTimeout(() => {
            $.applyDataMask('[data-mask');
        }, 125);
    });

    // $.ajax({
    //     type: "POST",
    //     data: { Produtos: Carrinho.getItems() },
    //     url: "/componente/carrinho",
    //     success: function (response) {
    //         $("#container-carrinho").html(response);
    //         Carrinho.Carrega();
    //     },
    //     error: function (response) {
    //         console.log(response);
    //     },
    // });

    $(document).on("click", ".remove-item-carrinho", function () {

        if ($('.cart-single-list').length == 0) {
            $('.cart-list-head').append(`<div role="alert" class="rounded-none alert"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-info shrink-0 w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg><span>Nenhum item foi adicionado ao carrinho.</span></div>`)
        }
    })
});