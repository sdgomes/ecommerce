$(function () {
    $(document).on('click', '[data-tg="view"]', function () {
        const ActiveClass = "text-white bg-[#130235] hover:bg-[#ffcc00] hover:text-gray-800";
        $button = $(this);

        if ($button.attr("data-active") == "false") {
            $('[data-tg="view"]').removeClass(ActiveClass).attr("data-active", "false");
            $button.addClass(ActiveClass).attr("data-active", "true");

            $.ajax({
                type: "GET",
                url: `/Retorna/Produtos/${$button.attr("data-tipo")}`,
                success: function (response) {
                    $("#shop-content").html(response)
                },
                error: function (error) {
                    console.log(error)
                }
            });
        }
    })
});