Date.prototype.todayString = function () {
    var date = this.getDate();
    date = date < 10 ? `0${date}` : date;

    var month = this.getMonth() + 1;
    month = month < 10 ? `0${month}` : month;

    var hours = this.getHours();
    hours = hours < 10 ? `0${hours}` : hours;

    var minutes = this.getMinutes();
    minutes = minutes < 10 ? `0${minutes}` : minutes;

    return `${date}/${month}/${this.getFullYear()} às ${hours}:${minutes}`;
}

Number.prototype.toTwo = function () {
    const valor = this
    return parseFloat(valor.toFixed(2))
}

Number.prototype.toMoney = function () {
    const valor = this
    return new Intl.NumberFormat('pt-BR', { minimumFractionDigits: 2 }).format(valor)
}

String.prototype.toFloat = function () {
    const palavra = this.toString();
    return parseFloat(palavra.replace(/\./g, '').replace(/\,/g, '.')).toTwo();
}

String.prototype.parseBool = function () {
    const palavra = this.toString();
    const string = typeof palavra == "string" ? palavra.toLowerCase().trim() : palavra;

    const isTrueSet = (string === 'true');
    const isFalseSet = (string === 'false');
    return isTrueSet || isFalseSet ? (string === 'true') : palavra
}

String.prototype.toTitleCase = function () {
    if (this.length <= 3)
        return this;

    return this.replace(
        /\w\S*/g,
        function (txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        }
    );
}

String.prototype.toDate = function () {
    const event = new Date(this);
    return event.toLocaleString('pt-BR', { timeZone: 'UTC' }).replace(",", "")
}

String.prototype.FileExtension = function () {
    const item = /[.]/.exec(this) ? /[^.]+$/.exec(this) : undefined;
    try {
        return item[0];
    } catch (error) {
        return false;
    }
}

String.prototype.Avatar = function () {
    var palavras = this.toString().split(" ");
    var l1 = palavras[0].charAt(0);
    var l2 = palavras[0].charAt(1);

    if (palavras.length > 1) l2 = palavras[palavras.length - 1].charAt(0);

    return `${l1}${l2}`;
};

Array.prototype.Divide = function (divisao) {
    var array = this;
    return [].concat.apply([],
        array.map(function (elem, i) {
            return i % divisao ? [] : [array.slice(i, i + divisao)];
        })
    );
}