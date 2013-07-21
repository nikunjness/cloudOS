<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <title>cloudOS-Sign Up</title>
<link href="login/login-box.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="login/jquery.min.js"></script>
<script type="text/javascript" src="login/jquery-ui.min.js"></script>
<script type="text/javascript">
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
    .login-tag
    {
	    font-size:large;
    }
    .style1
    {
        height: 65px;
    }
    .style2
    {
        height: 50px;
    }
    #msg
    {
        width: 280px;
        position:relative;
        top: 182px;
        left: 1px;
        height: 37px;
    }
    #UserAvailability
    {
    	font-family:Forte;
    	font-size:20px; 
    	color:Blue;  	
        padding-left: 22px;
        background-position: left;
        background-repeat: no-repeat;
        height: 33px;
    }
 
    .taken
    {
        background-image: url('photos/taken.png');
    } 
    .available
    {
        background-image: url('photos/available.gif');
    }
    #valerror
    {
    	font-family:Bodoni MT;
    	font-size:20px;   	
        height: 133px;
        width: 370px;
    }
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
            top: 73px;
            left: 670px;
        height: 22px;
    }
    .validator
    {
    	font-family:Forte;
    	font-size:medium;
    	color:Blue;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    
    <ContentTemplate>
			
   
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <a href="signin.aspx" class="aclnk">Login</a>
        <a href="home.aspx" class="hmlnk">Back To Home</a> 
        <div id="login-box">    
        <table style="width:110%; height: 294px; margin-left: 0px; margin-right: 0px;">
            <tr>
                <td colspan="2"><h2>SignUp</h2></td>
            </tr>
            <tr>
                <td>
                    <div class="login-tag">Username</div></td>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="form-login" runat="server" Width="191px" 
                        ontextchanged="Username_Changed" AutoPostBack="True"></asp:TextBox>
                </td>
                </tr>
                <tr>
                    <td>
                        <div class="login-tag">Password</div></td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox2" CssClass="form-login" runat="server" Width="191px" TextMode="Password"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                       <div class="login-tag">Confirm password</div></td>
                    <td>
                        <asp:TextBox ID="TextBox3" CssClass="form-login" runat="server" Width="191px" TextMode="Password"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                         <div class="login-tag">Email Address</div></td>
                    <td>
                        <asp:TextBox ID="TextBox4" CssClass="form-login" runat="server" Width="191px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            ImageUrl="~/login/cooltext618612731.png" Width="130px" 
                            onclick="ImageButton1_Click" />
                        </td>
                    <td class="style1">
                        <asp:ImageButton ID="ImageButton2" runat="server" 
                            ImageUrl="~/login/cooltext618613044.png" Width="130px" 
                            onclick="ImageButton2_Click" />
                        </td>
                </tr>
                </table>
        
<br />


</div>

    

			

<div id="msg">

                        <div runat="server" id="UserAvailability">
                        	
       
    
                        </div>


</div>
</ContentTemplate>
</asp:UpdatePanel>
                        <div id="valerror">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="YOU MUST ENTER USERNAME." 
                                CssClass="validator" ForeColor=""></asp:RequiredFieldValidator><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="PASSWORD MUST NOT BE EMPTY." 
                                CssClass="validator" ForeColor=""></asp:RequiredFieldValidator><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBox4" ErrorMessage="EMAIL REQUIRED" 
                                CssClass="validator" ForeColor=""></asp:RequiredFieldValidator><br>
                         <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="TextBox2" ControlToValidate="TextBox3" 
            ErrorMessage="PASSWORD DO NOT MATCH" CssClass="validator" ForeColor=""></asp:CompareValidator><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="INVALID EMAIL ADDRESS " ControlToValidate="TextBox4" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                CssClass="validator" ForeColor=""></asp:RegularExpressionValidator>
                        
                        </div>


</form>
</body>
</html>

