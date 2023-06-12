<!doctype html>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/form_val_apatient.js"></script>
<title>UPDATE PROFILE</title>
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
     
         <%
            String stat1=request.getParameter("status");
            if(stat1!=null)
            {
         %>
         <center> <b style="color:red"> <%=stat1%> </b></center>
         <%
            }
         %>
               <h3>UPDATE PROFILE</h3>
  	      
                        <%!
             String patient_id_var;
             String patient_name_var;
             String gender_var;
             String marital_status_var;
             String dob_var;
             String age_var;
             String address_var;
             String city_var;
             String district_var;
             String state_var;
             String pin_var;
             String phn_no_var;
             String email_var;
             String complain_var;
             
         %>
         <%!
             String regdno_var1;
             %>
         <%
          regdno_var1=(String)session.getAttribute("regdno");
      
              String sql=" Select * from patient where regdno='"+regdno_var1+"'";
              Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              Statement st=conn.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     if(rs.next())
                     {
                      
                        patient_name_var=rs.getString("patient_name");                       
                        gender_var=rs.getString("gender");
                        marital_status_var=rs.getString("marital_status");
                        dob_var=rs.getString("dob");
                        age_var=rs.getString("age");
                        address_var=rs.getString("address");
                        city_var=rs.getString("city");
                        district_var=rs.getString("district");
                        state_var=rs.getString("state");
                        pin_var=rs.getString("pin");
                        phn_no_var=rs.getString("phn_no");
                        email_var=rs.getString("email");
                        complain_var=rs.getString("complain");
                     }
                        %>                    
                        <form action ="updateprofile">
                            <table>
           
            
              <tr>
                                     <td>Patient Id</td>
                                    <td><input type="text" name="patient_id" value="<%=regdno_var1%>"></td>
                                </tr>
                                <tr>
                                    <td>Patient Name</td>
                                    <td><input type="text" name="patient_name" value="<%=patient_name_var%>"></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><input type="text" name="gender" value="<%=gender_var%>"></td>
                                </tr> 
                                <tr>
                                    <td>Marital Status</td> 
                                   <td><input type="text" name="marital_status" value="<%=marital_status_var%>"></td>
                                </tr>
                            
                                    <tr> 
                                        <td>DOB</td>
                                        <td><input type="text" name="dob" value="<%=dob_var%>"></td>
                                    </tr>
                                    <tr> 
                                        <td>Age</td>
                                        <td><input type="text" name="age" value="<%=age_var%>"></td>
                                    </tr>
                                    <tr> 
                                        <td>Address</td>
                                        <td><input type="text" name="address" value="<%=address_var%>"></td>
                                    </tr>
                                <tr> 
                                        <td>City</td>
                                        <td><input type="text" name="city" value="<%=city_var%>"></td>
                                    </tr>
                                  <tr> 
                                        <td>District</td>
                                        <td><input type="text" name="district" value="<%=district_var%>"></td>
                                    </tr>
                                    <tr> 
                                        <td>State</td>
                                        <td><input type="text" name="state" value="<%=state_var%>"></td>
                                    </tr>
                                    <tr> 
                                        <td>PIN</td>
                                        <td><input type="text" name="pin" value="<%=pin_var%>"></td>
                                    </tr>
                                    <tr> 
                                        <td>Phone No</td>
                                        <td><input type="text" name="phn_no" value="<%=phn_no_var%>"></td>
                                    </tr>
                                    <tr> 
                                        <td>Email</td>
                                        <td><input type="text" name="email" value="<%=email_var%>"></td>
                                    </tr>
                                    <tr> 
                                        <td>Complain</td>
                                        <td><input type="text" name="complain" value="<%=complain_var%>"></td>
                                    </tr>
                                    <tr>
                                    <td><input type="submit" value="update"></td>
                                   
                                </tr>
                            </table>
                        </form>
     <div class="clear"></div>
           
 <footer>
        <div class="footer-bottom">
            <p>&copy;Cloud Enabled Personal Health Card</p>
         </div>
    </footer>
</div>
</body>
</html>