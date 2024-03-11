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
                <li class="active">Đăng ký</li>
            </ul>
            <h3>Đăng Ký</h3>	
            <div class="well">
                <h5>Bạn đã có tài khoản?<a href="<c:url value="/user/login.do"/>"> đăng nhập ngay </a></h5>
                <form action="<c:url value="/user/register_handler.do"/>" >
                    <div class="control-group">
                        <label class="control-label" for="email">Địa chỉ Email:</label>
                        <div class="controls">
                            <input class="span3"  type="email" name="email" placeholder="Email">
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
                            <input class="span3"  type="text" name="accountName" placeholder="Full Name">
                        </div>
                        <label class="control-label" for="accountPhone">Số Điện Thoại</label>
                        <div class="controls">
                            <input class="span3"  type="tel" name="accountPhone" placeholder="Phone Number">
                        </div>
                        <label class="control-label" for="accountAddress" >Địa Chỉ</label>
                        <div class="controls">
                            <input class="span3"  type="text" name="accountAddress" placeholder="Address">
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" name="op" value="register" class="btn">Đăng ký</button> 
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