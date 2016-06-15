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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>account</title>

    <link rel="stylesheet" href="../styles/account-content.css">
    <link rel="stylesheet" href="../styles/main-header.css">
    <link rel="stylesheet" href="../styles/sign-head.css">


    <link rel="stylesheet" href="../fonts/font-awesome-4.4.0/css/font-awesome.min.css"/>
    <!-- jTable Metro theme -->
    <link href="../scripts/jtable.2.4.0/themes/metro/blue/jtable.css" rel="stylesheet" type="text/css"/>
    <link href="../scripts/jquery-ui-1.11.4/jquery-ui.min.css" rel="stylesheet"
          type="text/css"/>


</head>
<body onload="
addListChosenListener('side_nav_list', 'tabbed-block');
">


<header>
    <section id="main-header">
        <img src="../images/yellow-pin.png" id="logo">

        <p id="app-name"><a href="<s:url action='Branches'/>">Dessert</a></p>

        <form>
            <p class="action">
                <a href="<s:url action='Login_logOut'/>" class="fa fa-user"> log out</a>
            </p>

            <p class="action">
                <a href="<s:url action='Branches'/> " class="fa fa-home"> dessert</a>
            </p>
        </form>
        <br>
    </section>
</header>

<div id="main-container" class="flex-container-large">
    <nav id="side_nav" class="flex-none">
        <ul id="side_nav_list">
            <li>
                <a href="#">个人信息 </a>
            </li>
            <li>
                <a href="#">已下单 </a>
            </li>
            <li>
                <a href="#">消费历史 </a>
            </li>
            <li>
                <a href="#">消息通知 </a>
            </li>
        </ul>
    </nav>

    <div id="tabbed-block" class="flex1">

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
                    <label for="DisplayName">显示称呼
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
            <input type="submit" value="Submit changes" onclick="setUserAccountInfo(this)">
        </div>

        <div class="container" id="reserve">
            <h3>您的订单</h3>

            <div id="ReservationTableContainer"></div>

        </div>

        <div class="container">

            <h3>会员卡信息</h3>
            <div class="flex1 info-part">
                <ul id="roles">
                    <li>${userRank}</li>
                </ul>
                <br>

                <fmt:formatNumber value="${sessionScope.uid}" var="formattedId"
                                  maxIntegerDigits="7" minIntegerDigits="7" groupingUsed="false"/>

                <fmt:formatNumber value="${account.bankCard}" var="formattedBackCard"
                                  groupingUsed="true"/>

                <label>会员卡卡号:
                    <input type="text" value="${formattedId}" readonly>
                </label>
                <br>
                <label>银行卡卡号:
                    <input type="text" value="${formattedBackCard}" readonly>
                </label>
                <br>
                <s:form action="Activation_" id="register">
                    <h2 class="inline-h2">Activate </h2>


                    <s:textfield name="money" label="money"
                                 required="required"/>
                    <s:textfield name="bankCard" label="bank card" pattern="\d{19}"
                                 title="bank card number must 19 number"
                                 required="required"/>

                    <s:submit value="activate by cash"/>
                    <s:submit value="activate by card"/>

                </s:form>

            </div>

            <h3>余额: ${consume.balance}</h3>
            <h3>您的消费账单</h3>

            <div id="payTable"></div>
        </div>

        <div class="container" id="message">
            <h3>Your Messages</h3>

            <div class="horizontal-center">
                <div id="MessagesTable"></div>
            </div>
            <div class="horizontal-center">
                <input type="submit" value="Delete selected messages" onclick="deleteMsg()"/>
            </div>
        </div>

    </div>
</div>

</body>

<%@include file="../html/footer.html" %>


<script type="application/javascript" src="../scripts/chosen.js"></script>
<script type="application/javascript" src="../scripts/Chart.js-2.0-dev/Chart.js"></script>
<script type="application/javascript" src="../scripts/useLineChart.js"></script>

<script type="application/javascript" src="../scripts/jquery/dist/jquery.min.js"></script>
<script type="application/javascript" src="../scripts/updateAccount.js"></script>

<!-- jTable script file. -->
<script src="../scripts/jquery-ui-1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script src="../scripts/jtable.2.4.0/jquery.jtable.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var con = $('#ReservationTableContainer');
        con.jtable({
            title: 'Reservations List',
            paging: true,
            pageSize: 4,
            actions: {
                listAction: 'UserReserveList',
                deleteAction: 'UserReserveDelete'
            },
            fields: {
                rid: {
                    title: 'Reservation Id',
                    width: '10%',
                    key: true
                },
                bdate: {
                    title: 'Date for buying',
                    width: '20%',
                    edit: false
                },
                branch: {
                    title: 'Department',
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
                                        title: 'reservation ' + reservationData.record.rid + ' - details',
                                        actions: {
                                            listAction: 'OrderList?rid=' + reservationData.record.rid,
                                            deleteAction: 'OrderDelete',
                                            updateAction: 'OrderUpdate'
                                        },
                                        fields: {
                                            rdid: {
                                                title: 'Dessert Id',
                                                width: '30%',
                                                key: true,
                                                list: false
                                            },
                                            dessert: {
                                                title: 'Dessert',
                                                width: '20%',
                                                display: function (data) {
                                                    return data.record.dessert.name;
                                                }
                                            },
                                            price: {
                                                title: 'Price',
                                                width: '30%',
                                                edit: false
                                            },
                                            num: {
                                                title: 'Number',
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
            title: 'Payment History',
            paging: true,
            pageSize: 4,
            actions: {
                listAction: 'PayHistoryList',
                deleteAction: 'PayHistoryDelete'
            },
            fields: {
                rid: {
                    title: 'Reservation Id',
                    width: '10%',
                    key: true,
                    list: true
                },
                branch: {
                    title: 'Branch',
                    width: '30%',
                    edit: false,
                    options: 'BranchOptions',
                    display: function (reservationData) {
                        return reservationData.record.branch.addr;
                    }
                },
                bdate: {
                    title: 'Buy date',
                    width: '20%',
                    edit: false
                },
                payment: {
                    title: 'Payment'
                }
            }
        });
        pay.jtable('load');

        var msg = $('#MessagesTable');
        msg.jtable({
            title: 'Message list',
            paging: true,
            pageSize: 4,
            selecting: true, //Enable selecting
            multiselect: true, //Allow multiple selecting
            selectingCheckboxes: true, //Show checkboxes on first column
            actions: {
                listAction: 'MsgList',
                deleteAction: 'MsgDelete'
            },
            fields: {
                mid: {
                    title: 'Message Id',
                    width: '30%',
                    key: true,
                    list: true
                },
                msg: {
                    title: 'Message content',
                    width: '30%'
                },
                user: {
                    title: 'User Id',
                    width: '30%',
                    display: function (line) {
                        return line.record.user.uid;
                    }
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
