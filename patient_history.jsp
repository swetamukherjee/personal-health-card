<!doctype html>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/form_val_apatient.js"></script>
<title>PATIENT HISTORY</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<%
    String name=(String)session.getAttribute("hname");
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
     <div id="body" class="width">
               <h3>PATIENT HISTORY</h3>
  	      
                        <table>
        <tr>
            <td>doctor_id</td>
            <td>patient_id</td>
            <td>observation</td>
            <td>test_recommended</td>
            <td>medicine</td>
            <td>advice</td>
        </tr>
        <%!
    String doctor_id_var;
    String patient_id_var;
    String observation_var;
    String test_recommended_var;
    String medicine_var;
    String advice_var;
    %>
    <%
               
             
              String sql=" Select * from add_prescription";
              Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     while(rs.next())
                     {
                         doctor_id_var=rs.getString("doctor_id");
                         patient_id_var=rs.getString("patient_id");
                         observation_var=rs.getString("observation");
                         test_recommended_var=rs.getString("test_recommended");
                         medicine_var=rs.getString("medicine");
                         advice_var=rs.getString("advice");
                         %>
                         <tr>
                             <td><%=doctor_id_var%></td>
                             <td><%=patient_id_var%></td>
                             <td><%=observation_var%></td>
                             <td><%=test_recommended_var%></td>
                             <td><%=medicine_var%></td>
                             <td><%=advice_var%></td>
                         </tr>
                         <%
                     }
                     %>
                        </table>

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