<%-- 
    Document   : transaction_success
    Created on : Mar 19, 2023, 4:23:55 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span>
        <div class="row">
            <div class="span9">
                <h1 style="color: greenyellow">${message}</h1>
                <hr class="soft"/>
                <h2>Thông tin đơn hàng:</h2>
                <table class="table table-bordered">
                    <tr> 
                        <td>
                            <form class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="inputPassword">Mã đơn hàng:</label>
                                    <div class="controls">
                                        ${orderId}
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
                                        ${order.order_date}
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
                                        <c:forEach var="od" items="${odList}" varStatus="loop">
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
                                    <label class="control-label" for="inputUsername">Tổng tiền (Sau khi đã trừ đi phần giảm giá) (&dollar;): </label>
                                    <div class="controls">
                                        ${order.totalMoney}
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">Phương thức thanh toán: </label>
                                    <div class="controls">
                                        ${order.paymentMethod}
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputUsername">Ghi chú: </label>
                                    <div class="controls">
                                        ${order.order_note}
                                    </div>
                                </div>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
