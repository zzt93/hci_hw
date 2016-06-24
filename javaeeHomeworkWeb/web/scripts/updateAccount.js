/**
 * Created by zzt on 2/28/16.
 *
 */
function activate(input) {

    var money = 10;
    $.post(
        'Activation_',
        {money: money},
        function (res, textStatus) {
            //console.log("status is: " + textStatus + " Response from server: " + res);
            if (textStatus === "success") {
                $('#myModal').modal();
                toastr.success("充值成功");
                $(input).prev().html(res['money'])
            } else {
                toastr.error("充值失败：网络不给力");
            }
        }
    );
}

function setUserAccountInfo(submit) {
    var $input = $('input[name="gender"]');
    var $gender = $('input[name="gender"]:checked');
    var account = {
        uname: $('#DisplayName').val(),
        location: $('#Location').val(),
        age: $('#age').val(),
        gender: $input.index($gender)
    };
    updateAccount(account, submit);
}


function updateAccount(data, submit) {
    // var original = $(submit).css('background-color');
    // $(submit).css('background-color', '#4c84d4');

    $.post(
        'UpdateAccount',
        data,
        function (res, textStatus) {
            //console.log("status is: " + textStatus + " Response from server: " + res);
            if (textStatus === "success") {
                toastr.success("更新成功");
                // $(submit).css('background-color', original);
            } else {
                toastr.error("更新失败：网络不给力");
            }
        }
    );
}