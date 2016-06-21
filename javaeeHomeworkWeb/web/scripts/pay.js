/**
 * Created by Sky on 2016/6/19.
 */
function add(x){
    var button_parent= x.parentNode;   //div
    var number_input= button_parent.getElementsByClassName("number");
    var number=parseInt(number_input[0].value);
    var div_parent=button_parent.parentNode;
    var itemTotal=div_parent.getElementsByClassName("itemTotal");
    var span=itemTotal[0].getElementsByTagName("span");
    var total=parseFloat(span[0].innerHTML);
    var price=total/number;
    var total_span=document.getElementById("total");
    var sum_total=parseFloat(total_span.innerHTML);
    total=total+price;
    sum_total=sum_total+price;

    number=number+1;
    total=total.toFixed(2);
    sum_total=sum_total.toFixed(2);
    span[0].innerHTML=total;
    number_input[0].value=number;
    total_span.innerHTML=sum_total;
    if(sum_total>=30){
        var confim_button=document.getElementById("confirm_button");
        confim_button.innerHTML="确认下单";
        confim_button.disabled=false;
        confim_button.style.backgroundColor="#e62625";

    }
}

function sub(x){
    var button_parent= x.parentNode;   //div
    var number_input= button_parent.getElementsByClassName("number");
    var number=parseInt(number_input[0].value);
    var div_parent=button_parent.parentNode;
    var itemTotal=div_parent.getElementsByClassName("itemTotal");
    var span=itemTotal[0].getElementsByTagName("span");
    var total=parseFloat(span[0].innerHTML);
    var total_span=document.getElementById("total");
    var sum_total=parseFloat(total_span.innerHTML);
    var price=total/number;
    total=total-price;
    sum_total=sum_total-price;
    number=number-1;
    total=total.toFixed(2);
    sum_total=sum_total.toFixed(2);
    if(number==0){
        var ul=div_parent.parentNode;
        ul.removeChild(div_parent);
    }
    else{
        span[0].innerHTML=total;
        number_input[0].value=number;
    }
    if(sum_total<30){
        var confim_button=document.getElementById("confirm_button");
        var temp=30-sum_total;
        confim_button.innerHTML="还差 "+temp+" 元起送";
        confim_button.disabled=true;
        confim_button.style.backgroundColor="#bbb";

    }
    total_span.innerHTML=sum_total;


}

function changeNum(x,value){
    alert(value);
}

function choosePay(index){
    var pay_choice_list=document.getElementById("pay_choice_list");
    var lis=pay_choice_list.getElementsByTagName("li");
    lis[0].className="pay_item";
    lis[1].className="pay_item";
    lis[index].className="pay_item choosed";
}