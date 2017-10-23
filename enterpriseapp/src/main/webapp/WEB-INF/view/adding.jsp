<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
 
	$(document).ready(function(){
        $(	'a[data-toggle="tab"]').on('show.bs.tab', function(e) {
            localStorage.setItem('activeTab', $(e.target).attr('href'));
        });
        var activeTab = localStorage.getItem('activeTab');
        if(activeTab){
            $('#myTab a[href="' + activeTab + '"]').tab('show');
        }
    });   
    </script>
<title>ADMIN</title>
</head>
<body>

<%@ include file="/WEB-INF/view/header.jsp" %>

<c:if test="${taskcomplete.equals('added')}">
<div class="alert alert-success">
  <strong>Category added</strong> .
</div>
</c:if>

<c:if test="${taskcomplete.equals('updated')}">
<div class="alert alert-success">
  <strong>Category Updated</strong>
</div>
</c:if>

<c:if test="${taskcomplete.equals('deleted')}">
<div class="alert alert-success">
  <strong>Category deleted</strong> 
</div>
</c:if>


<div class="container">
<ul id="myTab" class="nav nav-tabs">
  <li><a data-toggle="tab" href="#categorytab">CATEGORY</a></li>
  <li><a data-toggle="tab" href="#suppliertab">SUPPLIER</a></li>
  <li><a data-toggle="tab" href="#producttab">PRODUCT</a></li>
</ul>
<div class="tab-content">

<!-- Category -->
<div id="categorytab" class="tab-pane fade">
<center>
<h1>CATEGORY MODULE</h1>

<center>
<form:form  modelAttribute="category" class="form-horizontal">
<div class="form-group">
<label class="control-label col-sm-2" >CATEGORY ID:</label>
<div class="col-sm-10">
<form:input required="true" path = "id" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Catgeory Name:</label>
<div class="col-sm-10">
<form:input required="true" path = "categoryName" class="form-control"/>
</div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" >Category Description:</label>
<div class="col-sm-10">
<form:input required="true" path = "categoryDescription" class="form-control"/>
</div>
</div>

 <c:if var="var" test="${status.equals('add')}"/>
<c:if test="${var==true}">
<button type="submit" class="btn btn-primary navbar-inverse" formaction="addcategory">Add New Category</button>
</c:if>
<c:if test="${var==false}">
<button type="submit" class="btn btn-primary navbar-inverse" formaction="updateCategoryData">Update Category</button>
</c:if>
</form:form>
</center>   
<h1>CATEGORY LIST</h1>
<div class="container">
<table class="table table-hover">
<thead bgcolor="#222">
<tr >
<th><font color="#FFFFFF">ID</font></th>
<th ><font color="#FFFFFF">CATEGORY NAME</font></th>
<th ><font color="#FFFFFF">CATEGORY DESCRIPTION</font></th>
<th ><font color="#FFFFFF">UPDATE OR DELETE</font></th>
</tr>
</thead>
<c:forEach var="list" items="${categoryList}">
	<tr>
	<td>${list.id}</td>
	<td>${list.categoryName}</td>
	<td>${list.categoryDescription}</td>
<td><a href="<c:url value="updateCategory${list.id}"/>"><button type="button" class="btn btn-info btn-sm">Update</button></a>
<a href="<c:url value="deleteCategory${list.id}"/>"><button type="button" class="btn btn-info btn-sm">Delete</button></a></td>
</tr>
</c:forEach>
</table>
</div>
</center>
</div>

<!-- Supplier -->

<div id="suppliertab" class="tab-pane fade">
<center>
<h1>SUPPLIER MODULE</h1>
<form:form modelAttribute="supplier">
<div class="form-group">
<label class="control-label col-sm-2" >Supplier ID:</label>
<div class="col-sm-10">
<form:input required="true" path = "id" class="form-control"/>
</div>
</div>
<br/><br/>
<div class="form-group">
<label class="control-label col-sm-2" >Supplier Name:</label>
<div class="col-sm-10">
<form:input required="true" path = "name" class="form-control"/>
</div>
</div>
<br/>
<div class="form-group">
<label class="control-label col-sm-2" >Supplier Email:</label>
<div class="col-sm-10">
<form:input required="true" path = "email" class="form-control"/>
</div>
</div>
<br/>
<div class="form-group">
<label class="control-label col-sm-2" >Supplier Contact:</label>
<div class="col-sm-10">
<form:input required="true" path = "contact" class="form-control"/>
</div>
</div>
<br/>
<div class="form-group">
<label class="control-label col-sm-2" >Supplier Address:</label>
<div class="col-sm-10">
<form:input required="true" path = "address" class="form-control"/>
</div>
</div>
<br/><br/>
<c:if var="var" test="${status.equals('add')}"/>
<c:if test="${var==true}">
<button type="submit" class="btn btn-primary navbar-inverse" formaction="addsupplier">Add New Supplier</button>
</c:if>
<c:if test="${var==false}">
<button type="submit" class="btn btn-primary navbar-inverse" formaction="updatesupplierdata">Update Supplier</button>
</c:if>

</form:form>
<h1>SUPPLIER LIST</h1>
<div class="container">
<table class="table table-hover">
<thead bgcolor="#222">
	<tr>
		<th><font color="#FFFFFF">ID</font></th>
		<th><font color="#FFFFFF">NAME</font></th>
		<th><font color="#FFFFFF">EMAIL</font></th>
		<th><font color="#FFFFFF">CONTACT</font></th>
		<th><font color="#FFFFFF">ADDRESS</font></th>
		<th><font color="#FFFFFF">UPDATE OR DELETE</font></th>
	<tr/>
</thead>
<c:forEach var="list" items= "${supplierList}">
<tr>
	<td>${list.id}</td>
	<td>${list.name}</td>
	<td>${list.email}</td>
	<td>${list.contact}</td>
	<td>${list.address}</td>
	<td><a href="<c:url value="updatesupplier${list.id}"/>"><button type="button" class="btn btn-info btn-xs">Update</button></a>
	<a href="<c:url value="deletesupplier${list.id}"/>"><button type="button" class="btn btn-info btn-xs">Delete</button></a></td>	
	</c:forEach>
</table>
</div>
</center>
</div>

<!-- Product -->
<div id="producttab" class="tab-pane fade">
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




<button type="submit" class="btn btn-primary navbar-inverse" formaction="addproduct">Add New Product</button>
</form:form>

</center>
</div>


</div>

</div>

<%@ include file="/WEB-INF/view/footer.jsp" %>

</body>
</html>