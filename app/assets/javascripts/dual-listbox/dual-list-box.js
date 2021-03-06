(function($) {
    $.fn.DualListBox = function(paramOptions, selected) {
        return this.each(function() {
            var defaults = {
                element: $(this).context,
                uri: "local.json",
                value: "id",
                text: "name",
                title: "Example",
                json: true,
                timeout: 500,
                horizontal: false,
                textLength: 45,
                moveAllBtn: true,
                maxAllBtn: 500,
                selectClass: "form-control",
                warning: "Are you sure you want to move this many items? Doing so can cause your browser to become unresponsive."
            };
            var htmlOptions = {
                element: $(this).context,
                uri: $(this).data("source"),
                value: $(this).data("value"),
                text: $(this).data("text"),
                title: $(this).data("title"),
                json: $(this).data("json"),
                timeout: $(this).data("timeout"),
                horizontal: $(this).data("horizontal"),
                textLength: $(this).data("textLength"),
                moveAllBtn: $(this).data("moveAllBtn"),
                maxAllBtn: $(this).data("maxAllBtn"),
                selectClass: $(this).data("selectClass"),
                showing: $(this).data("showing"),
                filter: $(this).data("filter"),
                available: $(this).data("available"),
                selected: $(this).data("selected")
            };
            var options = $.extend({}, defaults, htmlOptions, paramOptions);
            $.each(options, function(i, item) {
                if (item === undefined || item === null) {
                    throw "DualListBox: " + i + " is undefined."
                }
            });
            options["parent"] = "dual-list-box-" + options.title;
            options["parentElement"] = "#" + options.parent;
            selected = $.extend([{}], selected);
            if (options.json) {
                addElementsViaJSON(options, selected)
            } else {
                construct(options)
            }
        })
    };

    function addElementsViaJSON(options, selected) {
        var multipleTextFields = false;
        if (options.text.indexOf(":") > -1) {
            var textToUse = options.text.split(":");
            if (textToUse.length > 1) {
                multipleTextFields = true
            }
        }
        $.getJSON(options.uri, function(json) {
            $.each(json, function(key, item) {
                var text = "";
                if (multipleTextFields) {
                    textToUse.forEach(function(entry) {
                        text += item[entry] + " "
                    })
                } else {
                    text = item[options.text]
                }
                $("<option>", {
                    value: item[options.value],
                    text: text,
                    selected: selected.some(function(e) {
                        return e[options.value] === item[options.value]
                    }) === true
                }).appendTo(options.element)
            });
            construct(options)
        })
    }

    function addListeners(options) {
        var unselected = $(options.parentElement + " .unselected");
        var selected = $(options.parentElement + " .selected");
        $(options.parentElement).find("button").bind("click", function() {
            switch ($(this).data("type")) {
                case "str":
                    unselected.find("option:selected").appendTo(selected);
                    $(this).prop("disabled", true);
                    break;
                case "atr":
                    if (unselected.find("option").length >= options.maxAllBtn && confirm(options.warning) || unselected.find("option").length < options.maxAllBtn) {
                        unselected.find("option").each(function() {
                            if ($(this).isVisible()) {
                                $(this).remove().appendTo(selected)
                            }
                        })
                    }
                    break;
                case "stl":
                    selected.find("option:selected").remove().appendTo(unselected);
                    $(this).prop("disabled", true);
                    break;
                case "atl":
                    if (selected.find("option").length >= options.maxAllBtn && confirm(options.warning) || selected.find("option").length < options.maxAllBtn) {
                        selected.find("option").each(function() {
                            if ($(this).isVisible()) {
                                $(this).remove().appendTo(unselected)
                            }
                        })
                    }
                    break;
                default:
                    break
            }
            unselected.filterByText($(options.parentElement + " .filter-unselected"), options.timeout, options.parentElement).scrollTop(0).sortOptions();
            selected.filterByText($(options.parentElement + " .filter-selected"), options.timeout, options.parentElement).scrollTop(0).sortOptions();
            handleMovement(options)
        });
        $(options.parentElement).closest("form").submit(function() {
            selected.find("option").prop("selected", true)
        });
        $(options.parentElement).find('input[type="text"]').keypress(function(e) {
            if (e.which === 13) {
                event.preventDefault()
            }
        });
        selected.filterByText($(options.parentElement + " .filter-selected"), options.timeout, options.parentElement).scrollTop(0).sortOptions();
        unselected.filterByText($(options.parentElement + " .filter-unselected"), options.timeout, options.parentElement).scrollTop(0).sortOptions()
    }

    function construct(options) {
        createDualListBox(options);
        parseStubListBox(options);
        addListeners(options)
    }

    function countElements(parentElement) {
        var countUnselected = 0,
            countSelected = 0;
        $(parentElement + " .unselected").find("option").each(function() {
            if ($(this).isVisible()) {
                countUnselected++
            }
        });
        $(parentElement + " .selected").find("option").each(function() {
            if ($(this).isVisible()) {
                countSelected++
            }
        });
        $(parentElement + " .unselected-count").text(countUnselected);
        $(parentElement + " .selected-count").text(countSelected);
        toggleButtons(parentElement)
    }

    function createDualListBox(options) {
        $(options.element).parent().attr("id", options.parent);
        $(options.parentElement).addClass("row").append((options.horizontal == false ? '   <div class="col-md-5">' : '   <div class="col-md-6">') + '       <h4><span class="unselected-title"></span> <small>-'+ options.showing +'<span class="unselected-count"></span></small></h4>' + '       <input class="filter form-control filter-unselected" type="text" placeholder="'+ options.filter +'" style="margin-bottom: 5px;">' + (options.horizontal == false ? "" : createHorizontalButtons(1, options.moveAllBtn)) + '       <select class="unselected ' + options.selectClass + '" style="height: 200px; width: 100%;" multiple></select>' + "   </div>" + (options.horizontal == false ? createVerticalButtons(options.moveAllBtn) : "") + (options.horizontal == false ? '   <div class="col-md-5">' : '   <div class="col-md-6">') + '       <h4><span class="selected-title"></span> <small>- '+ options.showing +' <span class="selected-count"></span></small></h4>' + '       <input class="filter form-control filter-selected" type="text" placeholder="'+ options.filter +'" style="margin-bottom: 5px;">' + (options.horizontal == false ? "" : createHorizontalButtons(2, options.moveAllBtn)) + '       <select class="selected ' + options.selectClass + '" style="height: 200px; width: 100%;" multiple></select>' + "   </div>");
        $(options.parentElement + " .selected").prop("name", $(options.element).prop("name"));
        $(options.parentElement + " .unselected-title").text( options.title + " "+ options.available);
        $(options.parentElement + " .selected-title").text(options.title + " " + options.selected )
    }

    function createHorizontalButtons(number, copyAllBtn) {
        if (number == 1) {
            return (copyAllBtn ? '       <button type="button" class="btn btn-default atr" data-type="atr" style="margin-bottom: 5px;"><span class="glyphicon glyphicon-list"></span> <span class="glyphicon glyphicon-chevron-right"></span></button>' : "") + '       <button type="button" class="btn btn-default ' + (copyAllBtn ? "pull-right col-md-6" : "col-md-12") + ' str" data-type="str" style="margin-bottom: 5px;" disabled><span class="glyphicon glyphicon-chevron-right"></span></button>'
        } else {
            return '       <button type="button" class="btn btn-default ' + (copyAllBtn ? "col-md-6" : "col-md-12") + ' stl" data-type="stl" style="margin-bottom: 5px;" disabled><span class="glyphicon glyphicon-chevron-left"></span></button>' + (copyAllBtn ? '       <button type="button" class="btn btn-default col-md-6 pull-right atl" data-type="atl" style="margin-bottom: 5px;"><span class="glyphicon glyphicon-chevron-left"></span> <span class="glyphicon glyphicon-list"></span></button>' : "")
        }
    }

    function createVerticalButtons(copyAllBtn) {
        return '   <div class="col-md-2 center-block" style="margin-top: ' + (copyAllBtn ? "80px" : "130px") + '">' + (copyAllBtn ? '       <button type="button" class="btn btn-primary col-md-8 col-md-offset-2 atr" data-type="atr" style="margin-bottom: 10px;"> >> </button>' : "") + '       <button type="button" class="btn btn-primary col-md-8 col-md-offset-2 str" data-type="str" style="margin-bottom: 20px;" disabled> > </button>' + '       <button type="button" class="btn btn-primary col-md-8 col-md-offset-2 stl" data-type="stl" style="margin-bottom: 10px;" disabled> < </button>' + (copyAllBtn ? '       <button type="button" class="btn btn-primary col-md-8 col-md-offset-2 atl" data-type="atl" style="margin-bottom: 10px;"> << </button>' : "") + "   </div>"
    }

    function handleMovement(options) {
        $(options.parentElement + " .unselected").find("option:selected").prop("selected", false);
        $(options.parentElement + " .selected").find("option:selected").prop("selected", false);
        $(options.parentElement + " .filter").val("");
        $(options.parentElement + " select").find("option").each(function() {
            $(this).show()
        });
        countElements(options.parentElement)
    }

    function parseStubListBox(options) {
        var textIsTooLong = false;
        $(options.element).find("option").text(function(i, text) {
            $(this).data("title", text);
            if (text.length > options.textLength) {
                textIsTooLong = true;
                return text.substr(0, options.textLength) + "..."
            }
        }).each(function() {
            if (textIsTooLong) {
                $(this).prop("title", $(this).data("title"))
            }
            if ($(this).is(":selected")) {
                $(this).appendTo(options.parentElement + " .selected")
            } else {
                $(this).appendTo(options.parentElement + " .unselected")
            }
        });
        $(options.element).remove();
        handleMovement(options)
    }

    function toggleButtons(parentElement) {
        $(parentElement + " .unselected").change(function() {
            $(parentElement + " .str").prop("disabled", false)
        });
        $(parentElement + " .selected").change(function() {
            $(parentElement + " .stl").prop("disabled", false)
        });
        if ($(parentElement + " .unselected").has("option").length == 0) {
            $(parentElement + " .atr").prop("disabled", true);
            $(parentElement + " .str").prop("disabled", true)
        } else {
            $(parentElement + " .atr").prop("disabled", false)
        }
        if ($(parentElement + " .selected").has("option").length == 0) {
            $(parentElement + " .atl").prop("disabled", true);
            $(parentElement + " .stl").prop("disabled", true)
        } else {
            $(parentElement + " .atl").prop("disabled", false)
        }
    }
    $.fn.filterByText = function(textBox, timeout, parentElement) {
        return this.each(function() {
            var select = this;
            var options = [];
            $(select).find("option").each(function() {
                options.push({
                    value: $(this).val(),
                    text: $(this).text()
                })
            });
            $(select).data("options", options);
            $(textBox).bind("change keyup", function() {
                delay(function() {
                    var options = $(select).data("options");
                    var search = $.trim($(textBox).val());
                    var regex = new RegExp(search, "gi");
                    $.each(options, function(i) {
                        if (options[i].text.match(regex) === null) {
                            $(select).find($('option[value="' + options[i].value + '"]')).hide()
                        } else {
                            $(select).find($('option[value="' + options[i].value + '"]')).show()
                        }
                    });
                    countElements(parentElement)
                }, timeout)
            })
        })
    };
    $.fn.isVisible = function() {
        return !($(this).css("visibility") == "hidden" || $(this).css("display") == "none")
    };
    $.fn.sortOptions = function() {
        return this.each(function() {
            $(this).append($(this).find("option").remove().sort(function(a, b) {
                var at = $(a).text(),
                    bt = $(b).text();
                return at > bt ? 1 : at < bt ? -1 : 0
            }))
        })
    };
    var delay = function() {
        var timer = 0;
        return function(callback, ms) {
            clearTimeout(timer);
            timer = setTimeout(callback, ms)
        }
    }()
})(jQuery);