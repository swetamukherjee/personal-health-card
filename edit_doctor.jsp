<%@page import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit Doctor</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
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
        <h1>Edit Here</h1>
    </div>
    
    <div id="body" class="width">
<div class="module form-module">
<%!
    String hospital_id_var;
    String department_var;
    String doctor_id_var;
    String doctor_name_var;
    String type_var;
    String time_to_var;
    String time_from_var;
    %>
    <%
         
        String doctor_id_var=request.getParameter("doctor_id");
        Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
        String sql="select * from maintaindoctor_details where doctor_id='"+doctor_id_var+"'";
         Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     if(rs.next())
                     {
                         hospital_id_var=rs.getString("hospital_id");
                         department_var=rs.getString("department");
                         doctor_id_var=rs.getString("doctor_id");
                         doctor_name_var=rs.getString("doctor_name");
                         type_var=rs.getString("type");
                         time_from_var=rs.getString("time_from");
                         time_to_var=rs.getString("time_to");
                     }
                         %>
                         <form action="edit_doctor">
                             <table>
                                 <tr>
                                    <td>Hospital Id</td>
                                    <td><input type="text" name="hospital_id" value="<%=hospital_id_var%>" readonly></td>
                                 </tr>
                                 <tr>
                                    <td>Department</td>
                                    <td><input type="text" name="department" value="<%=department_var%>" readonly></td>
                                 </tr>
                                 <tr>
                                    <td>Doctor Id</td>
                                    <td><input type="text" name="doctor_id" value="<%=doctor_id_var%>" readonly></td>
                                 </tr>
                                 <tr>
                                    <td>Doctor Name</td>
                                    <td><input type="text" name="doctor_name" value="<%=doctor_name_var%>"></td>
                                 </tr>
                                 <tr>
                                    <td>Type</td>
                                    <td><input type="text" name="type" value="<%=type_var%>"></td>
                                 </tr>
                                 <tr>
                                    <td>Time from</td>
                                    <td><input type="text" name="time_from" value="<%=time_from_var%>"></td>
                                 </tr>
                                 <tr>
                                    <td>Time to</td>
                                    <td><input type="text" name="time_to" value="<%=time_to_var%>"></td>
                                 </tr>
                                 <tr>
                                     <td><input type="submit" value="update"></td>
                                     <td><input type="reset" value="cancel"></td>
                             </tr>
                             </table> 
                         </form>