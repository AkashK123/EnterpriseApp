<%@ include file="/WEB-INF/view/header.jsp" %>
<center>
<form:form  modelAttribute="category">

<div class="form-group">
         <table>
            <tr>
               <td><form:label path = "id">ID</form:label></td>
               <td><form:input required="true" path = "id" /></td>
            </tr>
            <tr>
               <td><form:label path = "categoryName">Category Name</form:label></td>
               <td><form:input required="true" path = "categoryName" /></td>
            </tr>
            <tr>
               <td><form:label path = "categoryDescription">Category Description</form:label></td>
               <td><form:input required="true" path = "categoryDescription" /></td>
            </tr>
            </table>
            <br/>
            
   <c:if var="var" test="${status.equals('add')}"/>
        <c:if test="${var==true}">
			<button type="submit" class="btn btn-info" formaction = "addcategory">Add New Category</button>
        </c:if>
        
        <c:if test="${var==false}">
			<button type="submit" class="btn btn-info" formaction = "updateCategoryData">Update Category</button>
        </c:if>
        
         </div> 
      </form:form>
<h1>CATEGORY MODULE</h1>
<div class="container">
<table class="table table-bordered">
<tr bgcolor="lightblue">
<th>ID</th>
<th>CATEGORY NAME</th>
<th>CATEGORY DESCRIPTION</th>
<th>Update or Delete</th>
</tr>
<c:forEach var="li" items="${categorylist}">
<tr>
<td>${li.id}</td>
<td>${li.categoryName}</td>
<td>${li.categoryDescription}</td>
<th><a href="<c:url value="updateCategory${li.id}"/>">Update</a>/<a href="<c:url value="deleteCategory${li.id}"/>">Delete</a></th>
</tr>
</c:forEach>
</table>
</div>
</center>

<%@ include file="/WEB-INF/view/footer.jsp" %>