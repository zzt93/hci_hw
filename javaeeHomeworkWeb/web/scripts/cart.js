/**
 * Created by zzt on 6/13/16.
 */

// var shopCart = {
//     clearGroup: function (index) {
//
//     },
//     subEntity: function (item, $event) {
//
//     },
//     addEntity: function (item, $event) {
//
//     },
//     updateFromInput: function (item, quantity) {
//     }
// };


var UI = function () {
    return {
        addGoods: function (item) {

        },
        removeGoods: function (id, $src) {

        },
        updateNum: function (id, num) {

        }
    }
}();

var Server = function () {
    return {
        addGoods: function (item) {

        },
        removeGoods: function (id) {

        },
        updateNum: function (id, num) {
            $.post(
                '',
                {
                    id: id,
                    num: num
                },
                function (data) {
                    console.log(data);
                    if (data === 'true') {
                        $(link).hide();
                        $(link).prev().show();
                    }
                }
            );
        }
    }
}();

function addCartItem(goodsId, name, price) {
    var cartItem = newCartItem(goodsId, name, price);
    UI.addGoods(cartItem);
    Server.addGoods(cartItem);
}


function removeCartItem(goodsId, $src) {
    UI.removeGoods(goodsId, $src);
    Server.removeGoods(goodsId);
}

const ADD = 1;
const SUB = -1;

function getCartItemNum($src) {
    var num = $($src);
    var div = num.parents('div');
    return div.find('input').val();
}
function valid(now, num) {
    return now + num > 0;
}
/**
 * update item number by button(-/+) or number input
 * @param goodsId
 * @param num ADD or SUB
 */
function updateCartItemNum(goodsId, num, $src) {
    var itemNum = getCartItemNum($src);
    if (valid(itemNum, num)) {
        UI.updateNum($src);
        Server.updateNum(goodsId, itemNum + num);
    } else {
        removeCartItem(goodsId, $src);
    }
}

function newCartItem(id, name, price) {
    return {
        did: id,
        num: 1,
        name: name,
        price: price,
        valid: function (n) {
            return num + n > 0;
        }
    }
}


function updateFromInput($input) {
    var num = $($input);
    var div = num.parents('div');
    var id = div.attr('id');
    updateCartItemNum(id, num.val(), $input);
}


function checkout() {
    window.location = "";
}