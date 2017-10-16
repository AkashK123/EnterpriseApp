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
            
 	<button type="submit" class="btn btn-info" formaction = "addcategory">Add New Category</button>
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
<c:forEach var="list" items="${categorylist}">
<form:form modelAttribute="category">
<tr class="form-group">
<td><form:input type="text" class="form-control" path="id" value="${list.id}" /></td>
<td><form:input type="text" class="form-control" path="categoryName" value="${list.categoryName}" /></td>
<td><form:input type="text" class="form-control" path="categoryDescription" value="${list.categoryDescription}" /></td>
<td>
<button type="submit" class="btn btn-info btn-xs" formaction = "updateCategoryData">Update</button>
<button type="submit" class="btn btn-info btn-xs" formaction = "deleteCategory${list.id}">Delete</button>
</td>
</tr>
</form:form>

</c:forEach>
</table>
</div>
</center>

<%@ include file="/WEB-INF/view/footer.jsp" %>