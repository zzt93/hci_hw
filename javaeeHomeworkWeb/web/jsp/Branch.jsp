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
    <link rel="stylesheet" href="../styles/dessert.css">
    <link rel="stylesheet" href="../styles/lightBox.css">
    <link rel="stylesheet" href="../styles/cart.css">

    <!-- jTable Metro theme -->
    <link href="../scripts/jtable.2.4.0/themes/metro/blue/jtable.css" rel="stylesheet" type="text/css"/>
    <link href="../scripts/jquery-ui-1.11.4/jquery-ui.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="../styles/good.css" rel="stylesheet" type="text/css"/>
    <script src="../scripts/good.js"></script>

    <title>Branch ${branchNum}: ${branchAddr} </title>
    <s:head/>
</head>
<body>

<header>
    <section id="main-header">
        <img src="../images/yellow-pin.png" id="logo">

        <p id="app-name"><a href="<s:url action="Branches"/> ">Dessert</a></p>

        <form>
            <p class="action">
                <a href="<s:url action='Login_input'/>" class="fa fa-user"> log out</a>
            </p>

            <p class="action">
                <a href="<s:url action='Account'/> " class="fa fa-home"> ${sessionScope.userName}</a>
            </p>
        </form>
        <br>
    </section>
</header>

<div id="headline">
    <div class="branch-container ">

        <header>
            <h1>Dessert house</h1>

            <h3>Branch ${branchAddr}</h3>

        </header>
        <!-- Elements after a floating element will flow around it.
         To avoid this, use the clear property.
        The clear property specifies on which sides of an element
         floating elements are not allowed to float:-->
    </div>
</div>

<div id="example">
    <div class="branch-container flex-container">

        <nav class="flex1 right-split">
            <h5>Phone Number:</h5>

            <h3>025-83593186</h3>
            <h5>Address:</h5>

            <h3>NanJing, NJU</h3>

            <a class="dessert-div"
               href="http://cn.bing.com/ditu/?FORM=Z9LH4#JnE9LiUyNXU1MzU3JTI1dTRlYWMlMjV1NTkyNyUyNXU1YjY2JTI1dTlmMTMlMjV1Njk3YyU3ZXNzdC4wJTdlcGcuMSZiYj0zMi4wNTkwOTEwNTM4NTk2JTdlMTE4Ljc5MDQ1NzA3NDg4NiU3ZTMyLjA0OTg4ODc3ODA5NTMlN2UxMTguNzY4Njc3NTM3Njg1">
                <img class="map" src="../images/map.png">
            </a>

            <h3>Create order</h3>

            <div id="drop">
                <div class="vertical-center" style="height: 80%;">
                    drag dessert and drop here to make order
                </div>
            </div>


        </nav>

        <div style="float: right;width:23%;margin-right: 5%">
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
                    <img src="smile.png">
                </div>
                <div class="shopbulletin-foodsecurity-date" style="width:40%;float:right">
                    <h4>检查日期<p class="shopbulletin-foodsecurity-year">2016年</p>

                        <p class="shopbulletin-foodsecurity-day">01/27</p>
                    </h4>
                </div>
                <p class="shopbulletin-foodsecurity-agency ng-binding"></p>
            </div>
        </div>

        <div style="width:65%;margin-left: 5%;">

            <div id="daohang" class="daohang">
                <%--<a id="rexiaobanga" class="active" onclick="changeClass();" href="#rexiaobang">热销榜</a>--%>
                <c:forEach items="${plans}" var="plan">
                    <a id="${plans.pdate}a" onclick="changeClass();" href="#${plans.pdate}">${plans.pdate}</a>
                </c:forEach>


            </div>

            <div class="flex2">
                <h3>Orders</h3>

                <div id="previous-order"></div>

                <div id="date-box" title="Date reminding" class="none">
                    <p class="fa fa-warning">Can't choose desserts in different date in same order</p>
                </div>

                <h3>Desserts</h3>

                <div id="allfood">
                    <c:forEach items="${plans}" var="plan">
                        <div id="${plans.pdate}" class="bangdan">
                        <p class="kongbai"></p>

                        <h3 class="shopmenu-title">
                                ${plans.pdate}
                        </h3>

                        <div class="shopmenu-food">
                        <c:forEach items="${plan.details}" var="detail">
                            <div class="onefood" id="${detail.pdId}">
                                    <span class="col-1">
                                        <a>
                                            <img class="foodpic" src="../images/${detail.dessert.did}.jpg"
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
                                        <button class="shop-cartbutton" onclick="addGouWuChe(this)">加入购物车</button>
                                        <div id="inputnum" style="display: none">
                                            <button class="minus"
                                                    onclick="clickminus(this.nextElementSibling,this.parentNode.previousElementSibling)">
                                                -
                                            </button>
                                            <input class="input" onchange="changenum(this)" value="1" oldvalue="1">
                                            <button class="plus" onclick="clickplus(this.previousElementSibling)">+
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            </div>
                        </c:forEach>
                    </c:forEach>
                    <%--<c:forEach items="${plans}" var="plan">--%>
                    <%--<h4>${plan.pdate}</h4>--%>
                    <%--<c:forEach items="${plan.details}" var="detail">--%>
                    <%--<div class="dessert-div">--%>
                    <%--<img class="dessert" src="../images/${detail.dessert.did}.jpg"--%>
                    <%--title="${detail.dessert.name}:${detail.price}" >--%>
                    <%--</div>--%>
                    <%--</c:forEach>--%>
                    <%--</c:forEach>--%>

                </
                >

                <h3>New order</h3>

                <div id="current-order"></div>

                <div class="horizontal-center">
                    <s:submit value="Pay your order" onclick="payOrder()"/>
                </div>
                <div id="donePaying" class="none" title="Success">
                    <p>Paying succeed</p>
                </div>
                <div id="errorPaying" class="none" title="Error">
                    <p>Paying fail</p>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="cart">
    <div class="shop-cartbasket" style="top: -88px; height: auto;">
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
        <div class="shop-cartbasket-tablerow">
            <div class="cell itemname" title="芒果紫米露/热">芒果紫米露/热</div>
            <div class="cell itemquantity">
                <button onclick="updateCartItemNum(SUB, this)">-</button>
                <input value="1" onchange="updateFromInput(this)"
                       min="1" max="100">
                <button onclick="updateCartItemNum(ADD, this)">+</button>
            </div>
            <div class="cell itemtotal">¥9</div>
        </div>
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

