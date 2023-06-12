<%@page import="java.sql.*"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cloud Enabled Personal Health Card</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<%
    String name=(String)session.getAttribute("lname");
    String REGDNO=(String)session.getAttribute("REGDNO");
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
       <div id="body" class="width">
           <form method="post" action="test_report_details.jsp">
                <table border="0" align="center">
                    <tr>
                        
                        <td>
                          <p> 
                            <select name="pid">
                              
                              <option>choose patient id</option>
                              <%
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","citzen","citzen");
                    Statement st=con.createStatement();
                    String sql="select * from report";
                    ResultSet rs=st.executeQuery(sql);
                    while(rs.next())
                    {
                        
                        String pid1=rs.getString("patient_id");
                        %>
                              <option value="<%=pid1%>"><%=pid1%></option>
                              <%
                        
                                }
                               %>
                            </select>
                            </p>
                          <p>
                            <input class="formbutton" value="view test report" type="submit" id="submit" />
                          </p>
                          <p>&nbsp;</p>
                          <p>&nbsp;</p>
                          <p>&nbsp; </p></td>
                    </tr>
                    
                </table>
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