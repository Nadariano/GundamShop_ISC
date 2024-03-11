<%-- 
    Document   : info
    Created on : Mar 18, 2023, 12:32:08 PM
    Author     : User
--%>

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
                <li class="active">THÔNG TIN CÁ NHÂN</li>
            </ul>
            <h3>THÔNG TIN CÁ NHÂN</h3>	
            <table class="table table-bordered">
                <tr> 
                    <td>
                        <form class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label" for="inputEmail">Email:</label>
                                <div class="controls">
                                    ${sessionScope.User.email}
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputUsername">Tên người nhận hàng:</label>
                                <div class="controls">
                                    ${sessionScope.User.accountName}
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputPassword">Số điện thoại:</label>
                                <div class="controls">
                                    ${sessionScope.User.accountPhone}
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputAddress">Địa chỉ:</label>
                                <div class="controls">
                                    ${sessionScope.User.accountAddress}
                                </div>
                            </div>
                            <a href="<c:url value="/user/updateUser.do"/>">Cập nhật thông tin</a>            
                        </form>
                    </td>
                </tr>
            </table>
            <i style="color: red">${error}</i>
            <i style="color: greenyellow">${message}</i>
        </div>
    </div>
    <!--</div>-->
    <!--</div>-->

</html>