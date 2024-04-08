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

Array.prototype.Divide = function (divisao) {
    var array = this;
    return [].concat.apply([],
        array.map(function (elem, i) {
            return i % divisao ? [] : [array.slice(i, i + divisao)];
        })
    );
}