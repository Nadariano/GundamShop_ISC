<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <div class="row">
        <div class="span9">
            <ul class="breadcrumb">
                <li><a href="<c:url value="/home/index.do"/>">Home</a> <span class="divider">/</span></li>
                <li class="active">Sản phẩm</li>
            </ul>
            <hr class="soft"/>
            <h2> Phân loại: ${type_id} <small class="pull-right"> ${total} mẫu</small><br/></h2>	

            <c:if test="${User!=null and User.roleId==true}">
                <a href="<c:url value="/admin/create.do"/>">Thêm sản phẩm mới</a>
            </c:if>

            <hr class="soft"/>

            <c:if test="${total==0}">
                <h1 style="color: gold;">Không tìm thấy sản phẩm có chứa "${namePart}"</h1>
            </c:if>

            <c:if test="${total!=0}">
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" name="subOp" type="button" data-toggle="dropdown">Sắp xếp theo ${subOpName}
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value="/product/products.do?op=sort&subOp=default"/>">Mặc định</a></li>
                        <li><a href="<c:url value="/product/products.do?op=sort&subOp=ascPrice"/>" ${subOpName=='Giá tăng dần'?'selected':''} >Giá tăng dần</a></li>
                        <li><a href="<c:url value="/product/products.do?op=sort&subOp=descPrice"/>" ${subOpName=='Giá giảm dần'?'selected':''} > Giá giảm dần</a></li>
                    </ul>
                </div>     

                <div id="myTab" class="pull-right">
                    <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
                    <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
                </div>
                <br class="clr"/>

                <div class="tab-content">

                    <div class="tab-pane" id="listView">
                        <ul class="thumbnails">

                            <c:forEach var="product" items="${list}" varStatus="loop">
                                <div class="row" >	  
                                    <div class="span2" style="padding-left: 50px;">
                                        <img src="<c:url value="/GundamImages/${product.product_id}.jpg"/>" alt="" style="height: 200px;"/>
                                    </div>
                                    <div class="span4">
                                        <hr class="soft"/>
                                        <h4>${product.product_id}</h4>
                                        <div style="color:#e1d00b;text-align:left">${product.productName}</div>
                                        <div>${product.brandName}</div>
                                        <a class="btn btn-small pull-right" href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>">Xem thông tin</a>
                                        <c:if test="${User!=null and User.roleId==true}">
                                            <a href="<c:url value="/admin/update.do?product_id=${product.product_id}"/>">Sửa</a>|
                                            <a href="<c:url value="/admin/delete.do?product_id=${product.product_id}"/>">Xóa</a>
                                        </c:if>
                                        <br class="clr"/>
                                    </div>
                                    <div class="span2 alignR">
                                        <form class="form-horizontal qtyFrm">
                                            <h3>&dollar;${product.price}</h3>
                                            <a href="<c:url value="/product/product_summary.do?op=add&product_id=${product.product_id}"/>" class="btn btn-large btn-primary"> Thêm vào <i class=" icon-shopping-cart"></i></a>
                                            <a href="<c:url value="/product/product_details.do?productId=${product.product_id}"/>" class="btn btn-large"><i class="icon-zoom-in"></i></a>

                                        </form>
                                    </div>
                                </div>
                                <hr class="soft"/>
                            </c:forEach>

                        </ul>
                    </div>

                    <div class="tab-pane  active" id="blockView">
                        <ul class="thumbnails">
                            <c:forEach var="product" items="${list}" varStatus="loop">
                                <li class="span3">
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
                                            </a> 
                                            <a class="btn btn-primary">&dollar;${product.price}</a>
                                        </h4>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <hr class="soft"/>
                    </div>
                </div>

                <!--Tao cai bang gom (total/6 +1) col-->
                <table border="1" cellpadding="5" cellspacing="5">
                    <tr>
                        <c:forEach begin="1" end="${total / 6 +1}" var="i">
                            <c:choose>
                                <c:when test="${currentPage == i}">
                                    <td>${i}</td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href="<c:url value="/product/products.do?op=${op}&type_id=${type_id}&subOp=${subOp}&productName=${namePart}&page=${i}"/>">${i}</a></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                    </tr>
                </table>

                <!--Dan den trang TRUOC (page= currentPage - 1 )-->
                <c:if test="${currentPage != 1}">
                    <a href="<c:url value="/product/products.do?op=${op}&type_id=${type_id}&subOp=${subOp}&productName=${namePart}&page=${currentPage - 1}"/>">Về trước |</a>
                </c:if>
                <!--Dan den trang SAU (page= currentPage + 1 )-->
                <c:if test="${currentPage < (total/6)}">
                    <a href="<c:url value="/product/products.do?op=${op}&type_id=${type_id}&subOp=${subOp}&productName=${namePart}&page=${currentPage + 1}"/>">Xem tiếp</a>
                </c:if>
                <br class="clr"/>

            </c:if>
        </div>
    </div>
</html>