<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" %>
<%--
  Created by IntelliJ IDEA.
  User: Rellaloop
  Date: 2016-06-21
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<head>
    <link rel="stylesheet" href="../styles/account-content.css">
    <link rel="stylesheet" href="../styles/main-header.css">
    <link href="../styles/branches.css" type="text/css" rel="stylesheet">


    <link rel="stylesheet" href="../fonts/font-awesome-4.4.0/css/font-awesome.min.css"/>
    <link href="../styles/branches-show.css" type="text/css" rel="stylesheet">
    <title>Title</title>
</head>
<body>

<header>
    <section id="main-header">
        <img src="../images/logo2.jpg" id="logo">

        <p class="action">
            <a href="<s:url action='Login_input'/>" class="fa fa-user"> log out</a>
        </p>

        <p class="action">
            <a href="<s:url action='Account'/> " class="fa fa-home"> ${sessionScope.userName}</a>
        </p>
        <br>
    </section>
</header>

<div class="place-rstbox clearfix">
    <div class="clearfix">

        <c:forEach items="${branches}" var="branch">
            <div class="rstblock-logo">
                <div style="display: inline-block">
                    <img src="../images/branch${branch.bid}.jpeg"
                         width="70" height="70" class="rstblock-logo-icon">
                </div>

                <div class="rstblock-content" style="display: inline-block">
                    <div class="rstblock-title">
                        <s:url action="Branch" var="branchLink">
                            <s:param name="branchNum">${branch.bid}</s:param>
                        </s:url>
                        <a href="${branchLink}">${branch.addr}</a></div>
                    <div class="starrating icon-star">
                            <span class="icon-star" style="width: 96%">
                            </span>
                            <%--<span class="rstblock-monthsales">--%>
                            <%--月售单<label>${}</label>单--%>
                            <%--</span>--%>

                        <div class="rstblock-cost">
                            30元起送/免配送费
                        </div>
                        <div class="rstblock-activity">
                            <i style="background: #f07373">减</i>
                            <i style="background: #fff;color: #ff4e00;border: 1px solid;padding: 0;">付</i>
                        </div>
                    </div>
                </div>

            </div>
        </c:forEach>


    </div>

</div>
<%@include file="../html/footer.jsp" %>

</body>
</html>
