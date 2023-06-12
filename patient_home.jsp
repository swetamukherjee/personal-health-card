<%@page import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PATIENT HOME</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
    <%!
    String name;
    %>
 <%
    String regdno_var=(String)session.getAttribute("regdno");
     Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              String sql=" Select * from patient where regdno='"+regdno_var+"'";
              Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     if(rs.next())
                     {
                         name=rs.getString("PATIENT_NAME");
                     }
              
 %> 
<div id="container" class="width">
    <header> 
	<div class="width">
	  <h1><a href="/">CLOUD ENABLED PERSONAL HEALTH CARD<strong></strong></a></h1></br></br></br></br>
		<nav>
    			<ul class="sf-menu dropdown">
        	     <li><a href="view_profile.jsp">VIEW PROFILE</a></li>
	     	     <li><a href="update_profile.jsp">UPDATE PROFILE</a></li>
                    <li><a href="change_password.jsp">CHANGE PASSWORD</a></li>
                    <li><a href="history.jsp">HISTORY</a></li>
                    <li><a href="search_prescription.jsp">SEARCH PRESCRIPTION</a></li>
                    <li><a href="view_doctor.jsp">VIEW DOCTOR</a></li>
		  </ul>
                   <div class="clear"></div>
	        </nav>
   	</div>
        <div class="clear"></div>
        <div id="signin">
            <p class="signp" align="right">Hello,<%=name%></p>
            <p class="signp" align="right"><a href="logout.jsp" class="signa">LOGOUT</a></p>
      </div>
    </header>
    <div id="intro">

	<div class="width">
                <div class="intro-content">
	
                    <h2>Welcome <%=name%></h2>
                    <p></p>
   	     </div>               
        </div>
                    
	</div>
                    <div id="body" class="width" style=" padding-left: 100px">
        <h1>Here you Can:</h1></br>
	<h5>View Profile</h5></br>	
        <h5>Update Profile</h5></br>
        <h5>Change Password</h5></br>
        <h5>History</h5></br>
        <h5>Search Prescription</h5></br>
        <h5>View Doctor</h5></br>
    	<div class="clear"></div>
    </div>
<footer>
        <div class="footer-bottom">
            <p>&copy;Cloud Enabled Personal Health Card</p>
         </div>
    </footer>
</div>
</body>
</html>