<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add Prescription</title>
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
              String sql1=" Select * from hospital where regdno='"+regdno_var+"'";
              Statement s=con1.createStatement();
                     ResultSet r=s.executeQuery(sql1);
                     if(r.next())
                     {
                         name=r.getString("hname");
                     }
              
 %> 
<div id="container" class="width">
    <header> 
	<div class="width">
	  <h1><a href="/">CLOUD ENABLED PERSONAL HEALTH CARD<strong></strong></a></h1></br></br></br></br>
		<nav>
    			<ul class="sf-menu dropdown">
        	     <li><a href="patient_queue.jsp">PATIENT QUEUE</a></li>
	     	        <li><a href="patient_details.jsp">PATIENT DETAILS</a></li>
                    <li><a href="add_prescription.jsp">ADD PRESCRIPTION</a></li>
                    <li><a href="patient_history.jsp">PATIENT HISTORY</a></li>
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
                <%!
        String patient_id_var;
   %>
                <h3>Add Prescription</h3>
  	<fieldset>
            <form action="add_prescription" method="get">
                  
            <p><label for="doctor_id">doctor_id:</label>
                    <input type="text" name="doctor_id" id="doctor_id" value="<%=regdno_var%>" onfocus="this.blur()"></p>
            <p><label for="patient_id">patient_id:</label>
                <select name="patient_id">
                              
                              <option>choose patient_id</option>
                              <%
                         
                     String sql="select * from allocatepatient where date_added=(select to_char(sysdate,'dd-MM-yy') from dual)";
              Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
              Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery(sql);
                     while(rs.next())
                     {
                          patient_id_var=rs.getString("patientid");
                         %>
                         <option value="<%=patient_id_var%>"><%=patient_id_var%></option>
                              <%
                        
                               }
                               %>
                            </select> </p>
                    
            <p><label for="observation">Observation:</label>
                    <input type="text" name="observation" id="observation"></p>
            <p><label for="test_recommended">Test_Recommended:</label>
                    <input type="text" name="test_recommended" id="test_recommended"></p>
            <p><label for="medicine">Medicine:</label>
                    <input type="text" name="medicine" id="medicine"></p>
            <p><label for="advice">Advice:</label>
                    <input type="text" name="advice" id="advice"></p>
            
             
             <p><input type="submit" value="Submit" onclick="submitForm()" />
         
</p>
                 <p>&nbsp;</p>
                 </form>
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