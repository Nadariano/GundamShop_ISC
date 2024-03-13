<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--    <div id="mainBody">
            <div class="container">-->
    <div>
        <div id="adLink">
            <div id="modalBackdrop" class="modal-backdrop show">
                <div id="pop-up" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="pop-up" aria-hidden="false" data-backdrop="" data-keyboard="false" style="width: 60%; height: 60%; margin: auto; position: absolute; top: 0; left: 0; bottom: 0; right: 0;">
                    <button type="button" class="close closeModalOnly" data-dismiss="modal" aria-hidden="true" style="color: #149bdf">×</button>
                    <h3>Check this out</h3>
                    <div class="modal-body" style="width: auto; height: 100%;">
                        <a id="adLink">
                            <img id="adImage" alt="Advertisement" style="width:auto; height: 100%; object-fit: contain;"/>

                        </a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="span9">		
        <div class="well well-small">
            <h4>Đặc sắc<small class="pull-right">(Đắt nhất mỗi loại)</small></h4>
            <div class="row-fluid">
                <div id="featured1" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="item active">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listHighest1}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary">${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="item">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listHighest2}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary" >${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="item">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listHighest3}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary">${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="item">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listHighest4}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary" >${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                    <a class="left carousel-control" href="#featured1" data-slide="prev"> < </a>
                    <a class="right carousel-control" href="#featured1" data-slide="next"> > </a>
                </div>
            </div>
        </div>


        <div class="well well-small">
            <h4>Dành cho bạn mới<small class="pull-right">(Rẻ sập sàn)</small></h4>
            <div class="row-fluid">
                <div id="featured2" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="item active">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listLowest1}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary">${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="item">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listLowest2}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary">${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="item">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listLowest3}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary">${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="item">
                            <ul class="thumbnails">
                                <c:forEach var="product" items="${listLowest4}" varStatus="loop">
                                    <li class="span4">
                                        <div class="thumbnail" >
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"><img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/></a>
                                            <div class="caption" style="height: 150px; text-align: center;">
                                                <h4 >${product.product_id}</h4>
                                                <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                                <div>${product.brandName}</div>
                                            </div>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                                    <i class="icon-shopping-cart"></i>
                                                </a> <a class="btn btn-primary">${product.price}K</a></h4>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                    <a class="left carousel-control" href="#featured2" data-slide="prev"> < </a>
                    <a class="right carousel-control" href="#featured2" data-slide="next"> > </a>
                </div>
            </div>
        </div>
    </div>

</html>