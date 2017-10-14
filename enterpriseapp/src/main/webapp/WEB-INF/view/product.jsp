<%@ include file="/WEB-INF/view/header.jsp" %>
<center>
<form:form modelAttribute="product">
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
<td><form:label path="productDescription">Description</form:label></td>
<td><form:input required="true" path="productDescription"/></td>
</tr>

<tr>
<td><form:label path="productStock">Number of Stock Available:</form:label></td>
<td><form:input required="true" path="productStock"/></td>
</tr>

<tr>
<td><form:label path="productPrice">Price</form:label></td>
<td><form:input required="true" path="productPrice"/></td>
</tr>

<tr>
<td><form:label path="categoryId">Category</form:label></td>
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
</table>
<br/>
<button type="submit" class="btn btn-info" formaction="addproduct">Add New Product</button>
</form:form>

<h1>PRODUCT MODULE</h1>
<form:form modelAttribute="product">
<table class="table table-bordered">
<tr>
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
<tr class="form-group">
<td><form:input type="text" class="form-control" path="id" value="${list.id}" /></td>
<td><form:input type="text" class="form-control" path="productName" value="${list.productName}" /></td>
<td><form:input type="text" class="form-control" path="productDescription" value="${list.productDescription}" /></td>
<td><form:input type="text" class="form-control" path="productStock" value="${list.productStock}" /></td>
<td><form:input type="text" class="form-control" path="productPrice" value="${list.productPrice}" /></td>
<td><form:input type="text" class="form-control" path="categoryId" value="${list.categoryId}" /></td>
<td><form:input type="text" class="form-control" path="supplierId" value="${list.supplierId}" /></td>
<td>
<button type="submit" class="btn btn-info btn-xs" formaction = "updateproduct">Update</button>
<button type="submit" class="btn btn-info btn-xs" formaction = "deleteproduct">Delete</button>
</td>
</tr>
</c:forEach>
</table>
</form:form>
</center>
<%@ include file="/WEB-INF/view/footer.jsp"%>