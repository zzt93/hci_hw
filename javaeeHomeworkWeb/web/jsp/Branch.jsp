<%--
  Created by IntelliJ IDEA.
  User: zzt
  Date: 2/14/16
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="../styles/sign-head.css" type="text/css" rel="stylesheet">
    <link href="../styles/sign-content.css" type="text/css" rel="stylesheet">
    <link href="../styles/anchor.css" type="text/css" rel="stylesheet">

    <link rel="stylesheet" href="../fonts/font-awesome-4.4.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../styles/main-header.css">
    <link rel="stylesheet" href="../styles/branches.css">
    <link rel="stylesheet" href="../styles/util.css">
    <link rel="stylesheet" href="../styles/cart.css">

    <link href="../styles/good.css" rel="stylesheet" type="text/css"/>
    <script src="../scripts/good.js"></script>
    <script src="../scripts/cart.js"></script>

    <title>Branch ${branchNum}: ${branchAddr} </title>
    <s:head/>
</head>
<body>

<header>
    <section id="main-header">


        <p id="app-name"><a href="<s:url action="Branches"/> "><img src="../images/logo2.jpg" id="logo"></a></p>

        <form>
            <p class="action">
                <a href="<s:url action='Login_input'/>" class="fa fa-user" > <span style="font-family: 楷体">登出</span></a>
            </p>

            <p class="action">
                <a href="<s:url action='Account'/> " class="fa fa-home"> <span style="font-family: 楷体"> ${sessionScope.userName}</span></a>
            </p>
        </form>
        <br>
    </section>
</header>


<div class="shopguide">
    <div class="shopguide-info">
        <span>
            <a>
                <img class="storepic" srcsrc="../images/branch${branchNum}.jpeg" >
            </a>
        </span>

        <h1> ${branchAddr}</h1>
    </div>
    <div class="shopguide-server">
        <span>
            <em>起送价</em>
            <em class="shopguide-server-value">0元</em>
        </span>
        <span>
            <em>配送费</em>
            <em class="shopguide-server-value">6元</em>
        </span>
        <span>
            <em>平均送达速度</em>
            <em class="shopguide-server-value">30分钟</em>
        </span>
    </div>
</div>
<%--<div id="headline">--%>
    <%--<div class="branch-container ">--%>

        <%--&lt;%&ndash;<header>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<h1>Dessert house</h1>&ndash;%&gt;--%>

        <%--&lt;%&ndash;<h3>Branch ${branchAddr}</h3>&ndash;%&gt;--%>
        <%--<img src="../images/branch${branchNum}.jpeg">--%>
        <%--&lt;%&ndash;</header>&ndash;%&gt;--%>
        <%--<!-- Elements after a floating element will flow around it.--%>
         <%--To avoid this, use the clear property.--%>
        <%--The clear property specifies on which sides of an element--%>
         <%--floating elements are not allowed to float:-->--%>
    <%--</div>--%>
