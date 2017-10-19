<%@ include file="/WEB-INF/view/header.jsp" %>
<center>
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
<button type="submit" class="btn btn-info" formaction="addsupplier">Add New Product</button>
</c:if>
<c:if test="${var==false}">
<button type="submit" class="btn btn-info" formaction="updatesupplierdata">Update Product</button>
</c:if>

</form:form>
<h1>SUPPLIER MODULE</h1>
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
<%@ include file="/WEB-INF/view/footer.jsp" %>