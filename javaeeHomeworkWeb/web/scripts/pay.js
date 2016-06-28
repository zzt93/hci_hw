/**
 * Created by Sky on 2016/6/19.
 */

var PayUI=function(){
    return {
        updateNum:function(dessertID,newNum,total,sumTotal){
            var li_div=document.getElementById(dessertID);
            if(newNum==0){
                var ul=li_div.parentNode;
                ul.removeChild(li_div);
            }else{
                var total_span=li_div.getElementsByTagName("span")[0];
                var num_input=li_div.getElementsByTagName("input")[0];
                num_input.value=newNum;
                total=total.toFixed(2);
                total_span.innerHTML=total;
            }
            var sumtotal_span=document.getElementById("total");
            sumTotal=sumTotal.toFixed(2);
            sumtotal_span.innerHTML=sumTotal;
            change_button(sumTotal);
        },
    }
}();

function add(x){
    var button_parent= x.parentNode;   //div
    var number_input= button_parent.getElementsByClassName("number");
    var number=parseInt(number_input[0].value);
    var div_parent=button_parent.parentNode;
    var div_id=div_parent.id;
    number=number+1;
    PayServer.updateNum(div_id,number);

}

function sub(x){
    var button_parent= x.parentNode;   //div
    var number_input= button_parent.getElementsByClassName("number");
    var number=parseInt(number_input[0].value);
    var div_parent=button_parent.parentNode;
    var div_id=div_parent.id;
    number=number-1;
    PayServer.updateNum(div_id,number);



}

function changeNum(x){
    var input_parent= x.parentNode;
    var div_parent=input_parent.parentNode;
    var dessert_id=div_parent.id;
    var price;
    var num= x.value;
    if(!isNaN(num)){
        if(num<0){
            num=0
        }
    }else{
        num=1;
    }
    PayServer.updateNum(dessert_id,num);


}

function change_button(v){
    var sum_total=parseFloat(v);
    var confim_button=document.getElementById("confirm_button");
    if(sum_total<30){

        var temp=30-sum_total;
        confim_button.innerHTML="还差 "+temp+" 元起送";
        confim_button.disabled=true;
        confim_button.style.cursor="default";
        confim_button.style.backgroundColor="#bbb";
    }else {
        confim_button.innerHTML="确认下单";
        confim_button.disabled=false;
        confim_button.style.cursor="pointer";
        confim_button.style.backgroundColor="#e62625";
    }


}
var pay_choose=0;
function choosePay(index){
    var pay_choice_list=document.getElementById("pay_choice_list");
    var lis=pay_choice_list.getElementsByTagName("li");
    lis[0].className="pay_item";
    lis[1].className="pay_item";
    lis[index].className="pay_item choosed";
    pay_choose=index;
}

function pay(){
    PayServer.submitOrder();
}

function mobileCheck(x){
    var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
    var infoLable=document.getElementById("mobileCheck");
    var tel= x.value;
    var confim_button=document.getElementById("confirm_button");
    if (!reg.test(tel)) {
        infoLable.style.visibility="visible";
        confim_button.disabled=true;
        confim_button.style.cursor="default";
        confim_button.style.backgroundColor="#bbb";
    }else{
        infoLable.style.visibility="hidden";
        confim_button.disabled=false;
        confim_button.style.cursor="pointer";
        confim_button.style.backgroundColor="#e62625";
    }
}


function readGet() {
    var parts = window.location.search.substr(1).split("&");
    var $_GET = {};
    for (var i = 0; i < parts.length; i++) {
        var temp = parts[i].split("=");
        $_GET[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
    }
    return $_GET;
}

var PayServer = function () {
    return {
        updateNum: function (did, newNum) {
            $.ajax({
                    type: 'POST',
                    url: 'CartUpdateNumber',
                    data: {
                        did: did,
                        num: newNum,
                        branchNum: readGet()['branchNum']
                    },
                    success: function (response) {
                        console.log(response);
                        PayUI.updateNum(did, newNum, response['lineSum'], response['newTotal']);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                }
            );
        },
        submitOrder:function(){
            $.ajax({
                    type: 'POST',
                    url: 'BranchUserReserveNewPay',
                    data: {branchNum: readGet()['branchNum']},
                    success: function (response) {
                        toastr.success("下单成功");

                        //$('#myModal').modal();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //toastr.error("余额不足");
                        if(pay_choose==0) {
                            $('#myModal').modal();
                        }

                    }
                }
            );
        }
    }
}();