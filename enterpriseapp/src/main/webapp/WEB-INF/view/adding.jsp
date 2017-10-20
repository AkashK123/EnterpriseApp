<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
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

<div class="container">
<ul id="myTab" class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#categorytab">CATEGORY</a></li>
  <li><a data-toggle="tab" href="#suppliertab">SUPPLIER</a></li>
  <li><a data-toggle="tab" href="#producttab">PRODUCT</a></li>
</ul>
<div class="tab-content">

<!-- Category -->
<div id="categorytab" class="tab-pane fade in active">
<center>
<h1>CATEGORY MODULE</h1>
<form:form  modelAttribute="category">
         <table>
            <tr>
               <td><form:label path = "id">ID:</form:label></td>
               <td><form:input required="true" path = "id" /></td>
            </tr>
            <tr>
               <td><form:label path = "categoryName">Category Name:</form:label></td>
               <td><form:input required="true" path = "categoryName" /></td>
            </tr>
            <tr>
               <td><form:label path = "categoryDescription">Category Description:</form:label></td>
               <td><form:input required="true" path = "categoryDescription" /></td>
            </tr>
            </table>
            <br/>
 <c:if var="var" test="${status.equals('add')}"/>
<c:if test="${var==true}">
<button type="submit" class="btn btn-info" formaction="addcategory">Add New Category</button>
</c:if>
<c:if test="${var==false}">
<button type="submit" class="btn btn-info" formaction="updateCategoryData">Update Category</button>
</c:if>
</form:form>   
<h1>CATEGORY LIST</h1>
<div class="container">
<table class="table table-bordered">
<tr bgcolor="lightblue">
<th>ID</th>
<th>CATEGORY NAME</th>
<th>CATEGORY DESCRIPTION</th>
<th>UPDATE OR DELETE</th>
</tr>
<c:forEach var="list" items="${categoryList}">
	<tr>
	<td>${list.id}</td>
	<td>${list.categoryName}</td>
	<td>${list.categoryDescription}</td>
<td><a href="<c:url value="updateCategory${list.id}"/>">Update</a>/<a href="<c:url value="deleteCategory${list.id}"/>">Delete</a></td>
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
<table>
	<tr>
		<td><form:label path="id">ID:</form:label></td>
		<td><form:input required="true" path="id"/></td>
	</tr>

	<tr>
		<td><form:label path="name">Supplier Name:</form:label></td>
		<td><form:input required="true" path="name"/></td>
	</tr>

	<tr>
		<td><form:label path="email">Supplier Email:</form:label></td>
		<td><form:input required="true" path="email"/></td>
	</tr>

	<tr>
		<td><form:label path="contact">Supplier Contact:</form:label></td>
		<td><form:input required="true" path="contact"/></td>
	</tr>

	<tr>
		<td><form:label path="address">Supplier Address:</form:label></td>
		<td><form:textarea required="true" path="address"/></td>
	</tr>
</table>
<br/>
<c:if var="var" test="${status.equals('add')}"/>
<c:if test="${var==true}">
<button type="submit" class="btn btn-info" formaction="addsupplier">Add New Supplier</button>
</c:if>
<c:if test="${var==false}">
<button type="submit" class="btn btn-info" formaction="updatesupplierdata">Update Supplier</button>
</c:if>

</form:form>
<h1>SUPPLIER LIST</h1>
<div class="container">
<table class="table table-bordered">
	<tr bgcolor="lightblue">
		<th>ID</th>
		<th>NAME</th>
		<th>EMAIL</th>
		<th>CONTACT</th>
		<th>ADDRESS</th>
		<th>UPDATE OR DELETE</th>
	<tr/>
<c:forEach var="list" items= "${supplierList}">
<tr>
	<td>${list.id}</td>
	<td>${list.name}</td>
	<td>${list.email}</td>
	<td>${list.contact}</td>
	<td>${list.address}</td>
	<td><a href="<c:url value="updatesupplier${list.id}"/>">Update</a>/<a href="<c:url value="deletesupplier${list.id}"/>">Delete</a></td>	
	</c:forEach>
</table>
</div>
</center>
</div>

<!-- Product -->
<div id="producttab" class="tab-pane fade">
<center>
<h1>PRODUCT MODULE</h1>
<form:form enctype="multipart/form-data" modelAttribute="product">
<table>
<tr>
<td><form:label path="id">Product ID:</form:label></td>
<td><form:input required="true" path="id"/></td>
</tr>

<tr>
<td><form:label path="productName">Name:</form:label></td>
<td><form:input required="true" path="productName"/></td>
</tr>

<tr>
<td><form:label path="productDescription">Description:</form:label></td>
<td><form:textarea required="true" path="productDescription"/></td>
</tr>

<tr>
<td><form:label path="productStock">Number of Stock Available:</form:label></td>
<td><form:input required="true" path="productStock"/></td>
</tr>

<tr>
<td><form:label path="productPrice">Price:</form:label></td>
<td><form:input required="true" path="productPrice"/></td>
</tr>

<tr>
<td><form:label path="categoryId">Category:</form:label></td>
<td><form:select path="categoryId">
<c:forEach var="list" items="${categoryList}">
<form:option value="${list.id}">${list.categoryName}</form:option>
</c:forEach>
</form:select>
</td>
</tr>

<tr>
<td><form:label path="supplierId">Supplier</form:label></td>
<td><form:select path="supplierId">
<c:forEach var="list" items="${supplierList}">
<form:option value="${list.id}">${list.name}</form:option>
</c:forEach>
</form:select>
</td>
</tr>


<tr>
<td><form:label path="pimg">Price:</form:label></td>
<td><form:input type="file" path="pimg"/></td>
</tr>

</table>
<br/>

<c:if var="var" test="${status.equals('add')}"/>
<c:if test="${var==true}">
<button type="submit" class="btn btn-info" formaction="addproduct">Add New Product</button>
</c:if>
<c:if test="${var==false}">
<button type="submit" class="btn btn-info" formaction="updateproductdata">Update Product</button>
</c:if>
</form:form>

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


<td><a href="<c:url value="updateproduct${list.id}"/>">Update</a>/<a href="<c:url value="deleteproduct${list.id}"/>">Delete</a></td>
</tr>
</c:forEach>
</table>
</form:form>
</center>
</div>


</div>

</div>

<%@ include file="/WEB-INF/view/footer.jsp" %>

</body>
</html>