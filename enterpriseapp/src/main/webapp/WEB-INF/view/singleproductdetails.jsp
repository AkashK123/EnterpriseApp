<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>

<%@ include file="/WEB-INF/view/header.jsp" %>

<div class="container">

<div class="row">
	<div class="col-xs-12">
		<ol class="breadcrumb">
			<li><a href="home">Home</a></li>
			<li><a href="viewproduct">Products</a></li>
			<li class="active">${productdetails.productName}</li>
		</ol>
	</div>
</div>

<div class="row">
<div class="col-sm-4">
<div class="thumbnail">
<img src="<c:url value="/resources/images/product/${productdetails.id}.jpg"/>" class="img img-responsive"/>
</div>
</div>
<div class="col-sm-8">

	<h3>${productdetails.productName}</h3>
	<hr/>
	
	<h3>Description</h3>		
	<p>${productdetails.productDescription}</p>
	<hr/>
			
	<h4>Price: <strong> &#8377; ${productdetails.productPrice} /-</strong></h4>
	<hr/>
	
	<c:choose>
		<c:when test="${productdetails.productStock < 1}">
		<h6>Qty. Available: <span style="color:red">Out of Stock!</span></h6>
		</c:when>
		<c:otherwise>				
		<h6>Qty. Available: ${productdetails.productStock}</h6>
		</c:otherwise>
	</c:choose>			


<security:authorize access="hasRole('USER')">
	<c:choose>
		<c:when test="${productdetails.productStock < 1}">
			<a href="javascript:void(0)" class="btn btn-warning disabled"><strike>
			<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</strike></a>
		</c:when>
		<c:otherwise>				
			<a href="#" class="btn btn-success">
			<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a>
		</c:otherwise>
	</c:choose>

	<a href="viewproduct" class="btn btn-primary"><strong>BACK</strong></a>
</security:authorize>

</div>

</div>

</div>
<%@ include file="/WEB-INF/view/footer.jsp" %>

</body>
</html>