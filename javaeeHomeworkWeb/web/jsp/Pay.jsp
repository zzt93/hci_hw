<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Pay</title>
    <link href="../styles/pay.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../styles/main-header.css">
    <link rel="stylesheet" href="../fonts/font-awesome-4.4.0/css/font-awesome.min.css"/>
    <link href="../styles/toastr.css" rel="stylesheet"/>
    <script src="../scripts/jquery/dist/jquery.min.js"></script>
    <script src="../scripts/toastr.js"></script>
    <script src="../scripts/cart.js"></script>
    <script src="../scripts/pay.js"></script>

</head>

<body>

<header>
    <section id="main-header">


        <p id="app-name"><a href="<s:url action='Branches'/>"><img src="../images/logo2.jpg" id="logo"></a></p>
        <form>
            <p class="action">
                <a href="<s:url action='Login_logOut'/>" class="fa fa-user"><span style="font-family: 楷体">登出</span></a>
            </p>

            <p class="action">
                <a href="<s:url action='Branches'/> " class="fa fa-home"> 主页</a>
            </p>
        </form>
        <br>
    </section>
</header>

<div class="main">
    <div class="reservation">
        <div class="reservation_title">
            <h2>订单详情</h2>
            <a href="javascript:void(0);" onclick="function jumpBack() {
                window.location = 'Branch.action?branchNum=' + readGet()['branchNum'];
                return false;
            }
            jumpBack()"> 返回商家修改</a>
        </div>
        <div class="reservation_table_head">
            <div class="itemName">商品</div>
            <div class="itemNumber">份数</div>
            <div class="itemTotal">小计(元)</div>
        </div>
        <c:forEach items="${cart.items}" var="entry">
            <c:set var="item" value="${entry.value}" scope="page"/>
            <div class="reservation_table_row" id="${item.did}">
                <div class="itemName">${item.name}</div>
                <div class="itemNumber">
                    <button class="numberAciton" onClick="sub(this)">-</button>
                    <input type="text" class="number" value="${item.num}" onChange="changeNum(this)">
                    <button class="numberAciton" onClick="add(this)">+</button>
                </div>
                <div class="itemTotal">￥<span>${item.price * item.num}</span></div>
            </div>
        </c:forEach>

        <div class="reservation_total">
            ￥
            <span class="total" id="total">${cart.total}</span>
        </div>

    </div>
    <div class="content">
        <div class="address">
            <h2>收货地址

            </h2>
            <ul class="address_list">
                <li class="address_item">
                    <div class="address_info">
                        <label>姓名</label>
                        <input type="text" placeholder="请输入你的姓名" value="${user.name}">
                        <br>
                        <br>
                        <label>联系方式</label>
                        <input type="text" placeholder="请输入你的手机号">
                        <br>
                        <br>
                        <label>位置</label>


                        <input type="text" placeholder="请输入小区、大厦或学校" class="location" value="${user.account.addr}">
                        <br>
                        <br>
                        <label>详细地址</label>
                        <input type="text" placeholder="单元、门牌号">
                    </div>
                </li>
            </ul>
        </div>
        <div class="pay_selection">
            <h2>付款方式
                <span>推荐使用在线支付，立减5元</span>
            </h2>
            <ul class="choice_list" id="pay_choice_list">
                <li class="pay_item choosed" onClick="choosePay(0)">
                    <p class="choice_content">在线支付</p>

                    <p class="annotation">仅支持银行卡付款</p>
                </li>
                <li class="pay_item" onClick="choosePay(1)">
                    <p class="choice_content">货到付款</p>

                    <p class="annotation">送货上门后再付款</p>
                </li>
            </ul>

        </div>
        <div class="confirm">
            <button id="confirm_button" onclick="pay()">确认下单</button>
        </div>
    </div>


</div>


<div style="clear: both;"></div>
<%@include file="../html/footer.jsp" %>
</body>
</html>
