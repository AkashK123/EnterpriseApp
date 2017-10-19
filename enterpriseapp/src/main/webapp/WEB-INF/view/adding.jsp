<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<%@ include file="/WEB-INF/view/header.jsp" %>

<div class="container">
<ul class="nav nav-tabs">
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
<button type="submit" class="btn btn-info" formaction="addcategory">Add New Product</button>
</c:if>
<c:if test="${var==false}">
<button type="submit" class="btn btn-info" formaction="updateCategoryData">Update Product</button>
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
</div>

<!-- Product -->
<div id="producttab" class="tab-pane fade">
</div>


</div>

</div>

<%@ include file="/WEB-INF/view/footer.jsp" %>

</body>
</html>