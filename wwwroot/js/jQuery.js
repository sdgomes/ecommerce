jQuery.fn.extend({

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
    }
  });