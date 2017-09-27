<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<%@ include file="/WEB-INF/view/footer.jsp" %>

	<div id="mycarousel" class="carousel slide" data-ride="carousel"
		data-interval="2000">
		<ol class="carousel-indicators">
			<li data-target-="#mycarousel" data-slide-to="0" class="active"></li>
			<li data-target-="#mycarousel" data-slide-to="1"></li>
			<li data-target-="#mycarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img src="<sc:url value="/resources/images/iphone8.jpg"/>" style="margin:auto;width:75%;height:300px">
			</div>
			<div class="item">
				<img src="<sc:url value="/resources/images/iphonex.jpg"/>" style="margin:auto;width:75%;height:300px">
			</div>
			<div class="item">
				<img src="<sc:url value="/resources/images/oneplus_5.jpeg"/>" style="margin:auto;width:75%;height:300px">
			</div>
		</div>
		<!-- Left and right controls -->
  <a class="left carousel-control" href="#mycarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#mycarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
	</div>


</body>
</html>