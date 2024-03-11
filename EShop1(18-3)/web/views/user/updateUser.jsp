<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!--<div id="mainBody">-->
    <!--<div class="container">-->
    <div class="row">
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span></li>
                <li class="active">CẬP NHẬT THÔNG TIN</li>
            </ul>
            <h3>CẬP NHẬT THÔNG TIN</h3>	
            <div class="well">
                <form action="<c:url value="/user/updateUser_handler.do"/>" >
                    <div class="control-group">
                        <input type="hidden" name="accountId" value="${sessionScope.User.accountId}"/>
                        
                        <label class="control-label" for="email">Địa chỉ Email:</label>
                        <div class="controls">
                            <input disabled class="span3"  type="text" name="email" placeholder="Email" value="${sessionScope.User.email}" >
                            <input type="hidden" name="email" value="${sessionScope.User.email}">
                        </div>
                        <label class="control-label" for="accountPass" >Mật Khẩu:</label>
                        <div class="controls">
                            <input class="span3"  type="password" name="accountPass" placeholder="Password">
                        </div>
                        <label class="control-label" for="re_pass" >Nhập lại mật khẩu:</label>
                        <div class="controls">
                            <input class="span3"  type="password" name="re_pass" placeholder="Re-enter Password">
                        </div>
                        <label class="control-label" >Họ và Tên</label>
                        <div class="controls">
                            <input class="span3"  type="text" name="accountName" placeholder="Full Name"value="${sessionScope.User.accountName}">
                        </div>
                        <label class="control-label" for="accountPhone">Số Điện Thoại</label>
                        <div class="controls">
                            <input class="span3"  type="tel" name="accountPhone" placeholder="Phone Number" value="${sessionScope.User.accountPhone}">
                        </div>
                        <label class="control-label" for="accountAddress" >Địa Chỉ</label>
                        <div class="controls">
                            <input class="span3"  type="text" name="accountAddress" placeholder="Address" value="${sessionScope.User.accountAddress}">
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" name="op" value="update" class="btn">Cập nhật</button>
                                <button type="submit" name="op" value="cancel" class="btn">Hủy bỏ</button>
                            </div>
                        </div>
                    </div>
                    <i style="color: red">${error}</i>
                    <i style="color: greenyellow">${message}</i>
                </form>
            </div>

        </div>
    </div>
    <!--</div>-->
    <!--</div>-->

</html>
