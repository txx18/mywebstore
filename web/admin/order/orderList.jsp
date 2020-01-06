<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/jquery.js"></script>
    <title>无标题文档</title>


    <style type="text/css">
        body {
            margin-left: 3px;
            margin-top: 0px;
            margin-right: 3px;
            margin-bottom: 0px;
        }

        .STYLE1 {
            color: #e1e2e3;
            font-size: 12px;
        }

        .STYLE6 {
            color: #000000;
            font-size: 12px;
        }

        .STYLE10 {
            color: #000000;
            font-size: 12px;
        }

        .STYLE19 {
            color: #344b50;
            font-size: 12px;
        }

        .STYLE21 {
            font-size: 12px;
            color: #3b6375;
        }

        .STYLE22 {
            font-size: 12px;
            color: #295568;
        }
    </style>
</head>

<body>
<form action="${pageContext.request.contextPath }/orderServlet" method="post">
    <input type="hidden" name="op" value="deleteMulti"/>
    <table width="100%" border="0" align="center" cellpadding="0"
           cellspacing="0">
        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="24" bgcolor="#353c44">
                            <table width="100%"
                                   border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0"
                                               cellpadding="0">
                                            <tr>
                                                <td width="6%" height="19" valign="bottom">
                                                    <div
                                                            align="center">
                                                        <img src="images/tb.gif" width="14" height="14"/>
                                                    </div>
                                                </td>
                                                <td width="94%" valign="bottom"><span class="STYLE1">
														订单列表</span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <div align="right">
											<span class="STYLE1"> 
												<!-- <input type="button" value="添加"/> -->  
												<input type="submit" value="删除"/>
												&nbsp;&nbsp;
											</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0"
                       cellspacing="1" bgcolor="#a8c7ce">
                    <tr>
                        <td width="2%" height="20" bgcolor="d3eaef" class="STYLE10">
                            <div
                                    align="center">
                                <input type="checkbox" name="checkbox" id="checkbox11"/>
                            </div>
                        </td>
                        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">订单号</span>
                            </div>
                        </td>
                        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">订单金额</span>
                            </div>
                        </td>
                        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">收货人</span>
                            </div>
                        </td>
                        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">收货人电话</span>
                            </div>
                        </td>
                        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">收货地址</span>
                            </div>
                        </td>


                        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">订单状态</span>
                            </div>
                        </td>
                        <td width="18%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">下单时间</span>
                            </div>
                        </td>

                        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">下单用户名</span>
                            </div>
                        </td>
                        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
                            <div
                                    align="center">
                                <span class="STYLE10">基本操作</span>
                            </div>
                        </td>
                    </tr>
                    <c:forEach items="${requestScope.page.list }" var="order">
                        <tr>
                            <td height="2" bgcolor="#FFFFFF">
                                <div align="center">
                                    <input type="checkbox" name="oid" id="oid" value="${order.orderId }"/>
                                </div>
                            </td>
                            <td height="15" bgcolor="#FFFFFF" class="STYLE6">
                                <div align="center">
                                    <span class="STYLE19">${order.orderNum}</span>
                                </div>
                            </td>
                            <td height="5" bgcolor="#FFFFFF" class="STYLE19">
                                <div align="center">${order.totalPrice}</div>
                            </td>
                            <td height="8" bgcolor="#FFFFFF" class="STYLE19">
                                <div align="center">${order.receiverName}</div>
                            </td>
                            <td height="10" bgcolor="#FFFFFF" class="STYLE19">
                                <div align="center">${order.receiverMobile}</div>
                            </td>
                            <td height="20" bgcolor="#FFFFFF" class="STYLE19">
                                <div align="center">${order.receiverAddress}</div>
                            </td>
                            <td height="5" bgcolor="#FFFFFF" class="STYLE19">
                                    <%--                                <div align="center">${order.payStatus}</div>--%>
                                <div align="center">
                                    <c:if test="${order.payStatus == -1}">卖家取消了订单</c:if>
                                    <c:if test="${order.payStatus == 0}">买家已取消订单</c:if>
                                    <c:if test="${order.payStatus == 1}">买家已下单，等待买家付款</c:if>
                                    <c:if test="${order.payStatus == 2}">买家已付款，准备发货</c:if>
                                    <c:if test="${order.payStatus == 3}">卖家已发货</c:if>
                                    <c:if test="${order.payStatus == 4}">买家已确认收货</c:if>
                                    <c:if test="${order.payStatus == 5}">买家申请退款</c:if>
                                    <c:if test="${order.payStatus == 6}">退款成功</c:if>
                                </div>
                            </td>
                            <td height="18" bgcolor="#FFFFFF" class="STYLE19">
                                <div align="center">${order.orderTime}</div>
                            </td>
                            <td height="7" bgcolor="#FFFFFF" class="STYLE19">
                                <div align="center">${order.username}</div>
                            </td>
                            <td height="10" bgcolor="#FFFFFF">
                                <div align="center" class="STYLE21">
                                        <%--                                    <a href="${pageContext.request.contextPath }/orderServlet?op=delOrder&oid=${order.orderId}">删除</a>--%>
                                    <div>
                                        <a href="${pageContext.request.contextPath }/orderServlet?op=orderDetail&oid=${order.orderNum}">查看订单详情</a>
                                    </div>
                                    <c:choose>
                                        <c:when test="${order.payStatus == 1}">
                                            <div>
                                                <a href="javascript:if(confirm('确定买家已付款吗?')) location='${pageContext.request.contextPath }/orderServlet?op=confirmReceipt&oid=${order.orderId}'">确认已付款，准备发货</a>
                                            </div>
                                            <div>
                                                <a href="javascript:if(confirm('确实要拒绝订单吗?')) location='${pageContext.request.contextPath }/orderServlet?op=cancelOrderBySeller&oid=${order.orderId}'">拒绝订单</a>
                                                    <%--                                    <form id="_cancelOrderBySeller" method="post" action="${pageContext.request.contextPath}/orderServlet">
                                                                                            <input type="hidden" name="op" value="cancelOrderBySeller"/>
                                                                                            <input type="hidden" name="oid" value="${order.orderId}"/>
                                                                                            <a href="javascript:if(confirm('确定拒绝订单吗?')) document.getElementById('_cancelOrderBySeller').submit();">拒绝订单</a>
                                                                                        </form>--%>
                                            </div>
                                        </c:when>
                                        <c:when test="${order.payStatus == 2}">
                                            <div>
                                                <a href="javascript:if(confirm('确定已发货吗?')) location='${pageContext.request.contextPath }/orderServlet?op=sendGoods&oid=${order.orderId}'">已经发货</a>
                                            </div>
                                        </c:when>
                                        <c:when test="${order.payStatus == 5}">
                                            <a href="javascript:if(confirm('确定完成退款吗?')) location='${pageContext.request.contextPath}/orderServlet?op=completeRefund&oid=${order.orderId}'">确认完成退款</a>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </td>
        </tr>

        <tr>
            <td height="30">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="33%">
                            <div align="left">
								<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
                                    ${page.totalRecordsNum }</strong> 条记录，当前第<strong>${page.currentPageNum }</strong> 页，共 <strong>${page.totalPageNum }</strong> 页</span>
                            </div>
                        </td>
                        <td width="67%">
                            <table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="49">
                                        <div align="center">
											<span class="STYLE22">
											<a href="${pageContext.request.contextPath }/orderServlet?op=findPageOrders&num=1">首页</a>
											</span>
                                        </div>
                                    </td>
                                    <td width="49">
                                        <div align="center">
											<span class="STYLE22">
