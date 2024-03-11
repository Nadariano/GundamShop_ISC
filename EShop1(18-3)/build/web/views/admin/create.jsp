<%-- 
    Document   : update
    Created on : Mar 13, 2023, 10:01:49 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>Product Creator</h2>
<hr/>
<div class="row">
    <div class="span9">
        <form action="<c:url value="/admin/create_handler.do"/>">
            <div class="mb-3 mt-3">
                <label for="product_id" class="form-label">Product ID:</label>
                <input type="text" class="form-control" id="product_id" placeholder="Please enter id" name="product_id" value="${product.product_id}">
            </div>
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name:</label>
                <input type="text" class="form-control" id="productName" placeholder="Please enter name" name="productName" value="${product.productName}">
            </div>
            <div class="mb-3">
                <label for="origin" class="form-label">Origin:</label>
                <input type="text" class="form-control" id="origin" placeholder="Please enter origin" name="origin" value="${product.origin}">
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price:</label>
                <input type="number" step="0.1" class="form-control" id="price" placeholder="Please enter price" name="price" value="${product.price}">
            </div>
            <div class="mb-3">
                <label for="productDetails" class="form-label">Product Details:</label>
                <textarea type="text" class="form-control" id="productDetails" placeholder="Please enter details" name="productDetails" value="${product.productDetails}">${product.productDetails}</textarea>
            </div>
            <div class="mb-3">
                <label for="productMaterial" class="form-label">Product Materials:</label>
                <input type="text" class="form-control" id="productMaterial" placeholder="Please enter material" name="productMaterial" value="${product.productMaterial}">
            </div>
            <div class="mb-3">
                <label for="type_id" class="form-label">Type ID:</label>
                <input type="text" class="form-control" id="type_id" placeholder="Please enter type id" name="type_id" value="${product.type_id}">
            </div>
            <div class="mb-3">
                <label for="brand_id" class="form-label">Brand ID:</label>
                <%--<input type="number" class="form-control" id="brand_id" placeholder="Please enter brand id" name="brand_id" value="${product.brand_id}">--%>
                <select name="brand_id" class="form-control">
                    <c:forEach var="brand" items="${list}">
                        <option value="${brand.brand_id}"${brand.brand_id==product.brand_id?"selected":""}>${brand.brandName}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-outline-success" name="op" value="create">Create <i class="bi bi-check-square"></i></button>
            <button type="submit" class="btn btn-outline-danger" name="op" value="cancel">Cancel <i class="bi bi-x-square"></i></button>
        </form>
                <i style="color:red">${message}</i>
    </div>
    <div class="col">
        <img src="<c:url value=""/>" alt="">
    </div>
</div>