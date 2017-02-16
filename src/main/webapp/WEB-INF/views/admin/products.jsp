<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/shared/header.jsp"%>
<div class="container">
    <h1>Products</h1>
    <p>The listing of the products that are available are given below as:</p>
    <table class="table table-bordered table-responsive table-striped">
        <thead>
        <tr>
            <th></th>
            <th>Product Name</th>
            <th>Product Description</th>
            <th>Product Status</th>
            <th>Product Type</th>
            <th>Product Price</th>
            <th>Product Stock</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <c:forEach var="product" items="${products}">
            <tbody>
            <tr>
                <th><img src="<c:url value="/resources/images/${product.productId}.png"/>" style="width: 100%" alt="image"  /></th>
                <th>${product.productName}</th>
                <th>${product.productDescription}</th>
                <th>${product.productManufacturer}</th>
                <th>${product.productPrice}</th>
                <th>${product.productManufacturer}</th>
                <th>${product.productStock}</th>
                <th><a href="<spring:url value="/products/product/${product.productId}"/>"><span class="glyphicon glyphicon-info-sign"></span></a> </th>
                <th><a href="<spring:url value="/admin/update/${product.productId}"/>"><span class="glyphicon glyphicon-pencil"></span></a> </th>
                <th><a href="<spring:url value="/admin/delete/${product.productId}"/>"><span class="glyphicon glyphicon-remove-circle"></span></a> </th>

            </tr>
            </tbody>
        </c:forEach>
    </table>

    <div class="btn-section"><a href="<c:url value="/admin/addproducts"></c:url> " class="btn-default">Add Products</a></div>

</div>



<%@include file="/WEB-INF/views/shared/footer.jsp"%>