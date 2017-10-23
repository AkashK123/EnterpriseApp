<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ include file="/WEB-INF/view/header.jsp" %>

<c:if var="var" test="${status.equals('update')}"/>
<c:if test="${var==true}">
<center>
<h1>PRODUCT MODULE</h1>
<form:form enctype="multipart/form-data" modelAttribute="product" class="form-horizontal">

<div class="form-group">
<label class="control-label col-sm-2" >Product ID:</label>
<div class="col-sm-10">
<form:input required="true" path = "id" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Product Name:</label>
<div class="col-sm-10">
<form:input required="true" path = "productName" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Product Description:</label>
<div class="col-sm-10">
<form:input required="true" path = "productDescription" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Number of Stock Available::</label>
<div class="col-sm-10">
<form:input required="true" path = "productStock" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Price:</label>
<div class="col-sm-10">
<form:input required="true" path = "productPrice" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Category:</label>
<div class="col-sm-1">
<form:select path="categoryId">
<c:forEach var="list" items="${categoryList}">
<form:option value="${list.id}">${list.categoryName}</form:option>
</c:forEach>
</form:select>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Supplier:</label>
<div class="col-sm-1">
<form:select path="supplierId">
<c:forEach var="list" items="${supplierList}">
<form:option value="${list.id}">${list.name}</form:option>
</c:forEach>
</form:select>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Images:</label>
<div class="col-sm-1">
<form:input type="file" path="pimg"/>
</div>
</div>
<button type="submit" class="btn" formaction="updateproductdata">Update Product</button>
</form:form>

</center>
</c:if>

<c:if test="${var==false}">
<center>
<h1>PRODUCT LIST</h1>
<form:form modelAttribute="product">
<table class="table table-bordered">
<tr bgcolor="lightblue">
<th>ID</th>
<th>NAME</th>
<th>DESCRIPTION</th>
<th>STOCK</th>
<th>PRICE</th>
<th>CATEGORY ID</th>
<th>SUPPLIER ID</th>
<th>UPDATE OR DELETE</th>
</tr>
<c:forEach var="list" items="${productList}">
<tr>
<td>${list.id}</td>
<td>${list.productName}</td>
<td>${list.productDescription}</td>
<td>${list.productStock}</td>
<td>${list.productPrice}</td>

<c:forEach var="catlist" items="${categoryList}">
<c:if var="catvar" test="${list.categoryId==catlist.id}"/>
<c:if test="${catvar==true}">
<td>${catlist.categoryName}</td>
</c:if>
<c:if test="${catvar==false}">
</c:if>
</c:forEach>

<c:forEach var="suplist" items="${supplierList}">
<c:if var="supvar" test="${list.supplierId==suplist.id}"/>
<c:if test="${supvar==true}">
<td>${suplist.name}</td>
</c:if>
<c:if test="${supvar==false}">
</c:if>
</c:forEach>
<td><a href="<c:url value="updateproduct${list.id}"/>"><button type="button" class="btn btn-info btn-xs">Update</button></a>
<a href="<c:url value="deleteproduct${list.id}"/>"><button type="button" class="btn btn-info btn-xs">Delete</button></a></td>
</tr>
</c:forEach>
</table>
</form:form>
</center>

</c:if>

<%@ include file="/WEB-INF/view/footer.jsp" %>
</body>
</html>