<%@include file="../html/footer.html" %>


<script type="application/javascript" src="../scripts/jquery/dist/jquery.min.js"></script>
<!-- jTable script file. -->
<script src="../scripts/jquery-ui-1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script type="application/javascript" src="../scripts/drag.js"></script>
<script type="application/javascript" src="../scripts/cart.js"></script>
<script src="../scripts/jtable.2.4.0/jquery.jtable.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var order = $('#previous-order');
        order.jtable({
            title: 'Your orders in this branch',
            paging: true,
            pageSize: 4,
            actions: {
                listAction: 'BranchUserReserveList?branchNum=' + ${branchNum},
                deleteAction: 'BranchUserReserveDelete'
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
                    options: 'BranchOptions',
                    display: function (reservationData) {
                        return reservationData.record.branch.addr;
                    }
                },
                bdate: {
                    title: 'Buy date',
                    width: '20%',
                    edit: true
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
                            $('#previous-order').jtable('openChildTable',
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
                                                width: '30%'
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
        order.jtable('load');


        initDragDrop();


        var currentOrder = $('#current-order');
        currentOrder.jtable({
            title: 'Current order',
            actions: {
                listAction: 'ReserveDetailList',
                deleteAction: 'ReserveDetailDelete',
                updateAction: 'ReserveDetailUpdate'
            },
            fields: {
                tmpId: {
                    key: true,
                    list: false
                },
                dessertName: {
                    title: 'Dessert name',
                    width: '30%',
                    edit: false
                },
                price: {
                    title: 'Price',
                    width: '30%',
                    edit: false
                },
                num: {
                    title: 'Number',
                    width: '20%',
                    edit: true
                }
            }
        });
        currentOrder.jtable('load');
    });


    //    $(window).bind('beforeunload', function () {
    //        return 'If not paying your order, you may lose it later';
    //    });
</script>


</body>
</html>

