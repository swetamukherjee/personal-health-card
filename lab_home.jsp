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
%> 
<div id="container" class="width">

    <header> 
	<div class="width">

	  <h1><a href="/">CLOUD ENABLED PERSONAL HEALTH CARD<strong></strong></a></h1></br></br></br></br>
		<nav>
    	        <ul class="sf-menu dropdown">
                   
                    <li><a href="addtest.jsp">ADD TEST </a></li>
                    <li><a href="testreport.jsp">TEST REPORTS</a></li>
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
                <div class="intro-content">
	
                    <h2>Welcome <%=name%></h2>
                    <p></p>
   	     </div>               
        </div>
                    
	</div>
                    <div id="body" class="width" style=" padding-left: 100px">
        <h1>Here you Can:</h1></br>
	<h5>View patient's prescription</h5></br>	
        <h5>Add Test Reports of patient.</h5></br>
        <h5>View Patient's Test Report History</h5></br>
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