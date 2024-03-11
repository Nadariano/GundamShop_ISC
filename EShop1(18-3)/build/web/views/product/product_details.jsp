<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <div class="row">
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span></li>
                <li><a href="<c:url value="/product/products.do?op=productByType&type_id=${product.type_id}"/>">Sản phẩm</a> <span class="divider">/</span></li>
                <li class="active">Thông tin sản phẩm</li>
            </ul>	
            <div class="row">	  
                <div id="gallery" class="span3">
                    <a href="<c:url value="/GundamImages/${product.product_id}.jpg"/>">
                        <img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 400px; width:100%;"/>
                    </a><hr/>                  

                </div>

                <div class="span6">
                    <h3 style="color: #e1d00b">${product.productName}</h3>
                    <small></small>
                    <hr class="soft"/>
                    <div class="control-group">
                        <label class="control-label"><span>&dollar;${product.price}</span></label>
                        <div class="controls">
                            <a class="btn btn-large btn-primary pull-right" href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>">Thêm vào
                                <i class="icon-shopping-cart"></i>
                            </a>
                        </div>
                    </div>

                    <hr class="soft"/>
                    <h3>TRẠNG THÁI:</h3>
                    <p>CÒN HÀNG</p>
                    <hr class="soft clr"/>


                    <div class="btn-toolbar">
                        <div class="btn-group">
                            <span class="btn"><i class="icon-envelope"></i></span>
                            <span class="btn" ><i class="icon-print"></i></span>
                            <span class="btn" ><i class="icon-zoom-in"></i></span>
                            <span class="btn" ><i class="icon-star"></i></span>
                            <span class="btn" ><i class=" icon-thumbs-up"></i></span>
                            <span class="btn" ><i class="icon-thumbs-down"></i></span>
                        </div>
                    </div>


                </div>

                <div class="span9 ">
                    <ul id="productDetail" class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">Thông tin</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade active in " id="home" >
                            <h4>Thông tin món hàng</h4>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr class="techSpecRow"><th colspan="2">Thông số kĩ thuật:</th></tr>
                                    <tr class="techSpecRow"><td class="techSpecTD1">Mã sản phẩm: </td><td class="techSpecTD2"> ${product.product_id}</td></tr>
                                    <tr class="techSpecRow"><td class="techSpecTD1">Thương hiệu: </td><td class="techSpecTD2">${product.brandName}</td></tr>
                                    <tr class="techSpecRow"><td class="techSpecTD1">Model:</td><td class="techSpecTD2">${product.type_id} (${product.typeName})</td></tr>
                                    <tr class="techSpecRow"><td class="techSpecTD1">Released on:</td><td class="techSpecTD2"> <%= new Date()%></td></tr>
                                    <tr class="techSpecRow"><td class="techSpecTD1">Chiều cao | Tỉ lệ:</td><td class="techSpecTD2">${product.height} | ${product.ratio}</td></tr>
                                    <tr class="techSpecRow"><td class="techSpecTD1">Nơi sx:</td><td class="techSpecTD2">${product.origin}</td></tr>
                                    <tr class="techSpecRow"><td class="techSpecTD1">Chất liệu:</td><td class="techSpecTD2">${product.productMaterial}</td></tr>

                                </tbody>
                            </table>

                            <h3>Chi tiết mô tả: </h3>
                            <p >
                                ${product.productDetails}
                            </p>                       
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div> 

</html>