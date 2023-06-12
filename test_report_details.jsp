<%@page import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REPORT LIST</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<script src="js/mouseover_popup.js" language="JavaScript" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<%
    String name=(String)session.getAttribute("lname");
    String DREGDNO=(String)session.getAttribute("REGDNO");
%>  
<div id="container" class="width">
    <header> 
	<div class="width">
	  <h1><a href="/">CLOUD ENABLED PERSONAL HEALTH CARD<strong></strong></a></h1></br></br></br></br>
		<nav>
    			<ul class="sf-menu dropdown">
		
                    <li><a href="addtest.jsp">ADD TEST REPORTS</a></li>
                    <li class="selected"><a href="testreport.jsp">VIEW TEST REPORTS</a></li>                   

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
    <%!
            String pid;
            String NAME;
            String REPORT_TYPE;
            String TEST_REPORT_DATE;
            String REPORT;
            String FINDING;
            
          
            %>
            <%
            pid=request.getParameter("pid");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from REPORT where patient_id='"+pid+"'");
            %>
        <div id="body" class="width" >
            <div style="display: none; position: absolute; z-index: 110; left: 400; top: 100; width: 15; height: 15" id="preview_div"></div>

            <form action="" method="post">
                <table cellpadding="60px" border="3" align="center" bordercolor="#8C0209" style="border: 1px solid #999999" >          
            <tr>
                <th><b>NAME</b></th>
                <th><b>REPORT_TYPE</b></th>
                <th><b>TEST_REPORT_DATE</b></th>
                   <th><b>REPORT</b></th>
                    <th><b>FINDING</b></th>
                    
             </tr>  
            
           <% 
            while(rs.next())
             {
                 %>
                 <tr style=" border-top: 1px solid #999999">
                        <td><%=NAME=rs.getString("NAME")%></td>
                        <td><%=REPORT_TYPE=rs.getString("REPORT_TYPE")%> </td><td><%=TEST_REPORT_DATE=rs.getString("DATEE")%></td>  
                         
                        <td> <img src="uploadedfiles/<%=REPORT=rs.getString("REPORT")%>"  height="80" width="90" border="0" onmouseover="showtrail('uploadedfiles/<%=rs.getString("REPORT")%>','Title of the Picture Goes Here',310,440)" onmouseout="hidetrail()"></img> </td>

                        <td> <%=FINDING=rs.getString("FIND_REMARK")%></td> 
                 </tr>              
           <%    
             }   
           %>       
         </table><br>        
      </form>
        
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