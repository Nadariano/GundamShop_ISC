<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <!--<div id="mainBody">-->
    <!--<div class="container">-->
    <div class="row">
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span></li>
                <li class="active">Đăng Nhập</li>
            </ul>
            <h3> Đăng Nhập</h3>	
            <hr class="soft"/>

            <div class="row">
                <div class="span6"> &nbsp;</div>
                <div class="span6">
                    <div class="well">
                        <form action="<c:url value="/user/login_handler.do"/>">
                            <div class="control-group">
                                <label class="control-label" for="email">Địa chỉ Email</label>
                                <div class="controls">
                                    <input class="span3"  type="email" id="email" name="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="accountPass">Mật khẩu</label>
                                <div class="controls">
                                    <input type="password" class="span3"  id="accountPass" name="accountPass" placeholder="Password">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">

                                    <button type="submit" name="op" value="login" class="btn">Đăng nhập</button> <a href="<c:url value="/user/forgetpass.do"/>">Quên mật khẩu?</a>
                                </div>
                            </div>
                            <h4 style="color: greenyellow">${message}</h4>
                            <h4 style="color: red">${error}</h4>
                        </form>
                    </div>
                </div>
            </div>	

        </div>
    </div>
</html>