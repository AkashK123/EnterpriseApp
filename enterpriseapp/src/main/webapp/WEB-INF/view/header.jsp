<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<nav class="navbar navbar-inverse  ">
<div class="container">

<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="nav navbar-nav navbar-left navbar-brand" href="#">All-In-One-Bazar</a>
<div class="navbar-collapse collapse">
<ul class=" nav navbar-nav navbar-left"> 
<li ><a href="home" >Home</a></li>

<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Caterory<b class="caret"></b></a>
<ul class="dropdown-menu">
<c:forEach var="li" items="${categoryList}">
<li><a href="#">${li.categoryName}</a></li>
</c:forEach>
</ul>
</li>
<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">ADMINCONTROL<b class="caret"></b></a>
<ul class="dropdown-menu">
<li><a href="#">Product</a></li>
<li><a href="category">Category</a></li>
<li><a href="#">Supplier</a></li>
</ul>
</li>

</ul>
<form class="navbar-form navbar-left">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Search</button>
</form>
<ul class=" nav navbar-nav navbar-right">
<li><a href="signup"><span class="glyphicon glyphicon-user"></span>Signup</a></li>
<li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span>Log-in</a></li>
<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>

</ul>
</div>
</div>
</nav>


<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
    </div>

  </div>
</div>

