<%-- 
    Document   : main
    Created on : Mar 1, 2023, 10:13:23 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <title>Gundam online Shopping cart</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap style --> 

        <link id="callCss" rel="stylesheet" href="<c:url value="/themes/superhero/bootstrap.min.css"/>" media="screen"/>
        <link href="<c:url value="/themes/css/base.css"/>" rel="stylesheet" media="screen"/>
        <!-- Bootstrap style responsive -->	
        <link href="<c:url value="/themes/css/bootstrap-responsive.min.css"/>" rel="stylesheet"/>
        <link href="<c:url value="/themes/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
        <!-- Google-code-prettify -->	
        <link href="<c:url value="/themes/js/google-code-prettify/prettify.css"/>" rel="stylesheet"/>
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="<c:url value="/themes/images/ico/favicon.ico"/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/themes/images/ico/apple-touch-icon-144-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/themes/images/ico/apple-touch-icon-114-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/themes/images/ico/apple-touch-icon-72-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value="/themes/images/ico/apple-touch-icon-57-precomposed.png"/>">
        <style type="text/css" id="enject"></style>







    </head>
    <body class="justify">
        <!--Header-->
        <div id="header">
            <c:if test="${User!=null}">
                <div id="welcomeLine" class="row">
                    <div class="span3">Chao xìn, <strong> ${User.getAccountName()}</strong>!</div>
                </div>
            </c:if>
            <!-- Navbar ================================================== -->
            <div id="logoArea" class="navbar">
                <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-inner">
                    <a class="brand" href="<c:url value="/home/index.do"/>"><img src="<c:url value="/themes/images/logo.png"/>" alt="Bootsshop"/></a>
                    <form class="form-inline navbar-search" action="<c:url value="/product/products.do"/>" >
                        <div class="navbar-search-items">
                            <input id="srchFld" class="" type="search" name="productName" />
                            <button type="submit" id="submitButton" class="btn btn-primary" name="op" value="search">Go</button>
                        </div>
                    </form>
                    <ul id="topMenu" class="nav pull-right">


                        <li class=""><a href="<c:url value="/product/products.do?op=productAll"/>">Sản phẩm</a></li>
                        <li class=""><a href="<c:url value="/home/contact.do" />">Liên hệ</a></li>
                        <li class="">
                            <c:if test="${User == null}">
                                <div class="col">
                                    <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Đăng nhập</span></a>
                                    <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h3>Đăng nhập</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal loginFrm"action="<c:url value="/user/login_handler.do"/>">
                                                <div class="control-group">								
                                                    <input type="email" id="email" name="email" placeholder="Email">
                                                </div>
                                                <div class="control-group">
                                                    <input type="password" id="accountPass" name="accountPass" placeholder="Password">
                                                </div>
                                                <button type="submit" name="op" value="login" class="btn  btn-success">Đăng nhập</button> <a href="<c:url value="/user/forgetpass.do"/>">Quên mật khẩu?</a>
                                            </form>		
                                            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
                                    </div>
                                    <a href="<c:url value="/user/register.do"/>"  role="button" style="padding-right:0"><span class="btn btn-large btn-success">Đăng ký</span></a>
                                </div>
                            </c:if>
                            <c:if test="${User!=null}">
                                <a href="<c:url value="/user/logout.do"/>" role="button" style="padding-right:0"><span class="btn btn-large btn-success">Đăng Xuất</span></a>
                            </c:if>  
                        </li>
                </div>       
                </ul>
            </div>
        </div>

        <!--Carousel-->
        <div id="carouselBlk">
            <div id="myCarousel" class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="container">
                            <img src="<c:url value="/themes/images/carousel/1.png"/>" alt=""/>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <img src="<c:url value="/themes/images/carousel/2.png"/>" alt=""/>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <img src="<c:url value="/themes/images/carousel/3.png"/>" alt=""/>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <img src="<c:url value="/themes/images/carousel/4.png"/>" alt=""/>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <img src="<c:url value="/themes/images/carousel/5.png"/>" alt=""/>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <img src="<c:url value="/themes/images/carousel/6.png"/>" alt=""/>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div> 
        </div>
    </div>
    <!-- Header End====================================================================== -->
    <!--view-->
    <div id="mainBody">
        <div class="container">
            <div class=" content " >

                <!--LEFT SLIDEBAR-->

                <div class="row ">
                    <div class="col">
                        <div id="sidebar" class="span3">
                            <div class="well well-small"><a id="myCart" href="<c:url value="/product/product_summary.do"/>"><img src="<c:url value="/themes/images/ico-cart.png"/>" alt="cart">(${sessionScope.cart.count}) sản phẩm<span class="badge badge-warning pull-right">$${sessionScope.cart.total}</span></a></div>

                            <ul id="sideManu " class="nav nav-tabs nav-stacked">
                                <li class="subMenu open"><a>Loại</a>
                                    <ul>
                                        <li><a  href="<c:url value="/product/products.do?op=productByType&type_id=SD"/>"><i class="icon-chevron-right"></i>Super Deformed(SD) </a></li>
                                        <li><a href="<c:url value="/product/products.do?op=productByType&type_id=HG"/>"><i class="icon-chevron-right"></i>High Grade (HG)</a></li>
                                        <li><a href="<c:url value="/product/products.do?op=productByType&type_id=RG"/>"><i class="icon-chevron-right"></i>Real Grade (RG)</a></li>
                                        <li><a href="<c:url value="/product/products.do?op=productByType&type_id=MG"/>"><i class="icon-chevron-right"></i>Master Grade (MG)</a></li>
                                    </ul>
                                </li>


                                <div class="thumbnail">
                                    <img src="<c:url value="/themes/images/payment_methods.png"/>" title="Payment Methods" alt="Payments Methods">
                                    <div class="caption">
                                        <h4>Phương pháp mua hàng hiện hỗ trợ: </h4>
                                    </div>
                                </div>

                            </ul>
                        </div>


                    </div>

                    <div class="col">
                        <div class="span9">
                            <jsp:include page="/views/${controller}/${action}.jsp" />
                        </div>
                    </div>
                </div> 
            </div>
        </div>



    </div>
    <!--footer-->
    <!-- Footer ================================================================== -->
    <div  id="footerSection">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <h5 href="<c:url value="/user/login.do"/>">Tài khoản</h5>
                    <c:if test="${sessionScope.User==null}">
                         <a href="<c:url value="/user/login.do"/>">Thông tin cá nhân</a> 
                    </c:if>
                     <c:if test="${sessionScope.User!=null}">
                         <a href="<c:url value="/user/info.do"/>">Thông tin cá nhân</a> 
                    </c:if>
                </div>
                <div class="span3">
                    <h5>Info</h5>
                    <a href="<c:url value="/home/contact.do"/>">Liên hệ</a>  
                    <c:if test="${User==null}">
                        <a href="<c:url value="/user/register.do"/>">Đăng ký</a>
                    </c:if>  
                    <a href="<c:url value="/home/legal_notice.do"/>">Chính sách mua hàng</a>  
                    <a href="<c:url value="/home/tac.do"/>">Điều khoản</a> 
                    <a href="<c:url value="/home/faq.do"/>">FAQ</a>
                </div>
                <div id="socialMedia" class="span3 pull-right">
                    <h5>SOCIAL MEDIA </h5>
                    <a href="https://www.facebook.com/gundam.info.en"><img width="60" height="60" src="<c:url value="/themes/images/facebook.png"/>" title="facebook" alt="facebook"/></a>
                  
                    <a href="https://www.youtube.com/channel/UCejtUitnpnf8Be-v5NuDSLw"><img width="60" height="60" src="<c:url value="/themes/images/youtube.png"/>" title="youtube" alt="youtube"/></a>
                </div> 
            </div>
            <p class="pull-right">&copy; GundamShop</p>
        </div><!-- Container End -->
    </div>

    <script src="<c:url value="/themes/js/jquery.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/themes/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/themes/js/google-code-prettify/prettify.js"/>"></script>

    <script src="<c:url value="/themes/js/bootshop.js"/>"></script>
    <script src="<c:url value="/themes/js/jquery.lightbox-0.5.js"/>"></script>
    <script src="<c:url value="/themes/js/quantitybutton.js"/>"type="text/css" media="screen" ></script>

 
    <script src="<c:url value="/themes/js/myjs.js"/>" type="text/javascript"></script>

</body>
</html>