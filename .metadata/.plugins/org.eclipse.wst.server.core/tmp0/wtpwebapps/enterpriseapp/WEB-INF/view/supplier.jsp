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
<button type="submit" class="btn btn-info" formaction = "addsupplier">Add New Supplier</button>
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
<form:form modelAttribute="supplier">
<tr class="form-group">
<td><form:input type="text" class="form-control" path="id" value="${list.id}" /></td>
<td><form:input type="text" class="form-control" path="name" value="${list.name}" /></td>
<td><form:input type="text" class="form-control" path="email" value="${list.email}" /></td>
<td><form:input type="text" class="form-control" path="contact" value="${list.contact}" /></td>
<td><form:input type="text" class="form-control" path="address" value="${list.address}" /></td>
<td>
<button type="submit" class="btn btn-info btn-xs" formaction = "updatesupplierdata">Update</button>
<button type="submit" class="btn btn-info btn-xs" formaction = "deletesupplier${list.id}">Delete</button>
</td>
</tr>
</form:form>
	
	</c:forEach>
</table>
</div>
</center>
<%@ include file="/WEB-INF/view/footer.jsp" %>