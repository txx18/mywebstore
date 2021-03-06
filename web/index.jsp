<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>web store, free template</title>
    <meta name="keywords" content="web store, free template, ecommerce, online shop, website templates, CSS, HTML"/>
    <meta name="description" content="web store is a free ecommerce template provided "/>
    <link href="templatemo_style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="nivo-slider.css" type="text/css" media="screen"/>

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
<%--加载分类
<c:if test="${empty categories }">
    <jsp:forward page="/mainServlet?op=findAllCategories&jsp=index"></jsp:forward>
</c:if>--%>
<%--加载轮播图--%>
<c:if test="${empty topProducts }">
    <jsp:forward page="/mainServlet?op=findTopProducts"></jsp:forward>
</c:if>
<%--加载热门商品--%>
<c:if test="${empty hotProducts }">
    <jsp:forward page="/mainServlet?op=findHotProducts"></jsp:forward>
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
                    <img id="oldImg" width="50px" height="50px"
                         src="${pageContext.request.contextPath}/${sessionScope.user.headicon}"/>
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
                            <c:forEach items="${applicationScope.categories}" var="category" varStatus="vs">
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
                <div id="slider-wrapper">
                    <div id="slider" class="nivoSlider">
                        <c:forEach items="${topProducts }" var="product">
                            <a href="${pageContext.request.contextPath }/mainServlet?op=findProductByPid&pid=${product.id}">
                                <img src="${product.imgUrl }" style="width: 680px;height: 300px" alt=""
                                     title="${product.productName }"/>
                            </a>
                        </c:forEach>
                    </div>
                    <div id="htmlcaption" class="nivo-html-caption">
                        <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
                    </div>
                </div>
                <script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
                <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
                <script type="text/javascript">
                    $(window).load(function () {
                        $('#slider').nivoSlider();
                    });
                </script>

                <%--显示热门商品并可以查看、加购物车--%>
                <h3>热门商品</h3>
                <c:forEach items="${hotProducts }" var="product" varStatus="vs">
                    <div class="${vs.index % 3 != 2?'product_box':'product_box no_margin_right' }">
                        <h3>${product.productName }</h3>
                        <a href="${pageContext.request.contextPath }/mainServlet?op=findProductByPid&pid=${product.id}">
                            <img src="${product.imgUrl }" width="200" height="150" alt=""
                                 title="${product.productName }"/>
                        </a>
                        <p style="width: 200px;overflow: hidden;white-space: nowrap; text-overflow: ellipsis;">${product.description }</p>
                        <p class="product_price">￥ ${product.webStorePrice }</p>
                        <c:if test="${empty user }">
                            <a href="javascript:login()" class="addtocart"></a>
                        </c:if>
                        <c:if test="${!empty user }">
                            <a href="javascript:addCart(${product.id }, ${user.uid})" class="addtocart"></a>
                        </c:if>
                        <a href="${pageContext.request.contextPath }/mainServlet?op=findProductByPid&pid=${product.id}"
                           class="detail"></a>
                    </div>
                    <c:if test="${vs.index % 3 == 2}">
                        <div class="cleaner"></div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="cleaner"></div>
        </div> <!-- END of templatemo_main -->

        <div id="templatemo_footer">
            Copyright (c) 2016 <a href="#">webstore</a> | <a href="#">Shane</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    function login() {
        alert("请先登录");
        window.location.href = "${pageContext.request.contextPath}/user/login.jsp";
    }
    // 在主页加购物车默认加一件
    function addCart(pid, uid) {
        window.location.href = "${pageContext.request.contextPath}/cartServlet?op=addToCart&pid=" + pid + "&uid=" + uid + "&productCount=1";
    }
</script>
</body>
</html>