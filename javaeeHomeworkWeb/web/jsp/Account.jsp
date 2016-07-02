<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%--
  Created by IntelliJ IDEA.
  User: zzt
  Date: 2/13/16
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page session="true" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>account</title>

    <link rel="stylesheet" href="../styles/account-content.css">
    <link rel="stylesheet" href="../styles/main-header.css">
    <link rel="stylesheet" href="../styles/new-account.css">

    <link href="../styles/toastr.css" rel="stylesheet"/>

    <link rel="stylesheet" href="../fonts/font-awesome-4.4.0/css/font-awesome.min.css"/>
    <!-- jTable Metro theme -->
    <link href="../scripts/jtable.2.4.0/themes/lightcolor/gray/jtable.css" rel="stylesheet" type="text/css"/>
    <link href="../scripts/jquery-ui-1.11.4/jquery-ui.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="../styles/bootstrap.min.css" rel="stylesheet"/>


</head>
<body onload="
addListChosenListener('side_nav_list', 'tabbed-block');
">


<header>
    <section id="main-header">

        <p id="app-name"><a href="<s:url action='Branches'/>">
            <img src="../images/logo2.jpg" id="logo">
        </a></p>

        <p class="action">
            <a href="<s:url action='Login_logOut'/>" class="fa fa-user"> 登出</a>
        </p>

        <p class="action">
            <a href="<s:url action='Branches'/> " class="fa fa-home"> 主页</a>
        </p>
        <br>
    </section>
</header>

<div id="main-container" class="flex-container-large">
    <nav id="side_nav" class="flex-none">
        <ul id="side_nav_list">
            <li>
                <a href="#">我的订单 </a>
            </li>
            <li>
                <a href="#">消费历史 </a>
            </li>
            <li>
                <a href="#">个人信息 </a>
            </li>
            <li>
                <a href="#">消息通知 </a>
            </li>
        </ul>
    </nav>

    <div id="tabbed-block" class="flex1">


        <div class="container" id="reserve">
            <h3>您的订单</h3>

            <div id="ReservationTableContainer"></div>

        </div>

        <div class="container">

            <div>
                <h3>会员卡信息</h3>
                <div class="card-info balance-summary">
                    <label>当前账户余额:</label>
                    <label> ${consume.balance}</label>元
                    <input type="submit" value="充值" onclick="activate(this)"/>
                </div>

                <c:if test="${cartBid == 0}">
                    <div>
                        <a href="CheckOut?branchNum=${cartBid}">去结算</a>
                    </div>
                </c:if>
            </div>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"
                                    data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                请扫下方二维码
                            </h4>
                        </div>
                        <div class="modal-body" style="text-align: center">
                            <img src="../images/二维码.png">
                        </div>

                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>


            <h3>您的消费账单</h3>

            <div id="payTable"></div>
        </div>

        <div class="container" id="personal">
            <h3>您的公开信息</h3>
            <section class="personal-info flex-container-large" id="public-info">
                <div class="avatar-wrapper none">
                    <img id="avatar" class="resize" src="../images/user.png" alt="a user">

                    <%--<div id="upload-file-container">
                        <form enctype="multipart/form-data" id="avatar-form">
                            <input type="file" name="photo" title="choose a picture"
                                   onchange="checkFileAndUpload(this)">
                        </form>
                    </div>--%>
                </div>
                <div id="change-picture-progress">&nbsp;</div>
                <div class="flex1 info-part">
                    <label for="DisplayName">称呼
                        <br>
                        <input id="DisplayName" value="${user.name}" maxlength="30" tabindex="1"
                               data-site="Tony" type="text">
                    </label>

                    <br>
                    <label>送货地址
                        <br>
                        <input id="Location" value="${account.addr}" maxlength="100"
                               tabindex="3" data-site="Nanjing, China" type="text">
                    </label>
                    <br>
                </div>


            </section>
            <br>

            <h3>您的私密信息</h3>
            <section class="personal-info" id="private-info">
                <div>
                    <label for="age">年龄
                        <br>
                        <input id="age" value="${account.age}" maxlength="30" tabindex="1"
                               data-site="Tony" type="text" pattern="\d+">
                    </label>

                    <br>

                    <s:radio id="gender" name="gender" list="gender" label="性别" value="userGender"/>
                    <br>
                </div>

            </section>
            <br>
            <input type="submit" value="提交修改" onclick="setUserAccountInfo(this)" style="margin-left: 15%">
        </div>


        <div class="container" id="message">
            <h3>您的消息</h3>

            <div class="horizontal-center">
                <div id="MessagesTable"></div>
            </div>
            <div class="horizontal-center">
                <input type="submit" value="删除选中消息" onclick="deleteMsg()"/>
            </div>
        </div>

    </div>