<c:if test="${page.currentPageNum != 1}">
    <a href="${pageContext.request.contextPath }/orderServlet?op=findPageOrders&num=${page.prevPageNum}">上一页</a>
</c:if>
											</span>
                                        </div>
                                    </td>
                                    <td width="49"><span class="STYLE22">
									    <div align="center">
											<span class="STYLE22">
<c:if test="${page.currentPageNum != page.totalPageNum}">
    <a href="${pageContext.request.contextPath }/orderServlet?op=findPageOrders&num=${page.nextPageNum}">下一页</a>
</c:if>
											</span>
										</div>
                                    </td>
                                    <td width="49">
                                        <div align="center">
                                            <span class="STYLE22"><a
                                                    href="${pageContext.request.contextPath }/orderServlet?op=findPageOrders&num=${page.totalPageNum }">尾页</a></span>
                                        </div>
                                    </td>
                                    <td width="37" class="STYLE22">
                                        <div align="center">转到</div>
                                    </td>
                                    <td width="22">
                                        <div align="center">
                                            <input type="text" name="num" id="num" value="${page.currentPageNum }"
                                                   style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
                                        </div>
                                    </td>
                                    <td width="22" class="STYLE22">
                                        <div align="center">页</div>
                                    </td>
                                    <td width="35">
                                        <div align="center">
                                            <span class="STYLE22"><a style="cursor:pointer;"
                                                                     onclick="jump()">跳转</a></span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $().ready(function () {
        $("#checkbox11").click(function () {
            if ($(this).attr("checked")) {
                $(":checkbox").attr("checked", true);
            } else {
                $(":checkbox").attr("checked", false);
            }
        })
    })

    function jump() {
        var num = document.getElementById("num").value;
        if (!/^[1-9][0-9]*$/.test(num)) {
            alert("请输入正确的页码");
            return;
        }
        if (num > ${page.totalPageNum}) {
            alert("页码超出范围");
            return;
        }
        window.location.href = "${pageContext.request.contextPath }/orderServlet?op=findPageOrders&num="
            + num;

    }
</script>
</body>
</html>
