$(function () {

    var porCategoria,
        chartGeral, chartCaregorias;

    const listaCategorias = () => {
        $("#lista-categorias").empty();
        porCategoria
            .forEach((categoria, index) => {
                $("#lista-categorias").append(` <label
                        class="cursor-pointer flex gap-4 bg-yellow-400 w-fit rounded-md items-center px-3 py-2 text-gray-800">
                        <input type="checkbox" ${index < 6 ? "checked" : ""} value="${categoria.name}" name="categorias[${index}]"  class="checkbox [&:not(:checked)]:bg-white" />
                        <span class="font-bold pointer-events-none">${categoria.name}</span>
                    </label>`)
            });
    }

    $(document).on('click', '#filtro_categorias', function () {
        $button = $(this);
        const content = $button.html();
        const data = $("#lista-categorias").serializeJsonComplex();

        if (!data.categorias) {
            Swal.fire({
                position: "center",
                icon: "warning",
                title: "Atenção!",
                text: 'Para filtrar é importante escolher os temas desejados',
                showConfirmButton: false,
                timer: 1500
            });
            return false;
        }

        $button.html(`<span class="loading loading-spinner loading-sm"></span> Filtrando`)

        const filtrar = data.categorias.filter((categoria) => categoria != "")
        const filtro = porCategoria.filter((item) => filtrar.some((vendor) => vendor === item.name))

        chartCaregorias = Highcharts.chart('container_produto', {
            ...highchartsSet,
            ...{
                title: {
                    text: 'Análise Categoria',
                    align: 'left'
                },

                subtitle: {
                    text: 'Gráfico com a quantidade de vendas por categoria.\nPara um melhor resultado filtre as categorias desejadas.',
                    align: 'left'
                },

                series: filtro
            }
        });

        setTimeout(() => {
            $button.html(`<i class="fa-solid fa-check"></i> Filtrado`);
            setTimeout(() => {
                $button.html(content)
            }, 325);
        }, 325);

    })

    const highchartsSet = {

        chart: {
            type: 'spline',
            scrollablePlotArea: {
                minWidth: 700
            }
        },

        xAxis: {
            tickWidth: 0,
            gridLineWidth: 1,
            type: 'datetime',
            ordinal: true,
            labels: {
                align: 'left',
                x: 3,
                y: -3,
            }
        },

        yAxis: [{
            title: {
                text: 'Qnt. Vendas'
            },
            labels: {
                align: 'left',
                x: 3,
                y: 16,
                format: '{value:.,0f}'
            },
            showFirstLabel: false
        }],

        legend: {
            align: 'left',
            verticalAlign: 'top',
            borderWidth: 0
        },

        tooltip: {
            shared: true,
            crosshairs: true
        },

        plotOptions: {
            series: {
                cursor: 'pointer',
                marker: {
                    lineWidth: 1
                }
            }
        },

        exporting: {
            enabled: false
        },

        credits: {
            enabled: false
        }
    }

    Highcharts.setOptions({
        lang: {
            months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
            shortMonths: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            weekdays: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
            loading: ['Atualizando o gráfico...aguarde'],
            contextButtonTitle: 'Exportar gráfico',
            decimalPoint: ',',
            thousandsSep: '.',
            downloadJPEG: 'Baixar imagem JPEG',
            downloadPDF: 'Baixar arquivo PDF',
            downloadPNG: 'Baixar imagem PNG',
            downloadSVG: 'Baixar vetor SVG',
            printChart: 'Imprimir gráfico',
            rangeSelectorFrom: 'De',
            rangeSelectorTo: 'Para',
            rangeSelectorZoom: 'Zoom',
            resetZoom: 'Limpar Zoom',
            resetZoomTitle: 'Voltar Zoom para nível 1:1',
        }
    });

    $(document).on('click', '#limpar_filtro', function () {
        $(this).hide();
        iniciaGrafico();
    });

    $(document).on('click', '#filtro_data', function () {
        $button = $(this);
        const content = $button.html();

        const data = $button.parents('form').serializeJson();
        if (data.inicio.trim() == "" || data.fim.trim() == "") {
            Swal.fire({
                position: "center",
                icon: "info",
                title: "Atenção!",
                text: "É necessário escolher um range de data, de inicio e fim.",
                showConfirmButton: false,
                timer: 1500
            })
            return false;
        }

        $('#limpar_filtro').show();

        $button.html(`<span class="loading loading-spinner loading-sm"></span> Filtrando`)

        $.ajax({
            type: "POST",
            url: `/relatorio/geral/range`,
            data: data,
            success: function (response) {
                chartGeral.destroy();
                chartGeral = new Highcharts.Chart('container_geral', {
                    ...highchartsSet,
                    ...{
                        title: {
                            text: 'Análise Geral',
                            align: 'left'
                        },

                        subtitle: {
                            text: 'Gráfico geral com a quantidade total de produto vendido por dia.\nPara um melhor resultado filtre os por data.',
                            align: 'left'
                        },

                        series: [{
                            name: 'Qnt. Venda',
                            data: (function () {
                                return response.data.geral
                                    .sort((a, b) => new Date(b.dataVenda) - new Date(a.dataVenda))
                                    .map(function (item) {
                                        return [Date.parse(item.dataVenda), item.quantidade];
                                    });
                            })()
                        }]
                    }
                });

                let data = response.data.caregorias;
                porCategoria = [...new Set(data.map(x => x.nome))].map(x => {
                    return {
                        name: x,
                        data: data.filter(y => y.nome == x)
                            .sort((a, b) => new Date(b.dataVenda) - new Date(a.dataVenda))
                            .map(e => [Date.parse(e.dataVenda), e.quantidade])
                    }
                }).sort((a, b) => {
                    if (a.name < b.name) { return -1; }
                    if (a.name > b.name) { return 1; }
                    return 0;
                })

                listaCategorias()

                chartCaregorias = Highcharts.chart('container_produto', {
                    ...highchartsSet,
                    ...{
                        title: {
                            text: 'Análise Categoria',
                            align: 'left'
                        },

                        subtitle: {
                            text: 'Gráfico com a quantidade de vendas por categoria.\nPara um melhor resultado filtre as categorias desejadas.',
                            align: 'left'
                        },

                        series: porCategoria.Divide(6)[0]
                    }
                });

                setTimeout(() => {
                    $button.html(`<i class="fa-solid fa-check"></i> Filtrado`);
                    setTimeout(() => {
                        $button.html(content)
                    }, 325);
                }, 325);
            },
            error: function (response) {
                console.log(response);
            },
        });
    })

    const iniciaGrafico = () => {
        $.ajax({
            type: "POST",
            url: `/relatorio/geral`,
            success: function (response) {
                chartGeral = new Highcharts.Chart('container_geral', {
                    ...highchartsSet,
                    ...{
                        title: {
                            text: 'Análise Geral',
                            align: 'left'
                        },

                        subtitle: {
                            text: 'Gráfico geral com a quantidade total de produto vendido por dia.\nPara um melhor resultado filtre os por data.',
                            align: 'left'
                        },

                        series: [{
                            name: 'Qnt. Venda',
                            data: (function () {
                                return response.data.geral
                                    .sort((a, b) => new Date(b.dataVenda) - new Date(a.dataVenda))
                                    .map(function (item) {
                                        return [Date.parse(item.dataVenda), item.quantidade];
                                    });
                            })()
                        }]
                    }
                });

                let data = response.data.caregorias;
                porCategoria = [...new Set(data.map(x => x.nome))].map(x => {
                    return {
                        name: x,
                        data: data.filter(y => y.nome == x)
                            .sort((a, b) => new Date(b.dataVenda) - new Date(a.dataVenda))
                            .map(e => [Date.parse(e.dataVenda), e.quantidade])
                    }
                }).sort((a, b) => {
                    if (a.name < b.name) { return -1; }
                    if (a.name > b.name) { return 1; }
                    return 0;
                });

                listaCategorias()

                chartCaregorias = Highcharts.chart('container_produto', {
                    ...highchartsSet,
                    ...{
                        title: {
                            text: 'Análise Categoria',
                            align: 'left'
                        },

                        subtitle: {
                            text: 'Gráfico com a quantidade de vendas por categoria.\nPara um melhor resultado filtre as categorias desejadas.',
                            align: 'left'
                        },

                        series: porCategoria.Divide(6)[0]
                    }
                });
            },
            error: function (response) {
                console.log(response);
            },
        });
    }

    iniciaGrafico();
});