<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>web store - Shopping Cart</title>
    <meta name="keywords"
          content="web store, shopping cart, free template, ecommerce, online shop, website templates, CSS, HTML"/>
    <meta name="description" content="web store, Shopping Cart, online store template "/>
    <link href="templatemo_style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css"/>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/ddsmoothmenu.js">


    </script>

    <script type="text/javascript">

        ddsmoothmenu.init({
            mainmenuid: "top_nav", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        })

    </script>

</head>

<body>
<%--加载分类--%>
<%--<c:if test="${empty categories }">
    <jsp:forward page="/mainServlet?op=findAllCategories&jsp=placeOrder"></jsp:forward>
</c:if>--%>
<c:if test="${empty sessionScope.cart}">
    <jsp:forward page="${pageContext.request.contextPath }/user/login.jsp"></jsp:forward>
</c:if>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title"><h1><a href="http://localhost/${pageContext.request.contextPath }">Online Shoes
                Store</a></h1></div>
            <div id="header_right">
                <p>
                    <c:if test="${!empty sessionScope.user }">
                        <a href="${pageContext.request.contextPath }/user/personal.jsp">我的个人中心</a> |
                        <a href="${pageContext.request.contextPath }/cartServlet?op=findCart&cartJsp=shoppingcart">购物车</a> |
                        <a href="${pageContext.request.contextPath }/orderServlet?op=findUserOrders">我的订单</a> |
                    </c:if>
                    <c:if test="${empty sessionScope.user }">
                    <a href="${pageContext.request.contextPath }/user/login.jsp">登录</a> |
                    <a href="${pageContext.request.contextPath }/user/regist.jsp">注册</a></p>
                </c:if>
                <c:if test="${!empty sessionScope.user }">
                    ${sessionScope.user.nickname }
                    <a href="${pageContext.request.contextPath }/userServlet?op=logout">退出</a></p>
                </c:if>
            </div>
            <div class="cleaner"></div>
        </div> <!-- END of templatemo_header -->

        <div id="templatemo_menubar">
            <div id="top_nav" class="ddsmoothmenu">
                <ul>
                    <li><a href="${pageContext.request.contextPath }/index.jsp" class="selected">主页</a></li>
                </ul>
                <br style="clear: left"/>
            </div> <!-- end of ddsmoothmenu -->
            <div id="templatemo_search">
                <form action="${pageContext.request.contextPath }/mainServlet" method="get">
                    <input type="hidden" name="op" value="findProductsByKeyword"/>
                    <input type="text" value="${keyword}" name="keyword" id="keyword" title="keyword"
                           onfocus="clearText(this)" onblur="clearText(this)" class="txt_field"/>
                    <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search"
                           class="sub_btn"/>
                </form>
            </div>
        </div> <!-- END of templatemo_menubar -->
        <div class="copyrights">Collect from <a href="#" title="Web商城">Web商城</a></div>

        <div id="templatemo_main">
            <div id="sidebar" class="float_l">
                <div class="sidebar_box"><span class="bottom"></span>
                    <h3>品牌</h3>
                    <div class="content">
                        <ul class="sidebar_list">
                            <c:forEach items="${categories}" var="category" varStatus="vs">
                                <c:if test="${vs.index !=0}">
                                    <c:if test="${vs.index != fn:length(categories)-1 }">
                                        <li>
                                            <a href="${pageContext.request.contextPath }/mainServlet?op=findProductsByCid&cid=${category.id}&cname=${category.cname}">${category.cname}</a>
                                        </li>
                                    </c:if>
                                </c:if>
                                <c:if test="${vs.index==0 }">
                                    <li class="first">
                                        <a href="${pageContext.request.contextPath }/mainServlet?op=findProductsByCid&cid=${category.id}&cname=${category.cname}">${category.cname}</a>
                                    </li>
                                </c:if>
                                <c:if test="${vs.index == fn:length(categories)-1 }">
                                    <li class="last">
                                        <a href="${pageContext.request.contextPath }/mainServlet?op=findProductsByCid&cid=${category.id}&cname=${category.cname}">${category.cname}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>


            <div id="content" class="float_r">
                <h3>确认订单</h3>
                <form action="${pageContext.request.contextPath }/orderServlet" method="post">
                    <%--跳转servlet和jsp--%>
                    <input type="hidden" name="op" value="placeOrder"/>
                    <input type="hidden" name="orderJsp" value="myOrders"/>
                    <%--提交user信息--%>
                    <input type="hidden" name="uid" value="${user.uid }">
                    <input type="hidden" name="username" value="${user.username }">
                    <div>
                        <table style="width: 700px;border-style:1px solid " border="1">
                            <%--提交收件人信息--%>
                            <tr>
                                <td>收件人:</td>
                                <td><input type="text" name="receiverName" value="${user.username }"
                                           required=" required"/>
                                </td>
                            </tr>
                            <tr>
                                <td>电话:</td>
                                <td><input type="text" name="receiverMobile" value="${user.mobilePhone }"
                                           required="required"></td>
                            </tr>
                            <tr>
                                <td>收件人地址:</td>
                                <td><input type="text" name="receiverAddress" value="${user.address }" size="80"
                                           required="required"/></td>
                            </tr>
                        </table>
                    </div>
                    <div style="padding-top: 30px;">
                        <table style="width: 700px;border-style:1px solid " border="1">
                            <tr>
                                <th><input type="checkbox" id="cb" checked></th>
                                <th>图片</th>
                                <th>描述</th>
                                <th>数量</th>
                                <th>单价</th>
                                <th>总价</th>
                            </tr>
                            <%--前端计算totalCount和sum--%>
                            <c:set var="totalCount" value="0"> </c:set>
                            <c:set var="sum" value="0"> </c:set>
                            <c:forEach items="${cart.cartItems}" var="item">
                                <%--提交购物信息--%>
                                <tr id="tr${item.cartItemId}">
                                    <td><input type="checkbox" class="ids" name="ids" value="${item.cartItemId}"
                                               checked></td>
                                    <td><img src="${item.product.imgUrl}" width="100" height="100"/></td>
                                    <td>${item.product.productName}</td>
                                    <td>${item.productCount}</td>
                                    <td>${item.product.webStorePrice}</td>
                                    <td id="price">${item.productCount*item.product.webStorePrice}</td>
                                </tr>
                                <c:set var="totalCount" value="${totalCount + item.productCount}"> </c:set>
                                <c:set var="sum" value="${sum+item.productCount*item.product.webStorePrice}"> </c:set>
                            </c:forEach>
                        </table>
                    </div>
                    <%--提交总金额，必须在计算之后提交--%>
                    <input type="hidden" id="qq" name="totalPrice" value="${sum}"/>
                    <table style="width: 700px;border-style:1px solid ">
                        <tr>
                            <td><h4>总件数:<span class="sumPrice"> ${totalCount}</span>件</h4></td>
                            <td><h4>总金额:<span class="sumPrice"> ${sum}</span>元</h4></td>
                        </tr>
                    </table>
                    <input type="submit" value="去下单" style="font-size: 18px;" align="right">
                </form>


                <%--   <div style="float:right; width: 215px; margin-top: 20px;">

                  <c:if test="${!empty shoppingCar.shoppingItems}"><p><a href="${pageContext.request.contextPath }/order/placeOrder.jsp">去下单</a></p></c:if>
                  <p><a href="${pageContext.request.contextPath}/index.jsp">继续购物</a></p>

                  </div> --%>
            </div>
            <div class="cleaner"></div>
        </div>

        <div id="templatemo_footer">
            Copyright (c) 2016 <a href="#">shoe商城</a> | <a href="#">版权所有</a>
        </div>

    </div>
</div>


</body>
<script type="text/javascript">
    $(function () {
        $(".ids").click(function () {
            var price = 0;
            $(".ids:checked").each(function (i, obj) {
                var id = $(obj).val();
                //console.log(id);
                //console.log($("#tr"+id).find("#price").text());
                price += parseInt($("#tr" + id).find("#price").text());
            })
            $(".sumPrice").text(price);
            $("#qq").val(price);
        })
        $("#cb").click(function () {
            var price = 0;
            if ($(this).attr("checked")) {

                $(":checkbox").attr("checked", true);
                $(".ids:checked").each(function (i, obj) {
                    var id = $(obj).val();
                    price += parseInt($("#tr" + id).find("#price").text());
                })
                $(".sumPrice").html(price);
                $("#qq").val(price);
                //alert("price");
                //console.log($("#money").val);
            } else {
                $(":checkbox").attr("checked", false);
                $(".sumPrice").html(0);
            }
        })
    })
</script>
</html>