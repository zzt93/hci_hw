/**
 * Created by zzt on 6/13/16.
 */

/**
 * update item number of page
 * @param goodsId
 * @param num
 */
function updateItemNum(goodsId, num) {
    var input = document.getElementById(goodsId+"input");
    input.setAttribute("value",num);
}

function getPriceById(id) {
    return document.getElementById(id+"input");
}
