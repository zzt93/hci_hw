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
    input.value = num;
    if(num==0){
        document.getElementById(goodsId+"in").style.display="none";
        document.getElementById(goodsId+"add").style.display="inline-block";
    }
}

function getPriceById(id) {
    return document.getElementById(id+"input");
}
