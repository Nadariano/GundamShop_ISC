<%-- 
    Document   : transaction_success
    Created on : Mar 19, 2023, 4:23:55 PM
    Author     : acer
--%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="com.vnpay.common.Config"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span>

        <div class="row">
            <div class="span9">
                <% if (signValue.equals(vnp_SecureHash)) { %>
                <% if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {%>
                <h1 style='color: greenyellow'><%= session.getAttribute("message")%></h1>
                <!-- Include your table here -->
                <h2>Thông tin đơn hàng: </h2>
                <table class="table table-bordered">
                    <tr> 
                        <td>
                            <form class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="inputPassword">Mã đơn hàng:</label>
                                    <div class="controls">
                                        <!--${sessionScope.orderId}-->
                                        <%=request.getParameter("vnp_TxnRef")%>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">Tên người mua: </label>
                                    <div class="controls">
                                        ${sessionScope.User.accountName}
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">SĐT: </label>
                                    <div class="controls">
                                        ${sessionScope.User.accountPhone}
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputAddress">Địa chỉ: </label>
                                    <div class="controls">
                                        ${sessionScope.User.accountAddress}
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">Ngày thanh toán: </label>
                                    <div class="controls">
                                        ${sessionScope.order.order_date}
                                        <%--<%= //request.getParameter("vnp_PayDate")%>--%>
                                    </div>
                                </div>
                                <hr/>
                                <h3>Các sản phẩm đã mua:</h3>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã sản phẩm</th>
                                            <th>Đơn giá</th>
                                            <th>Số lượng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="od" items="${sessionScope.odList}" varStatus="loop">
                                            <tr>
                                                <td>${loop.count}</td>
                                                <td>${od.product_id}</td>
                                                <td>${od.unitPrice}</td>
                                                <td>${od.quantity}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>    
                                <hr/>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">Tổng tiền (Sau khi đã trừ đi phần giảm giá) (K): </label>
                                    <div class="controls">
                                        <%=request.getParameter("vnp_Amount")%>
                                        <!--${sessionScope.order.totalMoney}-->
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">Phương thức thanh toán: </label>
                                    <div class="controls">
                                        ${sessionScope.order.paymentMethod}
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">Ghi chú: </label>
                                    <div class="controls">
                                        ${sessionScope.order.order_note}
                                    </div>
                                </div>
                            </form>
                        </td>
                    </tr>
                </table>
                <% } else { %>
                <h1 style='color: red'>Đơn hàng đã bị hủy</h1>
                <% } %>
                <% } else { %>
                <h1 style='color: red'>Có lỗi xảy ra, đơn hàng không thành công</h1>
                <% }%>
                <hr class="soft"/>

            </div>
        </div>
    </body>
</html>
