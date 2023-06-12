<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        	     <li><a href="patientRegistration.jsp">PATIENT REGISTRATION</a></li>
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
                <h3>Allocate Patient</h3>
  	<fieldset>
            
             <%!
            String pid;
            String complain;
            
            %>
            <%
                pid=request.getParameter("pid"); 
                Class.forName("oracle.jdbc.driver.OracleDriver");
                 Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
                 String ss="select * from patient where regdno='"+pid+"'";
                 Statement stt=conn.createStatement();
                 ResultSet rss=stt.executeQuery(ss);
                 if (rss.next())
                 {
                     pid=rss.getString("regdno");
                     complain=rss.getString("complain");
                     
                 }
             %>  
             
             <form name="f1" method="post" action="" onSubmit="return formValidation();">
                        <p><label for="pid">Patient ID</label>
                            <input type="text" id="pid" name="pid" value="<%=pid%>" onfocus="this.blur()"/>
                        </p>  
                        <p><label for="complain">Complain</label>
                            <textarea name="complain"><%=complain%></textarea></p> 
               
                
<%!
String x1;
String x2;
%>

<%
 String st=request.getParameter("s1");
 String st1=request.getParameter("s2");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
Statement stmt2=con.createStatement();
ResultSet rs=stmt.executeQuery("select distinct SPECIALIZATION from DOCTOR");
%> 
<p><label for="name">Department:</label>
                   <select name="s1" onChange="document.f1.submit()">
                   <option>SELECT </option>
<%
  while(rs.next())
   {
    String x=rs.getString("SPECIALIZATION");
   %>
<option <% if(st !=null && st.equals(x)) 
          out.println("selected"); %>
><%=x%></option>
<%
   }
   %>
</select>
 </p>
 <p><label for="doctorid">Doctor id:</label>
                    <select name="s2" onChange="document.f1.submit()">
              <option>Select </option>
  <%
     if(st1 !=null)
       {
   ResultSet rs1=stmt1.executeQuery("select * from DOCTOR where SPECIALIZATION='"+st+"'");
  while(rs1.next())
   {
   //String x1=rs1.getString("DREGDNO");
       x1=rs1.getString("REGDNO");
   %>
  <option <% if(st1 !=null && st1.equals(x1)) 
          out.println("selected"); %>
><%=x1%></option>
 <%
    }//end of while
   } //end of if
 %>
</select>

</p>


<p><label for="name">Doctor Name:</label>
                    <select name="s3">
              <option>Select </option>
  <%
     if(st1 !=null)
       {
   ResultSet rs2=stmt2.executeQuery("select * from DOCTOR where REGDNO='"+st1+"'");
  while(rs2.next())
   {
   //String x1=rs1.getString("DREGDNO");
       x2=rs2.getString("FNAME");
   %>
  <option><%= x2 %></option>
 <%
    }//end of while
   } //end of if
 %>
</select>

</p>
          <p><label for="time">Time:</label>
                    <input type="text" name="time" id="time"></p>

		
                 <p>
                 <p><input type="button" value="Allocate" onclick="submitForm()" />

<script>
	function submitForm()
	{		
		document.f1.action='allocatepatient1';
		document.f1.submit();		
	}
</script>
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