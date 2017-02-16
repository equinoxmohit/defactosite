<%@include file="/WEB-INF/views/shared/header.jsp"%>

<div class="container">
    <div>
        <h1>Product Page</h1>
        <p>Get the full description about the product you want to buy.</p>
    </div>
    <div class="row">
        <div class="col-md-5">
            <img src="<c:url value="/resources/images/${product.productId}.png"/>" style="width: 100%" alt="image"  />
        </div>
        <div class="col-md-5">
            <p><strong>Product Name:</strong> ${product.productName}</p>
            <p><strong>Product Description:</strong> ${product.productDescription}</p>
            <p><strong>Product Manufacturer:</strong> ${product.productManufacturer}</p>
            <p><strong>Product Price:</strong> Rs.${product.productPrice}</p>
            <p><strong>Product Stock:</strong> ${product.productStock}</p>
        </div>
    </div>
</div>


<%@include file="/WEB-INF/views/shared/footer.jsp"%>
