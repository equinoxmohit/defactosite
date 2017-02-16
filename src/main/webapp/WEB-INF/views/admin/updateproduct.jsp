<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/shared/header.jsp"%>
<div class="container">
    <div>
        <h1>Edit Products</h1>
        <p>Add new products by filling the form given below.</p>
    </div>

    <div>
        <form:form commandName="product" method="post"
                   action="${pageContext.request.contextPath}/admin/update"
                   enctype="multipart/form-data">
            <!--Mandatory to  update the product to get the id-->
            <form:hidden path="productId" value="${product.productId}"/>
            <div class="form-group">
                <label for="name">Product Name</label>
                <form:errors path="productName" cssStyle="color:darkred"/>
                <form:input path="productName" id="name" class="form-control" value="${product.productName}" />
            </div>
            <div class="form-group">
                <label for="desc">Product Description</label>
                <form:textarea path="productDescription" id="desc" class="form-control" value="${product.productDescription}"/>
            </div>
            <div class="form-group">
                <label for="manf">Product Manufacturer</label>
                <form:input path="productManufacturer" id="manf" class="form-control" value="${product.productManufacturer}"/>
            </div>
            <div class="form-group">
                <label for="price">Product Price</label>
                <form:errors path="productPrice" cssStyle="color:darkred"/>
                <form:input path="productPrice" id="price" class="form-control" value="${product.productPrice}" />
            </div>
            <div class="form-group">
                <label for="stock">Product Stock</label>
                <form:errors path="productStock" cssStyle="color:darkred"/>
                <form:input path="productStock" id="stock" class="form-control" value="${product.productStock}" />
            </div>

            <!--division to add image-->
            <div class="form-group">
                <label class="control-label" for="productImage">Upload Picture</label>
                <form:input path="productImage" id="productImage" type="file" class="form:input-large"/>
            </div>

            <br>
            <div>
                <input type="submit" class="btn btn-success" value="Submit" />
                <a href="<c:url value="/admin/products?cancel"/>" class="btn btn-danger">Cancel</a>
            </div>

        </form:form>
    </div>
</div>
<%@include file="/WEB-INF/views/shared/footer.jsp"%>