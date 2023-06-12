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
<%! 
 String name;
 %>
    <%
    String regdno_var=(String)session.getAttribute("regdno");
    Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
             String sql1="Select * from hospital where regdno='"+regdno_var+"'";
             Statement st1=con1.createStatement();
             ResultSet rs1=st1.executeQuery(sql1);
             if(rs1.next())
             {
                 name=rs1.getString("hname");
             }
                     
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
               <h3>Allocate Patient</h3>
  	      <fieldset>
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
                 <form name="f1" method="post" action="allocatepatient1.jsp" onSubmit="return formValidation();">
                        <p><label for="pid">Patient ID</label><input type="text" id="pid" name="pid" value=""/>
                        <%
                         String stat1=request.getParameter("stat1");
                         if(stat1!=null)
                         {
                        %>                     
                         <b style="color:blue"> <%=stat1%> </b>
                        <%
                        }
                        %>
                        </p>
                        <p><input name="submit" class="formbutton" value="View complain" type="submit" id="submit"/></p>
                 </form>
                        <table>
        <tr>
            <td>patientid</td>
            <td>complain</td>
            <td>department</td>
            <td>doctorid</td>
            <td>doctorname</td>
            <td>time</td>
            <td>date_added</td>
            
        </tr>
            <%! String patientid_var;
                String complain_var;
                String department_var;
                String doctorid_var;
                String doctorname_var;
                String time_var;
                String date_added_var;
               
            %>
            <%  
          String sql="select * from allocatepatient";
          Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
        
         Statement st=con.createStatement();
          ResultSet rs=st.executeQuery(sql);
          while(rs.next())
          {
          patientid_var=rs.getString("PATIENTID");
          complain_var=rs.getString("COMPLAIN");
          department_var=rs.getString("DEPARTMENT");
          doctorid_var=rs.getString("DOCTORID");
          doctorname_var=rs.getString("DOCTORNAME");
          time_var=rs.getString("TIME");
          date_added_var =rs.getString("DATE_ADDED");
              
         
         %>
         <tr>
             <td> <%=patientid_var%></td>
             <td> <%=complain_var%></td>
             <td> <%=department_var%></td>
             <td> <%=doctorid_var%></td>
             <td><%=doctorname_var%></td>
             <td> <%=time_var%></td>
             <td> <%=date_added_var%></td>
         </tr>
         <%
         }
         %>
    </table>
         
         
        
        
           
                        
           </fieldset>
    

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