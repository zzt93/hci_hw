/**
 * Created by zzt on 6/13/16.
 */

/**
 * update item number of page
 * @param goodsId
 * @param num
 */
function updateItemNum(goodsId, num) {

}

function getPriceById(id) {
    var food = document.getElementById(id);
    return food.firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.nextElementSibling.innerHTML;
}
