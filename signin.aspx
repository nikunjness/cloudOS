<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>cloudOS-Login</title>
    <link href="login/login-box.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="login/jquery.min.js"></script>
<script type="text/javascript" src="login/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>
<script type="text/javascript">


$(document).ready(function() { 
     
       $.blockUI({ css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
        } }); 
 
        setTimeout($.unblockUI, 2000);  
          
   
});
function change()
{
   $.unblockUI();
   var x=document.getElementById("msg");
   x.innerHTML="Loading Dock...";
   $.blockUI({ message:  $("#loading")});
   setTimeout(end, 5000); 
}
function end()
{
   $.unblockUI();
   var x=document.getElementById("msg");
   x.innerHTML="Booting cloudOS...";
   $.blockUI({ message:  $("#loading")});
   setTimeout(redirect, 5000); 
     
}
function redirect()
{
         $.unblockUI();
        window.location = "cloudos.aspx";     
}
var message="Sorry, right-click has been disabled"; 
/////////////////////////////////// 
function clickIE() {if (document.all) {(message);return false;}} 
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) { 
if (e.which==2||e.which==3) {(message);return false;}}} 
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;} 
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;} 
document.oncontextmenu=new Function("return false") 
// --> 

      
</script>
<style type="text/css">
.hmlnk
{
	text-decoration:none;
	font-family:Forte;
	font-size:large;
	position:fixed;
        top: 74px;
        left: 730px;
}
.aclnk
{
	text-decoration:none;
	font-family:Forte;
	font-size:large;
	position:fixed;
        top: 75px;
        left: 547px;
}
#login-box
{
	    background: url(login/login-box-backg.png) no-repeat left top;
	    position:absolute;
        top: 100px;
        left: 377px;
}
body
{
	background:url(photos/page-bg.jpg) repeat-x;
}
.msg
{
	font-family:Californian FB;
	font-size:larger;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <a href="signup.aspx" class="aclnk">Create a new Account</a>
        <a href="home.aspx" class="hmlnk">Back To Home</a>        
        <div id="login-box">



<h2>Login</h2>



<br />

<br />
<div id="loading" style="position: absolute; width: 100%; text-align: center; top: 300px;left: 10px;display:none">
<div id="msg">Preparing Contents</div>
<img src="photos/loading.gif" alt="loading.." />
</div>


<div class="login-box-name" style="margin-top:20px;">Username:</div>
<div class="login-box-field" style="margin-top:20px;"><input id="uname" class="form-login" title="Username" value="" size="30" maxlength="2048" /></div>

<div class="login-box-name">Password:</div><div class="login-box-field"><input id="pwd" type="password" class="form-login" title="Password" value="" size="30" maxlength="2048" /></div>

<br />

<span class="login-box-options"><a href="recovery.aspx" style="margin-left:90px;">Forgot password?</a></span>

<br />

<br />
<img alt="" src="login/login-btn.png"id="butt" width="103" height="42" style="margin-left:90px;" onclick="shakewin()" />
            &nbsp;&nbsp;</div>
        
</div>
<script type="text/javascript">   
function shakewin()
{
    
     var usrname = document.getElementById("uname").value;
     var pswd= document.getElementById("pwd").value;
     // call server side method  
     PageMethods.Validate(usrname,pswd,success);          
     function success(rslt)
     {       
        if(rslt == "success")
        { 
            change();                    
        }
        else
        {   
        $("#login-box").effect("shake",{ times:3 }, 500);
        }
     }
     
     
}

 
  </script>
        
        </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
