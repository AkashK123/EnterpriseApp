
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sc"%>
<%@ include file="/WEB-INF/view/header.jsp" %>


	<div id="mycarousel" class="carousel slide" data-ride="carousel"
		data-interval="3000">
		<ol class="carousel-indicators">
			<li data-target-="#mycarousel" data-slide-to="0" class="active"></li>
			<li data-target-="#mycarousel" data-slide-to="1"></li>
			<li data-target-="#mycarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img src="<sc:url value="/resources/images/mobile.png"/>" style="margin:auto;width:100%;height:500px">
				<div class="carousel-caption">
        <h2>MOBILE</h2>
      </div>
			</div>
			<div class="item">
				<img src="<sc:url value="/resources/images/laptopcarousel.jpg"/>" style="margin:auto;width:100%;height:500px">
				<div class="carousel-caption">
        <h2>LAPTOP</h2>
      </div>
			</div>
			<div class="item">
				<img src="<sc:url value="/resources/images/tv.jpg"/>" style="margin:auto;width:100%;height:500px">
				<div class="carousel-caption">
        <h2>TELEVISION</h2>
      </div>
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
<%@ include file="/WEB-INF/view/footer.jsp" %>