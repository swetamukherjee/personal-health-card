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
<title>User Login</title>
<link rel="stylesheet" href="css/lreset.css">
<link rel="stylesheet" href="css/lstyle.css">  
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles1.css" type="text/css" />
<script type="text/javascript" src="javascript/login.js"></script>


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
        <h2>Welcome to Cloud Enabled Personal Health Card Login</h2>
       
    </div>
    <div style="padding-left: 220px "><p>A convenient and secure way to mange your health and communication with doctor's office online</p></div>
    
    <%
    String status=request.getParameter("status");
    if(status!=null)
    {
    %>
    <center>
    <b style="color:red" > <%=status%> </b>
    </center><br>
    <%
    } 
    %>   

<div id="body" class="width">
<div class="module form-module">
    
  <div class="form">
    <h2>Log In</h2>
    <form action="login_verify" method="post" >
      <!--<select name="user_type" size="1" id="user_type" onblur="f3()">
          <option>select</option>
          <option>patient</option>
          <option>hospital</option>
          <option>lab</option>
          <option>doctor</option>
      </select>-->
      <input name="uid"  type="text" placeholder="User ID" id="uid" onblur="f1()"/>
      <input name="password"  type="password" placeholder="Password" id="password" onblur="f2()"/>
      <input name="Login" class="formbutton" value="Login" type="submit" />
      
        <script> 
                        function f1()
			{
				 var un=document.getElementById("uid").value;
				 if(un=="")
				{
				alert("enter id");
				}
			}
                        function f2()
			{
			    var pa=document.getElementById("password").value;
			    if(pa=="")
                            {
			    alert("enter password");
                            }
			}
                        function f3()
			{
			    var pa1=document.getElementById("user_type").value;
			    if(pa1=="select")
                            {
			    alert("enter type");
                            }
			}

</script>	

    </form>
  </div>
  <div class="cta"><a href="registration.jsp">Click to Register</a></div>
</div>
<script src="js/lindex.js"></script>
<div style=" padding-left: 300px;padding-top:10px "><h4>DO NOT USE PATIENT LOGIN FOR EMERGENCIES</h4></div>
		
    	<div class="clear"></div>
    </div>
 <footer>
        <div class="footer-content width">
            <ul>
            	<li>
            	  <h4>About us</h4></li>
                <li><a href="goal.jsp">Our goal </a></li>
              
            </ul>
            
            <ul>
            	<li>
            	  <h4>Patient services</h4></li>
                <li><a href="geninfo.jsp">General Instruction</a></li>
                <li><a href="admission.jsp">Admission Procedure </a></li>
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