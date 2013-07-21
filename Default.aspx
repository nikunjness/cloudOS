<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
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
    
        .header
        {
        	background-color:#3D275E;
        	padding: 10px 0;
	        height: 26px;            
        }
        .top
        {
        	height: 46px;
	        padding: 30px 20px;
	        margin-bottom: 30px;
	        background: url(photos/header.png) no-repeat;
        	
        }
 #site_title { 
	float: left; 
}

#site_title h1 { 
	margin: 0; 
	padding: 0; 
}

#site_title h1 a { 
	display: block; 
	font-size: 12px; 
	font-family: Georgia, "Times New Roman", Times, serif; 
	width: 217px; 
	height: 34px; 
	padding: 38px 0 0; 
	color: #acacac; 
	text-align: right; 
	background: url(photos/logo.png) no-repeat top left; 
}
    
      
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="header" colspan="3">
                

                </td>
            </tr>
            <tr>
                <td width="150">
                    &nbsp;</td>
                <td class="top">
                <div id="site_title"><h1><a href="Default.aspx">Building The Next Generation</a></h1></div>
                </td>
                <td width="150px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
   <div id="tabs">
  <ul>
    <li><a href="Admin_home.aspx"><span>Home</span></a></li>
    <li><a href="reply.aspx/"><span>User Queries</span></a></li>
    <li><a href="sendmail.aspx"><span>Send Mails</span></a></li>
    <li><a href="logout.aspx"><span>Logout</span></a></li>
   
  </ul>
</div>
                    
                    
                    
                    
                    
                    
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
