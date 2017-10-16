
<%@ include file="/WEB-INF/view/header.jsp" %>
<h1>Personal Information</h1>
<center>
<form:form modelAttribute="registrationForm" >
<div class="container">

<div class="form-group">
<form:label class="col-sm-2" path="name">FIRST NAME: </form:label>
<form:input class="col-sm-8 form-control" path="name" required="true"/>
</div>


<div class="form-group">
<form:label class="col-sm-2" path="dob">DATE OF BIRTH: </form:label>
<form:input class="col-sm-8 form-control" required="true" path="dob"/>
</div>

<div class="form-group">
<form:label  class="col-sm-2" path="email">EMAIL: </form:label>
<form:input type="email" required="true" class="col-sm-8 form-control" path="email"/>
</div>

<div class="form-group">
<form:label class="col-sm-2" path="contact">CONTACT: </form:label>
<form:input class="col-sm-8 form-control" required="true" path="contact"/>
</div>

<div class="form-group">
<form:label class="col-sm-2" path="gender">GENDER: </form:label>
<form:radiobutton path = "gender" value = "Male" label = "Male" />
<form:radiobutton path = "gender" value = "Female" label = "Female" />
<form:radiobutton path = "gender" value = "Transgender" label = "Transgender" />
</div>

<div class="form-group">
<form:label class="col-sm-2" path="country">COUNTRY: </form:label>
<form:input class="col-sm-8 form-control" required="true" path="country"/>
</div>

<div class="form-group">
<form:label class="col-sm-2" path="address">ADDRESS: </form:label>
<form:textarea class="col-sm-8 form-control" required="true" path="address"/>
</div>

<div class="form-group">
<form:label class="col-sm-2" path="Password">PASSWORD: </form:label>
<form:password class="col-sm-8 form-control" required="true" path="Password"/>
</div>

<div class="form-group">
<form:label class="col-sm-2" path="confirmPassword">CONFIRM PASSWORD: </form:label>
<form:input class="col-sm-8 form-control" required="true" path="confirmPassword"/>
</div>
</div>
<button type="submit" formaction="register">Submit</button>
<button type="reset">Reset</button>
</form:form>
</center>
<%@ include file="/WEB-INF/view/footer.jsp" %>


