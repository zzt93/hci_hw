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
    scrollTop=document.body.scrollTop;
    var daohangTop = getTop(document.getElementById("daohang"));

    if ((document.documentElement.scrollTop >= daohangTop || document.body.scrollTop >= daohangTop)) {
        document.getElementById("daohang").setAttribute("class", "daohang sticky");
        document.getElementById("allfood").setAttribute("class", "allfood");
    }
    if(scrollTop<=200) {
        document.getElementById("daohang").setAttribute("class", "daohang");
        document.getElementById("allfood").setAttribute("class", "");
    }
    var childArr = document.getElementById("allfood").children;
    for(var i=0;i<childArr.length;i++){
        if(scrollTop>=getTop(document.getElementById(childArr[i].id))){
            changeClass(document.getElementById(childArr[i].id+"a"));
        }
    }
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
    document.getElementById(e).style.display="none";
    document.getElementById(e.substr(0, e.length-3)+"input").value=1;
    document.getElementById(e.substr(0, e.length-3)+"in").style.display="inline-block";
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

function keyPress() {
    var keyCode = event.keyCode;
    if ((keyCode >= 48 && keyCode <= 57))
    {
        event.returnValue = true;
    } else {
        event.returnValue = false;
    }
}
