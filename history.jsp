<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>History</title>
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
                    <li class="selected"><a href="history.jsp">HISTORY</a></li>
                     <li><a href="search_prescription.jsp">SEARCH PRESCRIPTION</a></li>
                      <li><a href="view_doctor.jsp">VIEW DOCTOR </a></li>
  </ul>
     <div class="clear"></div>
  </nav>
   </div>

        <div class="clear"></div>
        <div id="signin">
            <p class="signp" align="right">Welcome,<%=name%></p>
            <p class="signp" align="right"><a href="logout.jsp" class="signa">LOGOUT</a></p>
      </div>
    </header>
     <div id="body" class="width">
               <h3>History</h3>
                   
           
                  
        
                        <%!
            
            String patientid_var;
            String name_var;
            String report_type_var;
            String test_report_date_var;
            String report_var;
            String find_remark_var;
            
         %>
        
         
            <%
         
            
             String regdno=(String)session.getAttribute("regdno");
              String sql="Select * from report where patient_id='"+regdno+"'";
               
                
              Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     if(rs.next())
                     {
                         
                         patientid_var=rs.getString("patient_id");
                         name_var=rs.getString("name");
                         report_type_var=rs.getString("report_type");
                         test_report_date_var=rs.getString("datee");
                         report_var=rs.getString("report");
                         find_remark_var=rs.getString("find_remark");
                         
                     }
                          
                  %>
                        
                        <form action="" method="post">
           <table border="3" align="center" bordercolor="#8C0209" >
           
            
                                 
                                <tr>
                                     <td>patientid</td>
                                    <td><input type="text" name="patient_id" value="<%=patientid_var%>" onfocus="this.blur()"></td>
                                </tr>
                                <tr>
                                     <td>name</td>
                                    <td><input type="text" name="name" value="<%=name_var%>" onfocus="this.blur()"></td>
    
                            </tr>

                                <tr>
                                    <td>report_type</td>
                                    <td><input type="text" name="report_type" value="<%=report_type_var%>" onfocus="this.blur()"></td>
                                </tr> 
                                 <tr>
                                    <td>test_report_date</td>
                                    <td><input type="text" name="test_report_date" value="<%=test_report_date_var%>" onfocus="this.blur()"></td>
                                </tr> 
                                <tr>
                                    <td>report</td> 
                                    <td> <img src="uploadedfiles/<%=report_var=rs.getString("REPORT")%>"  height="80" width="90" border="0" onmouseover="showtrail('uploadedfiles/<%=rs.getString("REPORT")%>','Title of the Picture Goes Here',310,440)" onmouseout="hidetrail()"/> </td>
                                </tr>
                            
                                    <tr> 
                                        <td>find_remark</td>
                                        <td><input type="text" name="find_remark" value="<%=find_remark_var%>" onfocus="this.blur()"></td>
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