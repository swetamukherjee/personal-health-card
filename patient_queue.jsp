<!doctype html>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/form_val_apatient.js"></script>
<title>HOSPITAL-ALLOCATE PATIENT</title>
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
               <h3>Patient Queue</h3>
  	      
                        <table>
        <tr>
            
            <td>Patient Id</td>
            
     
        </tr>
        <%!
    String patientid_var;
    
    %>
    <%
               
             
              String sql=" Select * from allocatepatient where date_added=(select to_char(sysdate,'dd-MM-yy')from dual) ";
              Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     while(rs.next())
                     {
                         patientid_var=rs.getString("patientid");
                         
                        
                         %>
                         <tr>
                             <td><%=patientid_var%></td>
                             
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