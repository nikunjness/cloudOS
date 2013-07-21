<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adlogin.aspx.cs" Inherits="adlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Untitled Page</title>
<script type="text/javascript" src="login/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="login/vibrate.js"></script>
 <style type="text/css">
     body {
	margin: 0;
	padding: 0;
	color: #5d546e;
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 13px;
	line-height: 1.3em; 
	background-color: #cfbfe8;
	background-image: url(../photos/body.png);
	background-repeat: repeat-x;
	background-position: top;
}
#login
{
	    position:absolute;
        top: 100px;
        left: 100px;
        color:white;
}
#wrapper
{
	height:500px;
	width:1233px;
	position:absolute;
	left:200px;
	top:50px;
	
}
</style>


</head>
<body>
<form id="form1" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
</asp:ScriptManager>
<div id="wrapper">

  
            <div id="login" style="background-color:#3D275E;text-align:center; width: 908px;">


<h3>Login form</h3>


          


<label for="username">Username:</label>

<input type="text" name="username" id="username" /><br /><br />
		
		
<label for="pwd">Password:</label>
<input type="password" name="pwd" id="pwd" /><br /><br />
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="Submit" id="submit_butt" value="Submit" />
<script type="text/javascript">
$(document).ready(function()
{
	$("#submit_butt").click( function()
	{
		
	// configurations for the buzzing effect. Be careful not to make it too annoying!
			var conf = {frequency: 5000,spread: 5,duration: 600};
			var uname=document.getElementById("username").value;
			var pwd=document.getElementById("pwd").value;
			PageMethods.Validate(uname,pwd,success); 
			
			function success(rslt)
            {       
                if(rslt == "success")
                {          
                    window.location = "Admin_home.aspx";                 
                }
                else
                {   
                
                $("#login").vibrate(conf);        
		        if($("#errormsg").text() == "")
		        $("#login").append('<p id="errormsg">Invalid username or password!</p>');	
		        //clear the fields to discourage brute forcing :)
		        $("#username").val("");
		        $("#pwd").val("");
                }
            } 
		});
});
</script>
  

</div>


</div>
                
                
                
                
                
                
                
         
</form>
</body>
</html>
