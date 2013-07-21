<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="sitemap.aspx.cs" Inherits="sitemap" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
.member
{
	
	font-family:Angsana New;
	font-size:30px;
}
a
{
	
	text-decoration:none;
}
a:hover
{
	font-weight:bolder;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table style="width: 1123px">
<tr>
<td width="25%">&nbsp;</td> 
<td>
   <h1>
        Website sitemap</h1>
        <h3>
        Pages</h3>
    <ul>
        <li class="member"><a href="home.aspx">Home</a></li>
        <li  class="member"><a href="about.aspx">About Us</a></li>
        <li class="member"><a href="freeacc.aspx">Free Accounts</a></li>
        <li class="member"><a href="freeapps.aspx">Applications</a></li>
        <li class="member"><a href="features.aspx">Features</a></li>
        <li class="member"><a href="screenshot.aspx">ScreenShots</a></li>
        <li class="member"><a href="tryit.aspx">Try CloudOS</a></li>
        
    </ul>
    <h3>
        Important</h3>
    <ul>
        <li class="member"><a href="signup.aspx">Sign Up</a></li>
         <li class="member"><a href="signin.aspx">LogIn</a></li>
        <li class="member"><a href="about.aspx">What is CloudOS?</a></li>
        
    </ul>
    <h3>
        Products</h3>
    <ul>
        <li class="member"><a href="features.aspx">Web Desktop</a></li>
       
    </ul>
    <h3>
        Social</h3>
    <ul>
        <li class="member"><a href="https://twitter.com/#!/CloudOS_WebDesk">Twitter</a></li>
        <li class="member"><a href="http://www.facebook.com/pages/CloudOS-The-Web-Desktop/274987205914590">Facebook Page</a></li>
    </ul>
    <h3>
        Developer</h3>
    <ul>
        <li class="member"><a href="Developer.aspx">Developer Resources</a></li>
    </ul>
    <h3>
        Help</h3>
    <ul>
        <li class="member"><a href="recovery.aspx">Forgot my password</a></li>
        <li class="member"><a href="policy.aspx">Privacy Policy</a></li>
    </ul>
</td>
<td width="25%">&nbsp;</td>
</tr>
</table>
</asp:Content>