</div>
<%@include file="../html/footer.jsp" %>

</body>


<script type="application/javascript" src="../scripts/chosen.js"></script>

<script type="application/javascript" src="../scripts/jquery/dist/jquery.min.js"></script>
<script type="application/javascript" src="../scripts/updateAccount.js"></script>
<script src="../scripts/bootstrap/bootstrap.min.js"></script>

<script src="../scripts/toastr.js"></script>


<!-- jTable script file. -->
<script src="../scripts/jquery-ui-1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script src="../scripts/jtable.2.4.0/jquery.jtable.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var con = $('#ReservationTableContainer');
        con.jtable({
            title: '',
            paging: true,
            pageSize: 4,
            deleteConfirmation: function(data) {
//                toastr.success("删除成功");
                data.deleteConfirm = false;
            },
            actions: {
                listAction: 'UserReserveList',
                deleteAction: 'UserReserveDelete'
            },
            fields: {
                rid: {
                    title: '订单ID',
                    width: '10%',
                    key: true
                },
                bdate: {
                    title: '下单日期',
                    width: '20%',
                    edit: false
                },
                branch: {
                    title: '店铺名称',
                    width: '30%',
                    edit: false,
                    display: function (data) {
                        return data.record.branch.addr
                    }
                },
                details: {
                    title: '',
                    width: '2%',
                    edit: false,
                    create: false,
                    display: function (reservationData) {
                        //Create an image that will be used to open child table
                        var $img = $('<img src="../images/more.png" title="Show reservation detail" />');
                        //Open child table when user clicks the image
                        $img.click(function () {
                            $('#ReservationTableContainer').jtable('openChildTable',
                                    $img.closest('tr'),
                                    {
                                        title: '订单详情',
                                        actions: {
                                            listAction: 'OrderList?rid=' + reservationData.record.rid
                                        },
                                        fields: {
                                            rdid: {
                                                title: 'Dessert Id',
                                                width: '30%',
                                                key: true,
                                                list: false
                                            },
                                            dessert: {
                                                title: '甜点',
                                                width: '20%',
                                                display: function (data) {
                                                    return data.record.dessert.name;
                                                }
                                            },
                                            price: {
                                                title: '单价',
                                                width: '30%',
                                                edit: false
                                            },
                                            num: {
                                                title: '数量',
                                                width: '30%',
                                                edit: true
                                            }
                                        }
                                    },
                                    function (data) { //opened handler
                                        data.childTable.jtable('load');
                                    });
                        });
                        //Return image to show on the person row
                        return $img;
                    }
                }

            }
        });
        con.jtable('load');

        var pay = $('#payTable');
        pay.jtable({
            title: '',
            paging: true,
            pageSize: 4,
            deleteConfirmation: function(data) {
//                toastr.success("删除成功");
                data.deleteConfirm = false;
            },
            actions: {
                listAction: 'PayHistoryList',
                deleteAction: 'PayHistoryDelete'
            },
            fields: {
                rid: {
                    title: '订单ID',
                    width: '10%',
                    key: true,
                    list: true
                },
                branch: {
                    title: '店铺名称',
                    width: '30%',
                    edit: false,
                    options: 'BranchOptions',
                    display: function (reservationData) {
                        return reservationData.record.branch.addr;
                    }
                },
                bdate: {
                    title: '购买日期',
                    width: '20%',
                    edit: false
                },
                payment: {
                    title: '总金额'
                }
            }
        });
        pay.jtable('load');

        var msg = $('#MessagesTable');
        msg.jtable({
            title: '消息',
            paging: true,
            pageSize: 4,
            selecting: true, //Enable selecting
            multiselect: true, //Allow multiple selecting
            selectingCheckboxes: true, //Show checkboxes on first column
            deleteConfirmation: function(data) {
                data.deleteConfirm = false;
            },
            actions: {
                listAction: 'MsgList',
                deleteAction: 'MsgDelete'
            },
            fields: {
                mid: {
                    title: '消息ID',
                    width: '10%',
                    key: true,
                    list: true
                },
                msg: {
                    title: '详情',
                    width: '60%'
                }
            }
        });
        msg.jtable('load');

        function deleteMsg() {
            var $MessagesTable = $('#MessagesTable');
            var $selectedRows = $MessagesTable.jtable('selectedRows');
            $MessagesTable.jtable('deleteRows', $selectedRows);
        }

    });
</script>

</html>
