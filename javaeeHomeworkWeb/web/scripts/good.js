/**
 * Created by ������ on 2016/6/19.
 */
function changeClass() {
    document.getElementsByClassName('active')[0].setAttribute("class", "");
    event.srcElement.setAttribute("class", "active");
}

function changeClass(e){
    document.getElementsByClassName('active')[0].setAttribute("class", "");
    e.setAttribute("class", "active");
}

window.onscroll = function () {
    //scrollTop=document.body.scrollTop;
    //var daohangTop = getTop(document.getElementById("daohang"));
    //var rexiaobangTop = getTop(document.getElementById("rexiaobang"));
    //var xinpinlijianTop = getTop(document.getElementById("xinpinlijian"));
    //var kafeiTop = getTop(document.getElementById("kafei"));
    //var guoshizhiyinliaoTop = getTop(document.getElementById("guoshuzhiyinliao"));
    //var chayinTop = getTop(document.getElementById("chayin"));
    //var tangTop = getTop(document.getElementById("tang"));
    //var xiaochiTop = getTop(document.getElementById("xiaochi"));
    //var yimianTop = getTop(document.getElementById("yimian"));
    //
    //if ((document.documentElement.scrollTop >= daohangTop || document.body.scrollTop >= daohangTop)) {
    //    document.getElementById("daohang").setAttribute("class", "daohang sticky");
    //    document.getElementById("allfood").setAttribute("class", "allfood");
    //}
    //else {
    //    document.getElementById("daohang").setAttribute("class", "daohang");
    //    document.getElementById("allfood").setAttribute("class", "");
    //}
    //if(scrollTop>=rexiaobangTop){
    //    changeClass(document.getElementById("rexiaobanga"));
    //}
    //if(scrollTop>=xinpinlijianTop){
    //    changeClass(document.getElementById("xinpinlijiana"));
    //}
    //if(scrollTop>=kafeiTop){
    //    changeClass(document.getElementById("kafeia"));
    //}
    //if(scrollTop>=guoshizhiyinliaoTop){
    //    changeClass(document.getElementById("guoshizhiyinliaoa"));
    //}
    //if(scrollTop>=chayinTop){
    //    changeClass(document.getElementById("chayina"));
    //}
    //if(scrollTop>=tangTop){
    //    changeClass(document.getElementById("tanga"));
    //}
    //if(scrollTop>=xiaochiTop){
    //    changeClass(document.getElementById("xiaochia"));
    //}
    //if(scrollTop>=yimianTop){
    //    changeClass(document.getElementById("yimiana"));
    //}
};

function scroll(id, top) {
    document.getElementById(id).scrollTop = top;
}

function getTop(e) {
    var offset = e.offsetTop;
    if (e.offsetParent != null) //ֻҪ���и�Ԫ��,Ҳ���ǵ�ǰԪ�ز��Ǹ��ڵ�ͼ��������ۼ�Ԫ�صĸ߶�
        offset += getTop(e.offsetParent);
    return offset;
}

function addGouWuChe(e){
    e.style.display="none";
    document.getElementById("inputnum").style.display="inline-block";
}

function clickminus(input,gouwuche){
    if(input.value<=1){
        document.getElementById("inputnum").style.display="none";
        gouwuche.style.display="inline-block";
    }else{
        input.value--;
        input.oldvalue=input.value;
    }
}

function clickplus(input){
    input.value++;
    input.oldvalue=input.value;
}

function changenum(input){
    if(isNaN(input.value)){
        input.setAttribute("value",input.oldValue);
    }else{

    }
}
