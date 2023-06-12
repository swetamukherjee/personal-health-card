<!doctype html>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/form_val_apatient.js"></script>
<title>PATIENT QUEUE</title>
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
               <h3>PATIENT DETAIL</h3>
  	      
                        <%!
             String patient_id_var;
             String complain_var;
             String department_var;
             String doctor_id_var;
             String doctor_name_var;
             String time_var;
             String date_added_var;
         %>
         <%
             String patient_id_var=request.getParameter("pid");
              String sql=" Select * from allocatepatient where patientid='"+patient_id_var+"'";
              Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     if(rs.next())
                     {
                         patient_id_var=rs.getString("patientid");
                         complain_var=rs.getString("complain");
                         department_var=rs.getString("department");
                         doctor_id_var=rs.getString("doctorid");
                         doctor_name_var=rs.getString("doctorname");
                         time_var=rs.getString("time");
                         date_added_var=rs.getString("date_added");
                     }
                        %>
                        <form action="" method="post">
           <table border="3" align="center" bordercolor="#8C0209" >
           
            
              <tr>
                                     <td>patient_id</td>
                                    <td><input type="test"name="patient_id" value="<%=patient_id_var%>" onfocus="this.blur()"></td>
                                </tr>
                                <tr>
                                     <td>complain</td>
                                    <td><input type="test"name="complain" value="<%=complain_var%>" onfocus="this.blur()"></td>
                                </tr>
                                <tr>
                                    <td>department</td>
                                    <td><input type="text"name="department" value="<%=department_var%>" onfocus="this.blur()"></td>
                                </tr> 
                                <tr>
                                    <td>doctor_id</td> 
                                   <td><input type="text"name="doctor_id" value="<%=doctor_id_var%>" onfocus="this.blur()"></td>
                                </tr>
                            
                                    <tr> 
                                        <td>doctor_name</td>
                                        <td><input type="text"name="doctor_name" value="<%=doctor_name_var%>" onfocus="this.blur()"></td>
                                    </tr>
                                    <tr> 
                                        <td>time</td>
                                        <td><input type="text"name="time" value="<%=time_var%>"  onfocus="this.blur()"></td>
                                    </tr>
                                
                            </table>
     <div class="clear"></div>
    </div>       
 <footer>
        <div class="footer-bottom">
            <p>&copy;CLOUD ENABLED PERSONAL HEALTH CARD </p>
         </div>
    </footer>
</div>
</body>
</html>