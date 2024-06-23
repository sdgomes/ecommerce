$(function () {
    $(document).on('click', '#excluir-conta', function(){
        let data = $(this).getData();

        Swal.fire({
            icon: 'warning',
            title: "Atenção",
            text: "Confirma que deseja excluir sua conta?",
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            showCancelButton: true,
            confirmButtonText: "Sim, Excluir",
            cancelButtonText: 'Não',
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-red-700",
            }
        }).then(async (result) => {
            if (result.isConfirmed) {
                const codigo = cookie.Get("codigo");

                const response = await $.ajax({
                    url: `/excluir/minha/conta/${codigo}`,
                    type: 'GET'
                });
    
                if (response.success) {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: 'Feito!',
                        text: "Sua conta foi excluída com sucesso! Caso tenha dúvidas entre em contato com o suporte.",
                        showConfirmButton: true,
                        confirmButtonText: "Ok",
                    }).then(() => location.reload())
                }
            }
        });
    })

    $(document).on('click', '#inativar-conta', function(){
        let data = $(this).getData();

        Swal.fire({
            icon: 'warning',
            title: "Atenção",
            text: "Confirma que deseja inativar sua conta?",
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false,
            showCancelButton: true,
            confirmButtonText: "Sim, Inativar",
            cancelButtonText: 'Não',
            reverseButtons: true,
            customClass: {
                confirmButton: "!bg-[#ffcc00] !text-gray-800",
            }
        }).then(async (result) => {
            if (result.isConfirmed) {
                const codigo = cookie.Get("codigo");

                const response = await $.ajax({
                    url: `/inativar/minha/conta/${codigo}`,
                    type: 'GET'
                });
    
                if (response.success) {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: 'Feito!',
                        text: "Sua conta foi inativa com sucesso! Caso tenha dúvidas entre em contato com o suporte.",
                        showConfirmButton: true,
                        confirmButtonText: "Ok",
                    }).then(() => location.reload())
                }
            }
        });
    })
});