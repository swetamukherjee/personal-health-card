<%@page import="java.io.File"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ADD TEST REPORTS</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />

<script type="text/javascript" src="./jsFileUpload/jquery.js"></script>
<script  type="text/javascript" src="./jsFileUpload/vendor/jquery.ui.widget.js"></script>
<script  type="text/javascript" src="./jsFileUpload/jquery.iframe-transport.js"></script>
<script  type="text/javascript" src="./jsFileUpload/jquery.fileupload.js"></script>

<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />

<script>
$(function () {    
	var jqXHR = $('#fileField').fileupload({
        dataType: 'json',
        url: './ImageUploadServlet', 
		maxFileSize: 5000000,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,		
        progress:function(e, data) {
            var pec=parseInt(data.loaded / data.total * 100, 10);
            if(pec==99)   /*  for Firefox: as Progress stops at 99% */
                pec=pec+1;
         	$('#myfileL').html('Upload Status :  '+ pec +' %');
        },
        done: function (e, data) {
           $.each(data.result, function (key, value) {
				if(key=="name")
				{   
					$("#myfile").val(value); // set the file name as hidden field value					
					$("#myfileL").html("<img src='./uploadedfiles/"+value+"' width='100' height='100' />");				
				}
				if(key=="error")
				{
					$("#myfileL").html(value);
				}
            });
        }
    });
});
</script>
<script language="javascript" type="text/javascript">
        var hexvalues
= Array("A", "B", "C", "D", "E", "F", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9");

        function flashtext() {

            var colour = '#';
            for (var counter = 1; counter <= 6; counter++) {
                var hexvalue = hexvalues[Math.floor(hexvalues.length * Math.random())];

                colour = colour + hexvalue;

            }
            document.getElementById("flashingtext").style.color = colour;
        }

        setInterval("flashtext()", 800);
    </script>
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
                            
                            <li class="selected"><a href="addtest.jsp">ADD TEST REPORTS</a></li>
                            <li><a href="testreport.jsp">VIEW TEST REPORT</a></li>
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
            
    <div id="body" class="width" style="padding-left:100px"> 
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
        <h4>Add Test Report</h4>
	   <fieldset>
                <%
            //String uploadPath = getServletContext().getRealPath("/").replace("\\", "/")+folderName+"/";               

            File file1= new File("");
            System.out.println("path:"+file1.getAbsolutePath());
            %>
             <form action="addtest" method="get" enctype="multipart/form-data" name="form1">
                 <p><label for="pid">Patient ID:</label>
                    <input name="pid" type="text" id="pid" size="30"></p>
                 <p><label for="name">Name:</label>
                    <input name="name" type="text" id="name" size="30"></p>
                 <p><label for="report_type">Report Type :</label>
                     <select name="report_type" id="report_type">
                            <option>select</option>
                            <option>Blood Sugar</option>
                            <option>DC</option>
                            <option>Malaria</option>
                            <option>MRI</option>
                            <option>Ultra Sound</option>
  	             </select></p>
                 <p><label for="date">Date:</label>
                    <input name="date" type="text" id="date" size="30"></p>
                 <p><label for="">Report:</label>
                    <input id="fileField" type="file" name="files[]"/>
                    <input type="hidden" name="myfile" id="myfile"/>
                    <label id="myfileL"></label></p><br> 
                 <p><label for="remark">Finding/Remark:</label>
                    <textarea name="remark" id="remark" cols="45" rows="5"></textarea></p>
                 <p style="padding-left:200px">
                   <input class="formbutton" type="submit" name="button" id="button" value="Upload"/>
    	        </p>
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