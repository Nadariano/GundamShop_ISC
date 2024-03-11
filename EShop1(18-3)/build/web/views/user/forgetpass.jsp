<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <div class="row">
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span></li>
                <li class="active">Quên mật khẩu?</li>
            </ul>
            <h3> Quên mật khẩu</h3>	
            <hr class="soft"/>
            <div class="row">
                <div class="span9">
                    <div class="span1"> &nbsp;</div>
                    <div class="well">
                        <c:if test="${User1==null}">
                        <form action="<c:url value="/user/forgetpass_handler.do"/>" >
                            <div class="control-group">
                                <label class="control-label" for="inputEmail1">Email:</label>
                                   <div class="controls">
                                    <input class="span3"  type="email" name="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Số điện thoại:</label>
                                <div class="controls">
                                    <input type="text" class="span3" name="accountPhone" placeholder="Phone Number">
                                </div>
                            </div>
                            <div class="control-group">                               
                                <div class="controls">
                                    <button type="submit" name="op" value="forgetpass" class="btn">Xác Nhận</button> 
                                </div>
                            </div>
                            <div><i>${message1}</i></div>
                        </form>
                        </c:if>
                        <c:if test="${User1!=null}">
                              <form action="<c:url value="/user/forgetpass_handler.do"/>" >
                            <h5>Xin chào ${message2} ,nhập mật khẩu mới để tiếp tục </h5>
                              <div class="control-group">
                                <label class="control-label">Mật khẩu:</label>
                                <div class="controls">
                                    <input type="password" class="span3" name="accountPass" placeholder="Password">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Nhập lại mật khẩu:</label>
                                <div class="controls">
                                    <input type="password" class="span3" name="re_pass" placeholder="Re-enter Password">
                                </div>
                            </div>
                            <div class="control-group">                               
                                <div class="controls">
                                    <button type="submit" name="op" value="changepassword" class="btn">Xác Nhận</button> 
                                </div>
                            </div>
                            <div><i>${message1}</i></div>
                        </form>
                        </c:if>    
                    </div>

                </div>	
            </div>
        </div>
    </div>
</html>