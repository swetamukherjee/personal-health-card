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
        		<li><a href="patientRegistration.jsp">PATIENT REGISTRATION</a></li>
	     	        <li class="selected"><a href="allocatepatient.jsp">ALLOCATE PATIENT</a></li>
                     
                        <li><a href="doctorlist.jsp">DOCTOR LIST</a></li>
                        
                        
                        
                        <li><a href="maintaindoctordetails.jsp">MAINTAIN DOCTOR DETAILS</a></li>
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
              
  	     
                        <table>
        <tr>
            
            <td>department</td>
            <td>doctor name</td>
         
         
            
           
            
        </tr>
            <%! 
                String department_var;
              String doctor_name_var;
             
               
            %>
            <%  
          String sql="select * from allocatepatient";
          Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
        
         Statement st=con.createStatement();
          ResultSet rs=st.executeQuery(sql);
          while(rs.next())
          {
         
          department_var=rs.getString("DEPARTMENT");
          
          doctor_name_var=rs.getString("DOCTORNAME");
   
  
              
         
         %>
         <tr>
           
             <td> <%=department_var%></td>
           
         <td><%=doctor_name_var%></td>
             
         </tr>
         <%
         }
         %>
    </table>
         
         
        
        
           
                        
           </fieldset>
           
      </form>
        
          </section>
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