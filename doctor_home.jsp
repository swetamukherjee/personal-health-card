<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cloud Enabled Personal Health Card</title>
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
             String sql="Select * from hospital where regdno='"+regdno_var+"'";
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery(sql);
             if(rs.next())
             {
                 name=rs.getString("hname");
             }
                     
 %> 
<div id="container" class="width">
    <header> 
	<div class="width">
	  <h1><a href="/">CLOUD ENABLED PERSONAL HEALTH CARD<strong></strong></a></h1></br></br></br></br>
		<nav>
    			<ul class="sf-menu dropdown">
        	     <li><a href="patient_queue.jsp">PATIENT QUEUE</a></li>
	     	     <li><a href="patient_details.jsp">PATIENT DETAILS</a></li>
                    <li><a href="patient_history.jsp">PATIENT HISTORY</a></li>
                    <li><a href="add_prescription.jsp">ADD PRESCRIPTION</a></li>
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
        <h1>Here you can see:</h1></br>
	<h5>Patient Queue</h5></br>	
        <h5>Patient Details</h5></br>
        <h5>Patient History</h5></br>
        <h5>Add Patient Prescription</h5></br>	
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
