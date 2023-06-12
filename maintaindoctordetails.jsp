<%@page import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MAINTAIN DOCTOR DETAILS</title>
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
              String sql=" Select * from hospital where regdno='"+regdno_var+"'";
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
        	    <li><a href="patientregd.jsp">PATIENT REGISTRATION</a></li>
	     	     <li><a href="allocatepatient.jsp">ALLOCATE PATIENT</a></li>
                     <li><a href="doctorlist.jsp">DOCTOR LIST</a></li>
                    <li class="selected"><a href="maintaindoctordetails.jsp">MAINTAIN DOCTOR DETAILS</a></li> 
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
        </div>
 	</div>
                      
           
    <div id="body" class="width">
         <h2><em>Maintain Doctor: </em></h2>
             <%
                String stat=request.getParameter("stat");
                if(stat!=null)
                                       {
             
             %>
            
             <center>
    <b style="color:blue"> <%=stat%> </b>
    </center><br>

             <%
                }
             %>
             
             <p > <a href="add_doctor.jsp" ><img src="images/addButton.png" />Add Doctor</a>
    </p>
    <table>
        <tr>
            <td>hospital_id</td>
            <td>department</td>
            <td>doctor_id</td>
            <td>doctor_name</td>
            <td>type</td>
            <td>time_from</td>
            <td>time_to</td>
            <td colspan="2">Action</td>
        </tr>
        <%! 
    String hospital_id_var;
    String department_var;
    String doctor_id_var;
    String doctor_name_var;
    String type_var;
    String time_from_var;
    String time_to_var;
    %>
    <%
    String sql1="Select * from maintaindoctor_details";
    Statement str=con.createStatement();
        ResultSet rst=st.executeQuery(sql1);
        while(rst.next())
        {
          hospital_id_var=rst.getString("hospital_id");
          department_var=rst.getString("department");
          doctor_id_var=rst.getString("doctor_id");
          doctor_name_var=rst.getString("doctor_name");
          type_var=rst.getString("type");
          time_from_var=rst.getString("time_from");
          time_to_var=rst.getString("time_to");  
        
                %>
                <tr>
                    <td><%= hospital_id_var%></td>
                    <td><%= department_var%></td>
                    <td><%= doctor_id_var%></td>
                    <td><%= doctor_name_var%></td>
                    <td><%= type_var%></td>
                    <td><%= time_from_var%></td>
                    <td><%= time_to_var%></td>
                    <td> <a href="edit_doctor.jsp?doctor_id=<%=doctor_id_var%>"><img title="edit doctor" src="images/edit.png"/></a></td>
                    <td> <a href="delete_doctor?doctor_id=<%=doctor_id_var%>" onclick="return cdelete();"><img title="delete doctor" src="images/delete.png"/></a></td>
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