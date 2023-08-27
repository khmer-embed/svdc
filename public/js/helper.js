let helper = {
    test: function () { console.log('testcallback') },
    delayRefresh: function () {
        setTimeout(function () {
            location.reload();
        }, 2000);
    },
    setLoading: function (isLoading) {
        if (isLoading) {
            $(".global_loading").show();
            $(".formactionbutton").attr('disabled', true);
        } else {
            $('.global_loading').delay(300).fadeOut('fast');

            setTimeout(function () {
                $('.formactionbutton').delay(5000).attr('disabled', false);
            }, 1000);
        }
    },
    callbackHandler: function (jsondata, callback) {
        var fn = window[callback]
        if (typeof fn === "function") {
            fn(jsondata);
        } else {
            var fn = this[callback];
            if (typeof fn === "function") fn(jsondata);
        }
    },

    isObject: function (val) {
        let myreturn = false;

        if (val === null) { return false; } else if ((typeof val) === 'function' || (typeof val) === 'object') {
            myreturn = true;
        }
        return myreturn;
    },

    closeairwindow: function () {
        if ($('#modal_windows2').is(':visible')) {
            $('#modal_windows2').modal('hide');

            $('#modal_windows').modal('show');

        } else {
            $('#modal_windows').modal('hide');
        }
    },

    silentHandler: function (route, frmID, frmExtraFields, setting, popModal, container, loading_indicator) {
        if (popModal.show) {
            if (!!popModal.size && popModal.size == '') popModal.size = 'modal-lg';

            if (popModal.modal == 'modal_media') {

                $('#modal_media .modal-dialog')
                    .removeClass('modal-xl')
                    .removeClass('modal-sm')
                    .removeClass('modal-lg')
                    .removeClass('modal-fullscreen')
                    .addClass(popModal.size);

                $("#air_media").html('');
                $("#modal_media").modal('show');
            }
            else if (popModal.modal == 'modal_iframe') {

                $('#modal_iframe .modal-dialog')
                    .removeClass('modal-xl')
                    .removeClass('modal-sm')
                    .removeClass('modal-lg')
                    .removeClass('modal-fullscreen')
                    .addClass(popModal.size);
                $("#air_iframe").contents().find('body').html('');
                $("#modal_iframe").modal('show');
            }
            else {
                $('#modal_windows .modal-dialog')
                    .removeClass('modal-xl')
                    .removeClass('modal-sm')
                    .removeClass('modal-lg')
                    .removeClass('modal-fullscreen')
                    .addClass(popModal.size);

                if ($('#modal_windows').is(':visible')) {
                    $('#modal_windows').modal('hide');
                    $('#modal_windows2').modal('show');
                } else {
                    $("#air_windows").html('');
                    $("#modal_windows").modal('show');

                }
            }


        }

        /**/
        let form = document.createElement("form");
        if (!!frmID) {
            if (frmID.includes(".")) {
                form = $(frmID);
            } else {
                form = $("#" + frmID);
            }

        }

        let fd = new FormData(form[0]);
        if (!!frmExtraFields) {
            for (var key in frmExtraFields) {
                if (frmExtraFields.hasOwnProperty(key)) {
                    fd.append(key, frmExtraFields[key]);
                }
            }
        }

        fd.append('_token', env.token);
        let mode = 'axios';
        // if (!!setting) {
        //     mode = !!setting.mode ? setting.mode : mode;
        // }
        fd.append('action_handler_mode', mode);
        fd.append('permission', 'no');
        let that = this;
        axios({
            method: 'post',
            url: route,
            data: fd,
            headers: { 'Content-Type': 'multipart/form-data' }
        })
            .then(function (response) {
                // handle succes
                let get_content = response.data;

                if (!!setting && typeof setting.fnSuccess === "function") {
                    setting.fnSuccess(get_content);
                };

                if (get_content.type == 'submit') {
                    let submit_form = null;
                    if (!!frmID) {
                        if (frmID.includes(".")) {
                            submit_form = $(frmID);
                        } else {
                            submit_form = $("#" + frmID);
                        }

                    }
                    if (!!frmExtraFields) {
                        for (var key in frmExtraFields) {
                            if (frmExtraFields.hasOwnProperty(key)) {
                                submit_form.append('<input type="hidden" name="' + key + '" value="' + frmExtraFields[key] + '" /> ');
                            }
                        }
                    }
                    submit_form.submit();

                }
                else if (get_content.type == 'iframe') {
                    var air_iframe = $("#air_iframe").contents().find('body');
                    air_iframe.html(that.decodeHtml(get_content.html));

                }

                var html = '';
                if (that.isObject(get_content)) {

                    /*work with Close Window, Taost or any Alert*/

                    if (!!get_content.message && get_content.message.length > 0) {

                        that.successAlert(get_content.message);
                    }

                    if (!!get_content.callback) {
                        if (get_content.callback.toLowerCase() == 'formreset') {
                            $('tr.table_row').not(':first').not(':last').remove();
                            form[0].reset();
                        } else {
                            that.callbackHandler(get_content, get_content.callback);
                        }
                    }
                    if (!!get_content.html) {
                        html = get_content.html;
                    }
                    else {
                        html = '';
                        that.closeairwindow();
                    }

                }
                else {
                    html = get_content;
                }

                if (!!container && html != '') {

                    if (popModal.modal == 'modal_media') {
                        $("#air_media").html('').html(get_content);
                        return null;
                    } else {
                        if ($('#modal_windows').is(':visible') && container == 'air_windows') {
                            $("#air_windows").html('').html(get_content);
                            return null;
                        }
                        if ($('#modal_windows2').is(':visible')) {
                            $("#air_windows2").html('').html(get_content);
                            return null;
                        }
                    }
                    $("#" + container).html('');
                    $("#" + container).html(html);

                }


            })
            .catch(function (error) {
                if (!!error.response) {
                    let errors = error.response.data;
                    if (!!errors.message && errors.message.length > 0) {
                        that.errorAlert(errors.message);
                    }
                    ////
                    if (!!errors.data && errors.type == "validator") {
                        let multi_message = '';
                        for (var key in errors.data) {
                            if (errors.data.hasOwnProperty(key)) {
                                let container = key.replace(".", "-");

                                if (container.includes("_alert")) {
                                    multi_message += errors.data[key][0] + "<br>"

                                }

                                if ($("#" + container + '-error').length == 0) {

                                    const myArray = container.split("-");
                                    $("#" + myArray[0] + "-error")
                                        .after('<span id="' + container + '-error" class="error invalid-feedback show">' + errors.data[key][0] + '</span>');
                                }
                                else {

                                    $('#' + container + '-error').show().html(errors.data[key][0]);
                                }

                            }
                        }

                        if (multi_message.length > 0) {
                            that.errorAlert(multi_message);
                        }
                    }

                }
                if (!!setting && typeof setting.fnError === "function") {
                    setting.fnError(error.response);
                };
            })
            .then(function () {
                // always executed
                if (!!setting && typeof setting.fnAlways === "function") {
                    setting.fnAlways();
                };
            });

    },
    redirectto: function (jsondata) {
        window.location.href = jsondata.data.route;
    },
    submitPerpage: function (sort, order, querystr, objname) {
        let perpage = $("#txtperpage_" + objname).val();
        var url = '?perpage=' + perpage;
        if (!!sort) {
            url = url + '&sort=' + sort;

            if (!!order) {
                url = url + '&order=' + order;
            }
        }

        if (!!querystr && querystr.length > 0) {

            querystrurl = querystr.join("&");
            url = url + '&' + querystrurl;
        }

        $(location).attr('href', url);
    },
    makeDropdownByJson: (element, data, selectIndex, introductionMsg) => {
        let dropdown = $(element);
        dropdown.empty();
        if (!!introductionMsg) {
            dropdown.append('<option selected="true" disabled>' + introductionMsg + '</option>');
        }
        dropdown.prop('selectedIndex', 0);
        //let data = [{ "id": "1", "title": "test1" }];
        $.each(data, function (key, entry) {
            if (selectIndex == entry.id) {
                dropdown.append($('<option></option>').attr('value', entry.id).text(entry.title)).attr('checked');
            } else {
                dropdown.append($('<option></option>').attr('value', entry.id).text(entry.title));
            }

        })
    },

    errorAlert: (message) => {
        // $(document).Toasts('create', {
        //     class: 'bg-danger ct-min-toast-width',
        //     title: 'Invalid',
        //     subtitle: '',
        //     body: message,
        //     fade: true,
        //     autohide: true,
        //     delay: 3000,
        //     //position: 'bottomLeft',
        // });

        notif({
            msg: message,
            type: "error",
            position: "right",
            fade: true,
            clickable: true,
            timeout: 2000,
        });

    },

    successAlert: (message) => {
        notif({
            msg: message,
            type: "success",
            position: "right",
            fade: true,
            clickable: true,
            timeout: 2000
        });
        // $(document).Toasts('create', {
        //     class: 'bg-success ct-min-toast-width',
        //     title: 'Success',
        //     subtitle: '',
        //     body: message,
        //     fade: true,
        //     autohide: true,
        //     delay: 3000,
        //     //position: 'bottomLeft',
        // });
    },

    errorAlertMultiline: (message) => {
        notif({
            msg: message,
            type: "error",
            position: "right",
            fade: true,
            clickable: true,
            timeout: 2000,
            multiline: true
        });

    },

    refine_error: () => {
        $("tr.table_row").each(function (index) {
            $(this).find(".error").each(function () {
                var new_id = $(this).data('error') + "-" + index + "-error"
                $(this).attr('id', new_id);
            });

        });
    },
    /**+++++ enable and disable Element of form +++*/
    enableDisableByLang: (combo, lang, group_ele, enable_id) => {
        //elements_id must be ARRAY
        for (i = 0; i < lang.length; i++) {
            combo.parent().children('#' + group_ele + lang[i]).addClass('hide');
        } //end for
        combo.parent().children('#' + group_ele + enable_id).removeClass('hide');
    },

    setInfoByEle: (jsondata) => {
        // closeairwindow();
        $.each(jsondata.data, function (key, val) {
            $(key).val(val);
            $(key).html(val);

        });
    },

    silentpagination: () => {
        // alert('aaaa');
        console.log($(this).text());
    },
    sanitizeHTML: (string) => {
        const map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#x27;',
            "/": '&#x2F;',
        };
        const reg = /[&<>"'/]/ig;
        return string.replace(reg, (match) => (map[match]));

        // return string.replace(/[^\w. ]/gi, function (c) {
        //     return '&#' + c.charCodeAt(0) + ';';
        // });
    },
    maincurrencypartern() {
        const main_currency = currencyinfo[store.state.maincurrency_id];
        return {
            symbol: this.decodeHtml(main_currency.symbol),
            decimalCount: sysconfig.numberdecimal,
            decimal: sysconfig.decimalseparator,
            thousands: sysconfig.thousandseparator,
            position: sysconfig.symbol_position,
        }
    },

    subcurrencypartern() {
        const main_currency = currencyinfo[store.state.subcurrency_id];
        return {
            symbol: this.decodeHtml(main_currency.symbol),
            decimalCount: sysconfig.numberdecimal,
            decimal: sysconfig.decimalseparator,
            thousands: sysconfig.thousandseparator,
            position: sysconfig.symbol_position,
        }
    },

    formatMoney(amount, partern, withsymbol = true) {
        let symbol = "$";
        let decimalCount = 2;
        let decimal = ".";
        let thousands = ",";
        let position = 1;

        if (partern) {
            symbol = partern.symbol;
            decimalCount = partern.decimalCount;
            decimal = partern.decimal;
            thousands = partern.thousands;
            position = partern.position;
        }
        try {

            decimalCount = Math.abs(decimalCount);
            decimalCount = isNaN(decimalCount) ? 2 : decimalCount;

            const negativeSign = amount < 0 ? "-" : "";
            let i = parseInt(amount = Math.abs(Number(amount) || 0).toFixed(decimalCount)).toString();

            let j = (i.length > 3) ? i.length % 3 : 0;

            let format = negativeSign + (j ? i.substr(0, j) + thousands : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousands) + (decimalCount ? decimal + Math.abs(amount - i).toFixed(decimalCount).slice(2) : "");

            if (withsymbol == false) return format;
            switch (parseInt(position)) {
                case 1:
                    return symbol + format;
                // break;
                case 2:
                    return format + symbol;
                //break;
                case 3:
                    return symbol + ' ' + format;
                //break;

                case 4:
                    return format + ' ' + symbol;
                //break;

                default:
                    return format;
            }

        } catch (e) {
            console.log(e)
        }
    },


    initProductSize(sizes, all_size) {
        let sizes_item = [];
        if (sizes.length > 0) {
            sizes_item = [];
            let arr_size = sizes.split(",");
            if (arr_size.length > 0) {
                for (let ind in arr_size) {
                    let sizeid = arr_size[ind];
                    sizes_item.push({
                        id: sizeid,
                        name: all_size[sizeid],
                        selected: false,
                    });
                }

                sizes_item[0].selected = true;

            }
        }

        return sizes_item;
    },

    initProductColor(colors, all_color) {
        let colors_item = [];
        // let colors_item = [{id:0}];
        if (colors.length > 0) {
            colors_item = [];
            let arr_color = colors.split(",");
            if (arr_color.length > 0) {
                for (let ind in arr_color) {
                    let colorid = arr_color[ind];
                    colors_item.push({
                        id: colorid,
                        color: '',
                        name: all_color[colorid],
                        selected: false,
                    });
                }

                colors_item[0].selected = true;

            }
        }

        return colors_item;
    },

    initProductUnit(values, all_init) {
        //console.log(all_init);
        let items = [{ id: 0, name: 'Unit' }];
        values = JSON.parse(values);
        if (values.length > 0) {
            items = [];
            values.forEach(item => {
                let id = item.id;
                items.push({
                    id: id,
                    name: all_init[id],
                    info: item,
                    selected: false,
                });
            });

            items[0].selected = true;
        }
        return items;
    },

    initProduct(customertype, item, all_size, all_color, all_unit) {

        let unitprice = 0.0;
        let unitcost = 0.0;

        let pricing = JSON.parse(item.pricing);

        let dfpricing = pricing['dfpricing'];
        if (customertype == 0) {
            unitprice = parseFloat(dfpricing);
        } else {
            unitprice = parseFloat(pricing[customertype]);
            if (!unitprice || unitprice == 0 || unitprice == '')
                unitprice = dfpricing;
        }

        unitprice = this.exchange(unitprice, store.state.prev_maincurrency_id, store.state.maincurrency_id, store.state.exchange_rate);

        if (item.xtraprice == null || item.xtraprice == '') {
            item.xtraprice = '{}';
        }

        unitcost = parseFloat(item.costing);
        unitcost = this.exchange(unitcost, store.state.prev_maincurrency_id, store.state.maincurrency_id, store.state.exchange_rate);
        let tmp_units = [];
        if (item.id == 0) {
            for (const key in all_unit) {
                tmp_units.push({
                    id: key,
                });

            }
            item.units = JSON.stringify(tmp_units);
        }

        // console.log(item.units);
        // console.log(all_unit);
        // console.log(this.initProductUnit(item.units, all_unit));

        return {
            id: item.id,
            type: item.product_type,
            isservice: item.isservice,
            imginfo: item.imginfo,
            discount: item.discount,
            title: this.decodeHtml(item.title),
            qty: 1,
            pricing: pricing,
            priceformat: item.priceformat,
            unitprice: unitprice,
            unitcost: unitcost,
            units_item: this.initProductUnit(item.units, all_unit),
            unit_id: item.unit_id,
            convert_qty: 1,
            pvat: item.pvat,
            sizes_item: this.initProductSize(item.sizes, all_size),
            colors_item: this.initProductColor(item.colors, all_color),
            xtraprice: JSON.parse(item.xtraprice),
            madewith: item.madewith,
            printer_id: item.printer_id,
            printstatus: 1,
            subnote: '',

        };
    },

    initialProductToList(product, sizeid, colorid, currencyInfo, sysconfig) {
        let sizeColor = sizeid + '-' + colorid;
        let xtraprice = product.xtraprice[sizeColor] ? parseFloat(xtraprice) : 0;
        let unitprice = parseFloat(product.unitprice) + parseFloat(xtraprice);
        let partern = this.maincurrencypartern();
        let unitpricelabel = this.formatMoney(unitprice, partern);
        let size_id = 0;
        let color_id = 0;
        if (product.sizes_item.length > 0) {
            // size_id = product.sizes_item[0].id;
            size_id = sizeid==0?product.sizes_item[0].id:size_id;
        }

        if (product.colors_item.length > 0) {
            // color_id = product.colors_item[0].id;
            color_id = colorid==0? product.colors_item[0].id :color_id;
        }
        var select_unit = product.units_item.find(item => item.selected == true);
        let unit_name = "Unit";
        if (select_unit != undefined) {
            unit_name = select_unit.name;
        }
        let productToPos = {
            uuid: this.uuid(),
            id: 0,
            product_id: product.id,
            product_type: product.type,
            isservice: product.isservice,
            description: product.title, /*update*/
            imginfo: product.imginfo,
            size_id: size_id, /*update*/
            color_id: color_id, /*update*/
            unit_id: product.unit_id, /*update*/
            unit_name: unit_name,
            convert_qty: product.convert_qty,
            qty: product.qty, /*update*/
            qty_tostock: product.qty * product.convert_qty,
            remain_qty: 0,
            return_qty: 0,
            unitprice: unitprice, /*update*/
            unitcost: product.unitcost, /*update*/
            unitpricelabel: unitpricelabel,
            subdiscount: Math.abs(product.discount), /*update*/
            subvat: product.pvat, /*update*/
            amount: 0,
            amount_format: '',
            batch: '', /*update*/
            iscycle: '', /*update*/
            product_expired_date: '',
            printer_id: product.printer_id,
            print_status: product.printstatus, /*update*/
            subnote: '', /*update*/
            usage_note: '', /*update*/
            pricing: product.pricing,
            subdiscounttype: product.discount == 0 ? sysconfig.df_dis : product.discount < 0 ? -1 : 1,
            ordering:0,
            currentstock: 0,
            countstock:0,
            lostsurplus:'',
            product: product,
            
        };
        // console.log(productToPos);
        return productToPos;
    },

    addProductToList(amount_type, item, currencyInfo) {
        if (amount_type == 'cost') item.subvat = 0;
        store.state.productlist.push(item);

    },

    removeItemFromList(index, id, currencyInfo) {
        store.state.productlist.splice(index, 1);
        if (id > 0) {
            store.state.removelist.push(id);
        }
    },

    calAmount(amount_type, unitprice, unitcost, qty, discount, discounttype, vat) {
        if (amount_type == 'cost') {
            unitprice = unitcost;
        }
        let caldiscount = unitprice;
        let calvat = 0;
        let amount = 0;
        discount = Math.abs(discount);
        if (discount > 0) {
            if (discounttype == -1) {
                caldiscount = unitprice - discount;
            } else {
                caldiscount = unitprice - ((unitprice * discount) / 100);
            }
        }

        amount = (caldiscount * qty);
        if (vat) {
            calvat = (amount * vat) / 100;
        }
        amount = amount + calvat;
        amount = parseFloat(amount.toFixed(2));
        return amount;
    },

    sumBy(items) {
        return items.reduce(function (total, item) {
            return total + item.qty;
        }, 0);
    },

    changeCustomer() {
        store.state.productlist.forEach(item => {
            let customertype_id = store.state.mainbilling.customertype_id;
            let pricing = item.pricing; //JSON.parse(item.pricing);

            let dfpricing = pricing["dfpricing"];

            if (customertype_id == 0) {
                unitprice = parseFloat(dfpricing);
            } else {
                unitprice = parseFloat(pricing[customertype_id]);
                if (!unitprice || unitprice == 0 || unitprice == '')
                    unitprice = dfpricing;
            }
            unitprice = this.exchange(unitprice, store.state.prev_maincurrency_id, store.state.maincurrency_id, store.state.exchange_rate);
            let partern = this.maincurrencypartern();
            let unitpricelabel = this.formatMoney(unitprice, partern);
            item.unitprice = unitprice;
            item.unitpricelabel = unitpricelabel;

        });
    },

    compairstock(current, counted){
        
        const lostsurplus = current - counted;
        if(lostsurplus==0){
            return {code:0, title: 'Equal'};
        }
        else if(lostsurplus>0){
            return {code:1, title: 'Surplus ' + Math.abs(lostsurplus)};
        }
        else{
            return {code:2, title: 'Lost ' + Math.abs(lostsurplus)};
        }
    },

    calculator(amount_type, currencyInfo) {

        let subtotal = 0;
        let amount = 0;
        let cartCount = 0;
        let ordering = 0;
        if (store.state.productlist.length > 0) {

            cartCount = this.sumBy(store.state.productlist);
            store.state.productlist.forEach(item => {
                item.ordering = ordering++;
                amount = this.calAmount(
                    amount_type,
                    item.unitprice,
                    item.unitcost,
                    parseFloat(item.qty),
                    parseFloat(item.subdiscount),
                    item.subdiscounttype,
                    item.subvat);
                let partern = this.maincurrencypartern();
                item.qty_tostock = parseFloat(item.convert_qty) * parseFloat(item.qty);
                item.amount = parseFloat(amount);
                item.amount_format = this.formatMoney(amount, partern);
                subtotal = subtotal + item.amount;
                
            });
        }
        //billSummary($subtotal, $maindiscount, $maindiscounttype, $mainvat, $rec, $rec_native, currencyinfo)
        let mainDiscount = 0;
        let mainDiscountType = 0;
        let mainVat = 0;
        let received_amount = 0;
        if (store.state.mainbilling.maindiscount) {
            mainDiscount = parseFloat(store.state.mainbilling.maindiscount);
        }

        mainDiscountType = parseFloat(store.state.mainbilling.maindiscounttype);
        if (store.state.mainbilling.mainvat) {
            mainVat = parseFloat(store.state.mainbilling.mainvat);
        }

        received_amount = store.state.mainbilling.received_amount;

        let billSummary = this.billSummary(
            subtotal,
            mainDiscount,
            mainDiscountType,
            mainVat,
            received_amount,
            cartCount,
            currencyInfo
        );

        store.state.lastCalculate = billSummary;
    },

    billSummary($subtotal, $maindiscount, $maindiscounttype, $mainvat, $received_amount, $cartcount, currencyinfo) {
        let main_partern = this.maincurrencypartern();
        let sub_partern = this.subcurrencypartern();
        let $total = 0;
        let $discount = 0;
        if ($maindiscounttype == -1) {
            $total = $subtotal - Math.abs($maindiscount);
            $discount = Math.abs($maindiscount)
        } else {
            $total = $subtotal - (($subtotal * $maindiscount) / 100);
            $discount = Math.abs((($subtotal * $maindiscount) / 100))
        }

        let subtotal_format = this.formatMoney(parseFloat($subtotal), main_partern);
        let subtotal_sub = this.exchange($subtotal, store.state.maincurrency_id, store.state.subcurrency_id, store.state.exchange_rate);
        let subtotalsub_format = this.formatMoney(parseFloat(subtotal_sub), sub_partern);

        let total_format = this.formatMoney(parseFloat($total), main_partern);
        let $grandtotal = $total + (($total * $mainvat) / 100);
        let grandtotal_format = this.formatMoney($grandtotal, main_partern);

        let grandtotalsub = this.exchange($grandtotal, store.state.maincurrency_id, store.state.subcurrency_id, store.state.exchange_rate);
        let grandtotalsub_format = this.formatMoney(grandtotalsub, sub_partern);

        //for received payment and chanage

        let received_amount_inmain = this.exchange($received_amount, store.state.mainbilling.currency_inused.id, currencyinfo.main.id, store.state.exchange_rate);
        let change_amount = 0;
        let change_format, changesub_format = '';
        change_amount = received_amount_inmain - $grandtotal;
        if (change_amount > 0) {
            change_format = this.formatMoney(change_amount, main_partern);
            let changesub_amount = this.exchange(change_amount, store.state.maincurrency_id, store.state.subcurrency_id, store.state.exchange_rate);
            changesub_format = this.formatMoney(changesub_amount, sub_partern);
        }

        let summary = {
            cartcount: $cartcount,
            subtotal: subtotal_format,
            subtotal_sub: subtotalsub_format,
            discount: $discount,
            total: total_format,
            grandtotal_noformat: $grandtotal,
            grandtotal: grandtotal_format,
            grandtotal_sub: grandtotalsub_format,

            // received_amount: $grandtotal,
            change_format: change_format,
            changesub_format: changesub_format,
        };

        /*
        let summary = {
            cartcount: $cartcount,
            subtotal: $subtotal,
            subtotal_native: $nativesubtotal,
            discount: $discount,
            total: $total_format,
            total_native: $total_native,
            grandtotal: $grandtotal_format,
            grandtotal_native: $grandtotal_native_format,
            rc: $rec,
            rc_native: $rec_native,
            rc_format: this.formatMoney($rec, currencyinfo),
            rc_nativeformat: subcurrency + this.formatMoney($rec_native, currencyinfo, false),
            change: $change_lb + '',
            change_native: $change_native_lb + '',
            grandtotal_noformat: $grandtotal,
            grandtotal_native_noformat: $grandtotal_native
        };
        */


        return summary;
    },

    newProductTemplate(title, unitprice) {
        unitprice = parseFloat(unitprice);
        if (title == "" || title == null) {
            title = "Unknown";
        }
        if (unitprice < 0) {
            unitprice = 1;
        }
        let pricing = '{"dfpricing":"' + unitprice + '", "pricerange":"[]"}';
        pricing = JSON.stringify(JSON.parse(pricing));
        let id = 0;
        if (title == 'Seperate') {
            id = -1;
        }
        return {
            "id": id,
            "type": "item",
            "isservice": "yes",
            "productcode": "",
            "sizes": "",
            "colors": "",
            "units": "[]",
            "unit_id": 1,
            "costing": "0",
            "pricing": pricing,
            "discount": 0,
            "pvat": 0,
            "product_type": "item",
            "imginfo": "",
            "title": title,
            "unit": "",
            "priceformat": "",
            "xtraprice": "{}"
        };

    },

    decodeHtml(encodedString) {
        var decoded = $("<div/>").html(encodedString).text();
        return decoded;
    },

    uuid() {
        var d = new Date().getTime();//Timestamp
        var d2 = ((typeof performance !== 'undefined') && performance.now && (performance.now() * 1000)) || 0;//Time in microseconds since page-load or 0 if unsupported
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16;//random number between 0 and 16
            if (d > 0) {//Use timestamp until depleted
                r = (d + r) % 16 | 0;
                d = Math.floor(d / 16);
            } else {//Use microseconds since page-load if supported
                r = (d2 + r) % 16 | 0;
                d2 = Math.floor(d2 / 16);
            }
            return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
        });
    },

    exchange($amount, $from, $to, $exchange_rate, $used = 'report') {
        if ($from == $to || $exchange_rate == undefined) {
            return $amount;
        }
        //$exchange_rate = json_decode($exchange_rate, true);
        $main = $exchange_rate['main_currency'];

        //convert from to main currency
        $tomain = $amount;
        if ($from != $main) {
            $operator = $exchange_rate[$from]['operator'] == '*' ? '/' : '*';
            $rate_amount = $exchange_rate[$from][$used];
            if ($operator == '*') {
                $tomain = $amount * $rate_amount;
            }
            else {
                $tomain = $amount / $rate_amount;
            }
        }

        //start exchange from mian
        $exchange = $tomain;
        if ($to != $main) {
            $operator = $exchange_rate[$to]['operator'];
            $rate_amount = $exchange_rate[$to][$used];
            if ($operator == '*') {
                $exchange = $tomain * $rate_amount;
            }
            else {
                $exchange = $tomain / $rate_amount;
            }
        }
        // dd($exchange);
        // console.log($operator);
        return $exchange;
    },

    sizeColorCaption(sizes, size_id, colors, color_id) {
        // if (sizes[size_id] && colors[color_id]) {
        //     return sizes[size_id].name + '-' + colors[color_id].name;
        // } else if (sizes[size_id]) {
        //     return sizes[size_id].name;
        // } else if (colors[color_id]) {
        //     return colors[color_id].name;
        // } else return '';
        var select_size = sizes.find(item => item.id === size_id.toString());
        var select_color = colors.find(item => item.id === color_id.toString());

        if (select_size && select_color) {
            return select_size.name + '-' + select_color.name;
        } else if (select_size) {
            return select_size.name;
        } else if (select_color) {
            return select_color.name;
        } else return '';

    },

    scrollTitle(title_container, product_title) {
        let $ = window.$;
        $(document).delegate("." + title_container, "mouseover", function () {
            var title = $(this).find('.' + product_title);
            var canScroll = parseInt(title.width()) - parseInt($(this).width());
            if (canScroll < 0) { canScroll = 0; }
            var moveStr = 'translateX(' + (canScroll * -1) + 'px)';
            title.css("transform", moveStr);
        });

        $(document).delegate("." + title_container, "mouseout", function () {
            var title = $(this).find('.' + product_title);
            title.css("transform", 'translateX(0px)');
        });
    },

    async checkOnlineStatus() {
        try {
            const online = await fetch(store.state.apiurl + "/api/internet");
            //const online = await axios.get(store.state.apiurl + '/api/internet');
            return online.status >= 200 && online.status < 300; // either true or false
        } catch (err) {
            return false; // definitely offline
        }


    },
    formatID(num) {
        const digit = sysconfig.iddigit;
        return String(num).padStart(digit, '0')
    },
    formatCurrency(number) {
        var n = number.split('').reverse().join("");
        var n2 = n.replace(/\d\d\d(?!$)/g, "$&,");
        return n2.split('').reverse().join('');
    },

    togglePassword(icon_obj) {
        const i_tag = icon_obj.find("i");
        i_tag.toggleClass("fa-eye fa-eye-slash");

        // get the attribute value
        const inputField = icon_obj.prev();
        var type = inputField.attr("type");
        // now test it's value
        if (type === 'password') {
            inputField.attr("type", "text");
        } else {
            inputField.attr("type", "password");
        }
    },

    num: 33,
};