<%--</div>--%>
<div>
<div style="max-width: 1000px; margin: 0 auto">
    <div style="float: right;width:23%">
        <div class="shopbulletin-section">
            <h3 class="shopbulletin-section-title">商家公告</h3>

            <p class="shopbulletin-content"></p>
            <ul class="shopbulletin-supports">
                <li>
                    <span style="background-color: rgb(75, 154, 24);">保</span>
                    已加入“外卖保”计划，食品安全有保障
                </li>
                <li>
                    <span style="background-color: rgb(144, 113, 203);">票</span>
                    该商家支持开发票，请在下单时填写好发票抬头
                </li>
            </ul>
            <p class="shopbulletin-foodsecurity-agency"></p>
        </div>
        <div class="shopbulletin-section">
            <h3 class="shopbulletin-section-title">食品安全等级公示</h3>

            <p class="shopbulletin-content"></p>

            <div class="shopbulletin-foodsecurity-result" style="width:55%;">
                <h4>
                    监督检查结果:
                    <span>良好</span>
                </h4>
                <img src="../images/smile.png">
            </div>
            <div class="shopbulletin-foodsecurity-date" style="width:40%;float:right">
                <h4>检查日期<p class="shopbulletin-foodsecurity-year">2016年</p>

                    <p class="shopbulletin-foodsecurity-day">01/27</p>
                </h4>
            </div>
            <p class="shopbulletin-foodsecurity-agency ng-binding"></p>
        </div>
    </div>

    <div style="width:65%;">

        <div id="daohang" class="daohang">
            <%--<a id="rexiaobanga" class="active" onclick="changeClass();" href="#rexiaobang">热销榜</a>--%>
            <c:forEach items="${plans}" var="plan"  varStatus="status">
                <c:choose>
                    <c:when test="${status.first}">
                        <a class="active" id="${plan.pdate}a" onclick="changeClass();" href="#${plan.pdate}">${plan.pdate}</a>
                    </c:when>
                    <c:otherwise>
                        <a id="${plan.pdate}a" onclick="changeClass();" href="#${plan.pdate}">${plan.pdate}</a>
                    </c:otherwise>
                </c:choose>
                <%--<c:if test="{status.first}">--%>
                    <%--<a class="active" id="${plan.pdate}a" onclick="changeClass();" href="#${plan.pdate}">${plan.pdate}</a>--%>
                <%--</c:if>--%>
                <%--<a id="${plan.pdate}a" onclick="changeClass();" href="#${plan.pdate}">${plan.pdate}</a>--%>
            </c:forEach>

        </div>

        <div class="flex2">

            <div id="allfood">
                <c:forEach items="${plans}" var="plan">
                    <div id="${plan.pdate}" class="bangdan">
                        <p class="kongbai"></p>

                        <h3 class="shopmenu-title">
                                ${plan.pdate}
                        </h3>

                        <div class="shopmenu-food">
                            <c:forEach items="${plan.details}" var="detail">
                                <div class="onefood">
                                    <span class="col-1">
                                        <a>
                                            <img class="foodpic" src="../images/${detail.dessert.did}.jpeg"
                                                 alt="${detail.dessert.name}的图片">
                                        </a>
                                    </span>

                                    <div class="col-2">
                                        <h3 class="shopmenu-food-name">${detail.dessert.name}</h3>

                                        <div class="color-mute">月售33份</div>
                                        <div class="shopmenu-food-price">
                                            <span>￥</span>
                                            <span class="money">${detail.price}</span>
                                        </div>
                                        <div id="gouwuche" class="gouwudiv">
                                            <button id="${detail.pdId}add" name="${detail.dessert.name}!${detail.price}"  class="shop-cartbutton" onclick="addGouWuChe(this.id);addCartItem(this.id.substr(0,this.id.length-3),this.name.split('!')[0],this.name.split('!')[1])")>加入购物车</button>
                                            <div id="${detail.pdId}in" style="display: none">
                                                <button id="${detail.pdId}minus" class="minus"
                                                        onclick="updateCartInMainPage(-1, this.id.substr(0,this.id.length-5),this.nextElementSibling.value);">
                                                    -
                                                </button>
                                                <input id="${detail.pdId}input" class="input" onkeypress="keyPress()" onchange="Server.updateNum(this.id.substr(0,this.id.length-5),this.value);"
                                                       value="1" oldvalue="1">
                                                <button id="${detail.pdId}plus" class="plus" onclick="updateCartInMainPage(1, this.id.substr(0,this.id.length-4),this.previousElementSibling.value);">+
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>

<div class="cart">
    <div class="shop-cartbasket" style="top: -43px; height: auto;">
        <div id="shopCart" class="">
            <!-- ngIf: shopCart.vm.groups.length > 1 -->
            <div class="shop-grouphead single">
                <!-- ngIf: showGuide && shopCart.vm.groups.length === 1 -->
                <div class="shop-grouphead-row">
                    <!-- ngIf: shopCart.vm.groups.length > 1 -->购物车
                    <a href="javascript:" onclick="Server.clearCart()">[清空]</a>
                </div>
            </div>
        </div>
        <%--<div class="shop-cartbasket-tablerow">--%>
            <%--<div class="cell itemname" title="芒果紫米露/热">芒果紫米露/热</div>--%>
            <%--<div class="cell itemquantity">--%>
                <%--<button onclick="updateCartItemNum(SUB, this)">-</button>--%>
                <%--<input value="1" onchange="updateFromInput(this)"--%>
                       <%--min="1" max="100">--%>
                <%--<button onclick="updateCartItemNum(ADD, this)">+</button>--%>
            <%--</div>--%>
            <%--<div class="cell itemtotal">¥9</div>--%>
        <%--</div>--%>
        <c:forEach items="${cart.items}" var="entry">
            <c:set var="item" value="${entry.value}" scope="page"/>
            <div class="shop-cartbasket-tablerow" id="${item.did}">
                <div class="cell itemname" title="${item.name}">${item.name}</div>
                <div class="cell itemquantity">
                    <button onclick="updateCartItemNum(SUB, this)">-</button>
                    <input value="${item.num}" onchange="updateFromInput(this)"
                           min="1" max="100">
                    <button onclick="updateCartItemNum(ADD, this)">+</button>
                </div>
                <div class="cell itemtotal">¥${item.price * item.num}</div>
            </div>
        </c:forEach>
    </div>

    <div class="shop-cartfooter" onclick="">
        <span class="fa fa-2x fa-shopping-cart shop-carticon">
            <span class="shop-cartpieces" style="display: ${cart.quantity > 0 ? 'inline-block' : 'none'}">
                ${cart.quantity}</span>
        </span>

        <p class="shop-cartfooter-text price">
            ${cart.total}</p>
        <button class="shop-cartfooter-checkout disabled" onclick="checkout()"
                disabled="disabled">还差 ${30 - cart.total} 元起送
        </button>
    </div>
</div>

<%@include file="../html/footer.jsp" %>


<script type="application/javascript" src="../scripts/jquery/dist/jquery.min.js"></script>
<script type="application/javascript" src="../scripts/branch.js"></script>
<script type="application/javascript" src="../scripts/cart.js"></script>
<script>
    $(document).ready(function () {
        addCartItem(1, "芒果西米露", 10);
    });
</script>

</body>
</html>

