/**
 * Created by zzt on 6/13/16.
 *
 */
/**
 * stub function for test
 */
function getPriceById() {
    return 10;
}


var Utility = function () {
    return {
        extractNumber: function (string) {
            return parseInt(string.replace(/\D/g, ''));
        }
    };
}();

const DELIVERY_GOAL = 30;

var UI = function () {
    const MORE = 1;
    const LESS = -1;
    const ORIGINAL = 0;
    const ONE_ROW_HEIGHT = 45;
    const OLD = 43;
    return {
        updateTotal: function (newCount, newTotal) {
            var div = $('div.shop-cartfooter');
            // update count
            var pieces = div.find('span.shop-cartpieces');
            if (newCount > 0) {
                pieces.show();
            } else {
                pieces.hide();
            }
            pieces.html(newCount);
            // update money
            div.find('p.shop-cartfooter-text').html(newTotal);
            // update button
            var button = div.find('button');
            if (newTotal >= DELIVERY_GOAL) {
                // enable check out
                button.removeAttr("disabled").removeClass('disabled').html('去结算');
            } else {
                button.prop('disabled', 'disabled').addClass('disabled').html('还差' + (DELIVERY_GOAL - newTotal) + '元起送');
            }
        },
        updateHeight: function (type) {
            var div = $('div.shop-cartbasket');
            var old = Utility.extractNumber(div.css('top'));
            var newH;
            switch (type) {
                case MORE:
                    newH = old + ONE_ROW_HEIGHT;
                    break;
                case LESS:
                    newH = old - ONE_ROW_HEIGHT;
                    break;
                case ORIGINAL:
                    newH = OLD;
                    break;
            }
            div.css('top', -newH + 'px');
        },
        /**
         * dessert list add button invoke this
         * @param item
         * @param newCount
         * @param newTotal
         */
        addGoods: function (item, newCount, newTotal) {
            var html = '<div class="shop-cartbasket-tablerow" >' +
                '<div class="cell itemname" title="${item.name}">${item.name}</div>' +
                '<div class="cell itemquantity">' +
                '<button onclick="updateCartItemNum(SUB, this)">-</button>' +
                '<input value="1" onchange="updateFromInput(this)" min="1" max="100" >' +
                '<button onclick="updateCartItemNum(ADD, this)">+</button></div>' +
                '<div class="cell itemtotal">¥${item.price * item.quantity}</div></div>';
            var htmlItem = $($.parseHTML(html));
            htmlItem.attr('id', item.did);
            htmlItem.find('.itemname').attr('title', item.name).html(item.name);
            htmlItem.find('.itemtotal').html('¥' + (item.price * item.num));
            $('#shopCart').after(htmlItem[0].outerHTML);
            // update total
            this.updateTotal(newCount, newTotal);
            this.updateHeight(MORE);
        },
        /**
         * dessert list '-' button invoke;
         * cart list '-' button invoke
         * @param id
         * @param newCount
         * @param newTotal
         */
        removeGoods: function (id, newCount, newTotal) {
            var item = $('#' + id);
            var price = getPriceById(id);
            item.remove();
            this.updateTotal(newCount, newTotal);
            this.updateHeight(LESS);
        },
        /**
         * dessert list '-' button invoke;
         * cart list '-' button invoke;
         * cart list '+' button;
         * cart list input field;
         * @param id
         * @param newNum
         * @param newCount
         * @param newTotal
         */
        updateNum: function (id, newNum, newCount, newTotal, newLineSum) {
            var item = $('#' + id);
            item.find('input').val(newNum);
            var itemTotal = item.find('.itemtotal');
            itemTotal.html('¥' + (newLineSum));
            // update total
            this.updateTotal(newCount, newTotal);
        },
        clearCart: function () {
            $('div.shop-cartbasket-tablerow').remove();
            this.updateTotal(0, 0);
            this.updateHeight(ORIGINAL);
        }
    }
}();

var Server = function () {
    return {
        getPriceById: function (did) {
            $.ajax({
                    type: 'GET',
                    url: 'UnitPrice',
                    data: {did: did},
                    success: function (data) {
                        console.log(data);
                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                }
            );
        },
        addGoods: function (item) {
            $.ajax({
                type: "POST",
                url: "CartAdd",
                data: item,
                success: function (response) {
                    console.log(response);
                    UI.addGoods(item, response['newCount'], response['newTotal']);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        },
        removeGoods: function (dessertId) {
            $.ajax({
                type: "POST",
                url: "CartRemove",
                data: {
                    did: dessertId
                },
                success: function (response) {
                    console.log(response);
                    UI.removeGoods(dessertId, response['newCount'], response['newTotal']);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        },
        updateNum: function (did, newNum) {
            $.ajax({
                    type: 'POST',
                    url: 'CartUpdateNumber',
                    data: {
                        did: did,
                        num: newNum
                    },
                    success: function (response) {
                        console.log(response);
                        UI.updateNum(did, newNum, response['newCount'], response['newTotal'], response['lineSum']);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                }
            );
        },
        clearCart: function () {
            $.ajax({
                    type: 'POST',
                    url: 'CartClear',
                    success: function (data) {
                        console.log(data);
                        UI.clearCart();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                }
            );
        }
    }
}();

/**
 * for add dessert into cart, invoke by branch
 * @param goodsId
 * @param name
 * @param price
 */
function addCartItem(goodsId, name, price) {
    var cartItem = newCartItem(goodsId, name, price);
    Server.addGoods(cartItem);
}


function removeCartItem(goodsId) {
    Server.removeGoods(goodsId);
}

const ADD = 1;
const SUB = -1;

/**
 * private function
 * @param src
 * @returns {{num: *, id: *}}
 */
function getCartItemInfo(src) {
    var num = $(src);
    var div = num.parents('div.shop-cartbasket-tablerow');
    var id = div.attr('id');
    return {
        num: div.find('input').val(),
        id: id
    };
}
function valid(now, num) {
    return now + num > 0;
}


function updateCartInMainPage(change, did, original) {
    var changeI = parseInt(change);
    var originalI = parseInt(original);
    if (valid(originalI, changeI)) {
        Server.updateNum(did, changeI + originalI);
    } else {
        removeCartItem(did);
    }
}

/**
 * update item number by button(-/+) or number input
 * @param change ADD or SUB or number input
 * @param src event source
 */
function updateCartItemNum(change, src) {
    var item = getCartItemInfo(src);
    updateCartInMainPage(change, item.id, item.num);
}

function newCartItem(id, name, price) {
    return {
        did: id,
        num: 1,
        name: name,
        price: price
    }
}


function updateFromInput(numInput) {
    var item = getCartItemInfo(numInput);
    updateCartInMainPage(numInput.value, item.id, 0);
}

function checkout() {
    window.location = "../CheckOut";
}

addCartItem(1, "....", 10);