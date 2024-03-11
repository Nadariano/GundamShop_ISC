<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <body>
        <div class="row">
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span></li>
                    <li class="active">SHOPPING BILL</li>
                </ul>
                <h3> SHOPPING BILL</h3>	
                <hr class="soft"/>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Đơn giá (&dollar;)</th>
                            <th>Số lượng</th>
                            <th>Thành tiền (&dollar;)</th>
                            <!--<th>Operations</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${sessionScope.cart.item}" varStatus="loop">
                        <form action="<c:url value="/product/product_summary.do"/>">
                            <tr>
                                <td>${loop.count}</td>
                                <td>${item.product.product_id}</td>
                                <td>${item.product.productName}</td>
                                <td>${item.product.price}</td>
                                <td>${item.quantity}</td>
                                <td>${item.cost}</td>
                                <td>
                                    <input type="hidden" name="product_id" value="${item.product.product_id}" disabled/>
                                    <!--                                    <button type="submit" name="op" value="update">Update</button>
                                                                        <button type="submit" name="op" value="delete">Delete</button>-->
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    <tr>
                        <th colspan="5">Giảm giá</th>
                        <th>${discount.discountRate}&percnt;</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th colspan="5">Tổng thanh toán</th>
                        <th>${(sessionScope.cart.total) - (sessionScope.cart.total)* (discount.discountRate/100)}</th>
                        <th></th>
                    </tr>
<!--                    <a href="<c:url value="/product/product_summary.do?op=checkout"/>">THANH TOÁN</a>-->


                    <table class="table table-bordered">
                        <tr><th> Thông tin cá nhân </th></tr>
                        <tr> 
                            <td>
                                <form class="form-horizontal" action="<c:url value="/product/billing.do"/>">
                                    <div class="control-group">
                                        <label class="control-label" for="inputUsername">Tên người nhận hàng:</label>
                                        <div class="controls">
                                            ${sessionScope.User.accountName}
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPassword1">Số điện thoại:</label>
                                        <div class="controls">
                                            ${sessionScope.User.accountPhone}
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPassword1">Địa chỉ</label>
                                        <div class="controls">
                                            ${sessionScope.User.accountAddress}
                                        </div>
                                    </div>

                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPaymentMethod">Phương thức thanh toán:</label>
                                        <div class="controls">
                                            <select type="dropdown" id="paymentMethod" name="paymentMethod">
                                                <option> Thanh toán khi nhận hàng</option>
                                                <option> Thanh toán bằng Visa/Master card</option>
                                                <option> Thanh toán bằng hình thức chuyển khoản</option>
                                                <option> Cho vay nặng lãi</option>                                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputOrderNote">Ghi chú:</label>
                                        <div class="controls">

                                            <%--<input type="text" class="form-control" id="order_note" placeholder="Ghi chú" name="order_note" value="${order.order_note}">--%>
                                            <textarea  maxlength="300" style="resize: vertical;width: 500px" placeholder="Note(Tối đa 300 ký tự)"  id="order_note" name="order_note" value="${order.order_note}"></textarea>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary pull-right" name="op" value="checkout">THANH TOÁN <i class="icon-check"></i></button>
                                    <button type="submit" class="btn btn-large pull-left" name="op" value="cancel">HỦY ĐƠN HÀNG<i class="bi bi-x-square"></i></button>
                                </form>
                            </td>
                        </tr>
                    </table>
                    <h1 style="color: greenyellow">${mesage}</h1>
                    <a href="<c:url value="/product/products.do?op=productAll"/>" class="btn btn-large"><i class="icon-arrow-left"></i>Tiếp tục mua sắm </a>
            </div>
        </div>
</html>