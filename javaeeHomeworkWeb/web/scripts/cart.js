/**
 * Created by zzt on 6/13/16.
 */

var shopCart = {
    vm: {
        groups: [],
        quantity: 0,
        total: 0,
    },
    currentGroupIndex: 0,
    clearGroup: function (index) {

    },
    subEntity: function (item, $event) {

    },
    addEntity: function (item, $event) {

    },
    updateFromInput: function (item, quantity) {
    }
};


var cart = Object.create(null);

var UI = function () {
    return {
        addGoods: function (id) {

        },
        removeGoods: function (id) {

        },
        updateNum: function (id, num) {

        }
    }
};

function addCartItem(goodsId) {
    cart[goodsId] = newCartItem(goodsId);
    UI.addGoods(goodsId);
}

const ADD = 1;
const SUB = -1;

function getCartItem(goodsId) {
    return cart[goodsId];
}

function removeCartItem(goodsId) {
    delete cart.goodsId;
    UI.removeGoods(goodsId);
}

/**
 *
 * @param goodsId
 * @param num ADD or SUB
 */
function updateNum(goodsId, num) {
    var item = getCartItem(goodsId);
    if (item.valid(num)) {
        item.update_num(num);
    } else {
        removeCartItem(goodsId);
    }
}

function newCartItem(id) {
    return {
        goodsId: id,
        num: 0,
        get_num: function () {
            return num;
        },
        update_num: function (n) {
            num += n;
        },
        set_num: function (n) {
            num = n;
        },
        valid: function (n) {
            return num + n > 0;

        }
    }
}


function clearCart() {
    for (var id in cart) {
        UI.removeGoods(id);
    }
}