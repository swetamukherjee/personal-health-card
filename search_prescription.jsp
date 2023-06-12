<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Search Prescription</title>
<script src="js/form_val_apatient.js"></script>
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
     <%!
        String name;
    %>
<%
     String patientid=(String)session.getAttribute("regdno");
     Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              String sql1=" Select * from patient where regdno='"+patientid+"'";
              Statement s=con1.createStatement();
                     ResultSet r=s.executeQuery(sql1);
                     if(r.next())
                     {
                         name=r.getString("patient_name");
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
                     <li class="selecteds"><a href="search_prescription.jsp">SEARCH PRESCRIPTION</a></li>
                      <li><a href="view_doctor.jsp">VIEW DOCTOR</a></li>
  </ul>
     <div class="clear"></div>
  </nav>
   </div>

        <div class="clear"></div>
        <div id="signin">
            <p class="signp" align="right"><%=name%></p>
            <p class="signp" align="right"><a href="logout.jsp" class="signa">LOGOUT</a></p>
      </div>
    </header>
     <div id="body" class="width">
               <h3>Search Prescription</h3>
                   
           
                  
        
                        <%!
            
             String patient_id_var;
             String doctor_id_var;
             String observation_var;
             String test_recommended_var;
             String medicine_var;
             String advice_var;
            
         %>
        
         
            <%
         
            
             String regdno=(String)session.getAttribute("regdno");
              String sql="Select * from add_prescription where patient_id='"+regdno+"'";
               
                
              Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     if(rs.next())
                     {
                         
                         patient_id_var=rs.getString("patient_id");
                         doctor_id_var=rs.getString("doctor_id");
                         observation_var=rs.getString("observation");
                         test_recommended_var=rs.getString("test_recommended");
                         medicine_var=rs.getString("medicine");
                         advice_var=rs.getString("advice");
                         
                     }
                          
                  %>
                        
                        <form action="" method="post">
           <table border="3" align="center" style="border-color: #8C0209;">
           
            
                              
                                <tr>
                                     <td>Patient Id</td>
                                    <td><input type="text" name="patientid" value="<%=patient_id_var%>" onfocus="this.blur()"></td>
                                </tr>
                                <tr>
                                     <td>Doctor Id</td>
                                    <td><input type="text" name="doctorid" value="<%=doctor_id_var%>" onfocus="this.blur()"></td>
    
                            </tr>

                                <tr>
                                    <td>Observation</td>
                                    <td><input type="text" name="observation" value="<%=observation_var%>" onfocus="this.blur()"></td>
                                </tr> 
                                 <tr>
                                    <td>Test Recommended</td>
                                    <td><input type="text" name="test_recommended" value="<%=test_recommended_var%>" onfocus="this.blur()"></td>
                                </tr> 
                                <tr>
                                    <td>Medicine</td> 
                                   <td><input type="text" name="medicine" value="<%=medicine_var%>" onfocus="this.blur()"></td>
                                </tr>
                            
                                    <tr> 
                                        <td>Advice</td>
                                        <td><input type="text" name="advice" value="<%=advice_var%>" onfocus="this.blur()"></td>
                                    </tr>
                                   
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