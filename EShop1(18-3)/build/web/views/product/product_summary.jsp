<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <body>
        <div class="row">
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span></li>
                    <li class="active"> SHOPPING CART</li>
                </ul>
                <h3>  SHOPPING CART [ <small>${sessionScope.cart.count} Items</small>]<a href="<c:url value="/product/products.do?op=productAll"/>" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Tiếp tục mua sắm </a></h3>	
                <hr class="soft"/>

                <c:if test="${sessionScope.User==null}">
                    <table class="table table-bordered">
                        <tr><th> Đăng nhập  </th></tr>
                        <tr> 
                            <td>
                                <form class="form-horizontal" action="<c:url value="/user/login_handler.do"/>"method="post">
                                    <div class="control-group">
                                        <label class="control-label" for="inputEmail1">Username</label>
                                        <div class="controls">
                                            <input type="email" name="email" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputPassword1">Password</label>
                                        <div class="controls">
                                            <input type="password" name="accountPass" placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button type="submit" class="btn" name="op" value="login">Đăng nhập</button> hoặc <a href="<c:url value="/user/register.do"/>" class="btn">Đăng ký ngay!</a>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </table>
                </c:if>

                <a class="btn btn-primary" href="<c:url value="/product/product_summary.do?op=empty" />">Làm trống giỏ hàng <i class="icon-remove"></i></a>

                <table class="table table-bordered">
                    <thead>
                        <tr style="color: gold;">
                            <th>STT</th>
                            <th>Sản phẩm</th>
                            <th>Mã sản phẩm</th>
                            <th >Tên sản phẩm</th>
                            <th width="150px">Số lượng</th>
                            <th>Đơn giá  (&dollar;)</th>
                            <th>Thành tiền  (&dollar;)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${sessionScope.cart.item}" varStatus="loop">
                        <form action="<c:url value="/product/product_summary.do"/>">
                            <tr>
                                <td>${loop.count}</td>
                                <td> <img width="150px" src="<c:url value="/GundamImages/${item.product.product_id}.jpg"/>" alt="error"/></td>
                                <td>${item.product.product_id}</td>
                                <td>${item.product.productName}</td>
                                <td>
                                    <div class="input-append">
                                        <!--Button mặc định để khi enter thì update-->
                                        <span class="row" hidden>
                                            <button class="btn btn-primary" type="submit" name="op" value="update">Cập nhật số lượng</button>
                                        </span>
                                        <span class="row">
                                            <input type="hidden" name="product_id" value="${item.product.product_id}"/>
                                            <button class="btn" type="submit" name="op" value="decrease"><i class="icon-minus icon-white"></i></button>
                                            <input name="quantity" class="span1" style="max-width:50px;" placeholder="1" id="appendedInputButtons" size="16" type="number" value="${item.quantity}" max="9"/>
                                            <button class="btn"  type="submit" name="op" value="increase"><i class="icon-plus icon-white"></i></button>
                                            <button class="btn btn-danger" type="submit" name="op" value="delete"><i class="icon-remove icon-white"></i></button>				
                                        </span>
                                    </div>
                                </td>
                                <td>${item.product.price}</td>
                                <td>${item.cost}</td>
                            </tr>
                        </form>
                    </c:forEach>
                    <tr>
                        <th colspan="6" style="color:orangered">Tổng tiền</th>
                        <th style="color: greenyellow">${sessionScope.cart.total}</th>
                        <th></th>
                    </tr>

                    <tr  ${discount.discountRate == null?'hidden':''}>
                        <th colspan="6" style="color:orangered">Giảm giá ${discount.discountRate}&percnt;</th>
                        <th style="color: orange">-${sessionScope.cart.total * discount.discountRate/100}</th>
                        <th></th>
                    </tr>

                    <tr>
                        <th colspan="6" style="color:orangered">Tổng thanh toán</th>
                        <th style="color: greenyellow">${(sessionScope.cart.total - (sessionScope.cart.total *discount.discountRate/100))}</th>
                        <th></th>
                    </tr>

                    </tbody>
                </table>


                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td> 
                                <form action="<c:url value="/product/product_summary.do"/>" class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label"><strong> VOUCHERS CODE: </strong> </label>
                                        <div class="controls">
                                            <input type="text" name="discountId" class="input-medium" placeholder="CODE">
                                            <button type="submit"  class="btn" name="op" value="discount"> ADD </button>

                                            <th style="color: red">  <i>${messaged}</i></th>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>

                    </tbody>
                </table>


                <a href="<c:url value="/product/products.do?op=productAll"/>" class="btn btn-large"><i class="icon-arrow-left"></i>Tiếp tục mua sắm </a>
                <c:if test="${sessionScope.cart.count>0}">
                    <a href="<c:url value="/product/billing.do?op=print"/>" class="btn btn-large pull-right">Next<i class="icon-arrow-right"></i></a>
                    </c:if>
            </div>
        </div>
</html>