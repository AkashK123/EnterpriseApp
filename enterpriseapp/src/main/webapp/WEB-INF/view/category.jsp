<%@ include file="/WEB-INF/view/header.jsp" %>
<center>
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
            
<h1>CATEGORY MODULE</h1>
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

<%@ include file="/WEB-INF/view/footer.jsp" %>