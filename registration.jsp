<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
function openPage(val)
{
	if(val=="PATIENT")
		document.location.href ="patientRegistration.html";
	else if(val=="HOSPITAL")
		document.location.href ="hospital_registration.html";
	else if(val=="LAB")
		document.location.href ="lab_regd.jsp";
	else if(val=="DOCTOR")
		document.location.href ="doctor_registration.html";
		
}
</script>
<title>User Login</title>
<link rel="stylesheet" href="css/lreset.css">
<link rel="stylesheet" href="css/lstyle.css">  
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles1.css" type="text/css" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<div id="container" class="width">

<header> 
	<div class="width">
      <h1><a href="/">CLOUD ENABLED PERSONAL HEALTH CARD<strong></strong></a></h1></br></br></br></br>
		<nav>
    			<ul class="sf-menu dropdown">
                    <li><a href="index.html">HOME</a></li>
	     	        <li><a href="services.html">Services</a></li>
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
		  </ul>
			<div class="clear"></div>
	  </nav>
   	  </div>

	<div class="clear"></div>

    </header>
    <div id="intro">
</div>
    <div class="pen-title">
        <h1> Registration Here</h1>
    </div>
<div id="body" class="width">
<div class="module form-module">
    
  <div class="form">
    <h2>Choose Type</h2>
    <form action="#" method="get">
      <select name="type" size="1" onchange="openPage(this.value)">
          <option>Select</option>
          <option>PATIENT</option>
          <option>HOSPITAL</option>
          <option>DOCTOR</option>
          <option>LAB</option>
      </select>
    </form>
  </div>
  <div class="cta"><a href="login.jsp">Click to Login</a></div>
</div>
<script src="js/lindex.js"></script>
	
		
    	<div class="clear"></div>
    </div>
 <footer>
        <div class="footer-content width">
            <ul>
            	<li>
            	  <h4>About Us</h4></li>
                <li><a href="goal.jsp">Our Goal</a></li>
              
            </ul>
            
            <ul>
            	<li>
            	  <h4>Patient Services</h4></li>
                <li><a href="geninfo.jsp">General Instruction</a></li>
                <li><a href="admission.jsp">Admission Procedure</a></li>
                <li><a href="health.jsp">Health Tips</a></li>
               
                
            </ul>

 	    <ul>
                <li><h4>Doctor Services</h4></li>
                <li><a href="login.jsp">Find a Doctor</a></li>
                <li><a href="login.jsp">Request for an Appointment</a></li>
                <li><a href="registration.jsp">Online Registration</a></li>
                <li>Ambulance number:108</li> 
            </ul>
            
             <ul class="endfooter">
            	<li><h4>Contact us</h4></li>
                <li>Sweta Mukherjee</li>
                <li>Dilnasin Parween</li>
                <li>Kiran Senapati</li>
                <li>Neha Bharadwaj</li>
                                                              

            </ul>
            
            <div class="clear"></div>
        </div>
        <div class="footer-bottom">
          <p>&copy;Cloud Enabled Personal Health Card</p>
         </div>
    </footer>
</div>
</body>
</html>