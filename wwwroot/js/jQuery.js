jQuery.fn.extend({

    toFloat: function () {
        return $(this).text().replace(/R\$/g, '').toFloat().toString().replace(/\./g, ',')
    },

    id: function () {
        return $(this).attr("id")
    },

    enabled: function () {
        return this.each(function () {
            this.disabled = false;
        });
    },

    disabled: function () {
        return this.each(function () {
            this.disabled = true;
        });
    },

    check: function () {
        return this.each(function () {
            this.checked = true;
        });
    },

    uncheck: function () {
        return this.each(function () {
            this.checked = false;
        });
    },

    serializeJson: function () {
        var formArray = $(this).serializeArray();
        var returnArray = {};
        for (var i = 0; i < formArray.length; i++) {
            returnArray[formArray[i]['name']] = typeof formArray[i]['value'] == "string" ? formArray[i]['value'].trim() : formArray[i]['value'];
        }
        return returnArray;
    },

    serializeJsonComplex: function () {
        var preFormulario = $(this).serializeJson();
        var Formulario = {};
        for (const key in preFormulario) {
            if (Object.hasOwnProperty.call(preFormulario, key)) {
                const element = preFormulario[key];
                var arrayObjeto = key.split(".");
                if (arrayObjeto.length == 2) {
                    var chave1 = arrayObjeto[0].split('[')[0];
                    var index = parseInt(arrayObjeto[0].split('[')[1].split(']')[0]);
                    var chave2 = arrayObjeto[1];

                    if (Formulario[chave1] == undefined)
                        Formulario[chave1] = [];

                    if (Formulario[chave1].length == 0)
                        Formulario[chave1][index] = { [chave2]: element }
                    else
                        Formulario[chave1][index] = { ...Formulario[chave1][index], ...{ [chave2]: element } }
                } else {
                    if (arrayObjeto[0].search(/\[/) > -1) {
                        var chave1 = arrayObjeto[0].split('[')[0];
                        var index = parseInt(arrayObjeto[0].split('[')[1].split(']')[0]);

                        if (Formulario[chave1] == undefined)
                            Formulario[chave1] = [];

                        Formulario[chave1][index] = element
                    } else {
                        Formulario[key] = element;
                    }
                }
            }
        }

        return Formulario;
    },

    overflow: function (type) {
        if (type == undefined) {
            $(this).removeAttr("style");
            return false;
        }
        $(this).css("overflow", type);
    },

    toggleAttrVal: function (attr, val1, val2) {
        $(this).attr(attr, $(this).attr(attr) == val1 ? val2 : val1);
        return this;
    },

    hasAttr: function (attr) {
        const has = $(this).attr(attr);

        if (typeof has !== 'undefined' && has !== false)
            return true;
        else
            return false;
    },

    getData: function () {
        var informacoes = {}
        $.each($(this)[0].attributes, function (i, e) {
            if (e != undefined)
                if (e.name.search("data-") > -1) {
                    var arrayNome = e.name.split('-')
                    arrayNome = arrayNome.map((nome, index) => {
                        if (index > 0) {
                            return index == 1 ? nome : nome.toString().toTitleCase();
                        }
                    })

                    informacoes[arrayNome.join("")] = e.value
                }
        });

        return informacoes
    }
});