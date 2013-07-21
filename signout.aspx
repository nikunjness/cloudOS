<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signout.aspx.cs" Inherits="signout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>CloudOS-SignOut</title>
<script type="text/javascript" src="Header/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
     
       $.blockUI({ message: $('#logout'), overlayCSS: { backgroundColor: '#fff',opacity: .4  } }); 
            
   
 
         
          
   
});
 // speed in milliseconds

var scrollSpeed = 70;

// set the default position

var current = 0;


// set the direction

var direction = 'h';


function bgscroll()
{
// 1 pixel row at a time

current -= 1;
 
// move the background with backgrond-position css properties

$('body.clouds').css("backgroundPosition", (direction == 'h') ? current+"px 0" : "0 " + current+"px");
   
}


//Calls the scrolling function repeatedly

setInterval("bgscroll()", scrollSpeed);
</script>

<style type="text/css">
.clouds {background:#9BCDFF url(Header/bg_clouds.png) repeat-x 0 bottom; width:300px; height:150px;}
table
{
	font-family:Book Antiqua;
	font-size:larger;
	text-align:center;
	color:Black;
}
a
{
	
	text-decoration:none;
}
a:hover
{
	font-weight:bolder;
	color:Green;
}


</style>
</head>
<body class="clouds">
    <form id="form1" runat="server">
    <div id="logout">
    
    
        <table style="width:100%;">
            <tr>
                <td>
                    You are successfully Logged Out.</td>
            </tr>
            <tr>
                <td>
                    <a href="signin.aspx">Click here for login again.</a></td>
            </tr>
            <tr>
                <td>
                   <a href="home.aspx">Click here to visit our Home Page.</a> </td>
            </tr>
        </table>
    
    
    </div>
    </form>
</body>
</html>
