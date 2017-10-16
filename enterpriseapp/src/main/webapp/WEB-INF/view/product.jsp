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

<h1>PRODUCT MODULE</h1>
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

<td>${list.supplierId}</td>
<td><a href="<c:url value="updateproduct${list.id}"/>">Update</a>/<a href="<c:url value="deleteproduct${list.id}"/>">Delete</a></td>
</tr>
</c:forEach>
</table>
</form:form>
</center>
<%@ include file="/WEB-INF/view/footer.jsp"%>