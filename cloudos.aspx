<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cloudos.aspx.cs" Inherits="cloudos" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CloudOS-The Web Operating System</title>

<script type="text/javascript" src="default/jquery.min.js"></script>
<script type="text/javascript" src="default/jquery.windows-engine.js"></script>
<link type="text/css" rel="stylesheet" href="default/jquery.windows-engine.css"/>
<script type="text/javascript" src="dock/js/jquery.js"></script>
<script type="text/javascript" src="dock/js/interface.js"></script>
<script type="text/javascript" src="js/clock.js"></script>

<!--[if lt IE 7]>
    <style type="text/css">        .dock img { behavior: url(iepngfix.htc) }    </style><![endif]--><link href="dock/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/fmanager.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>
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
function block()
{
    
    $.blockUI({ message:null});
    setTimeout(redirect, 5000); 
    
}
function redirect()
{
         $.unblockUI();
        window.location="Signout.aspx";
}
</script>


<style type="text/css">
html
{ 
        background: url(photos/bg1.jpg) no-repeat center center fixed; 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover; 
} 
#addressbar
{
   	width:98%;
} 
.style1
{
    width: 35px;
}
.ifrm
{
	background-color:#dfdfdf;
	overflow:visible;
	margin:0px;
	padding:0px;
} 

#error
{
	text-align:center;
	background-color:#d1d1d1;
	height:100%;
	width:100%;
}
#uppanel
{
	position:fixed;
	top:0px;
	left:0px;
	width:100%;
	background-color:white;
    opacity:0.4;
    filter:alpha(opacity=40); /* For IE8 and earlier */
	height:35px;

} 
#clock
{
	position:fixed;
	right:0px;
	top:0px;
        height: 30px;
}
</style>

</head>
<body>




    <form name="frm" id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div id="uppanel">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/photos/sd.png" 
            Height="30px" onclick="ImageButton1_Click" Width="30px" />
<table id="clock">
<td bgcolor="black" style="font-weight:bolder;color:White">Welcome,<asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
<td bgcolor="black">
<img alt="" src="photos/clock/dg8.gif" name="hr1" />
<img alt="" src="photos/clock/dg8.gif" name="hr2" />
<img alt="" src="photos/clock/dgc.gif" />
<img alt="" src="photos/clock/dg8.gif" name="mn1" />
<img alt="" src="photos/clock/dg8.gif" name="mn2" />
<img alt="" src="photos/clock/dgc.gif" />
<img alt="" src="photos/clock/dg8.gif" name="se1" />
<img alt="" src="photos/clock/dg8.gif" name="se2" />
<img alt="" src="photos/clock/dgpm.gif" name="ampm" />
</td>
</table>
</div>
    

 <div class="dock" id="dock2">

  <div class="dock-container2">
  <a class="dock-item2" href="#" id="filemanager"><span>File Manager</span><img alt="" src="dock/web.png" alt="File Manager" /></a> 

  <a class="dock-item2" href="#" id="texteditor"><span>Text Editor</span><img alt="" src="dock/texteditor.png" alt="Text Editor" /></a> 

  <a class="dock-item2" href="#" id="imageviewer"><span>Image Viewer</span><img alt="" src="dock/editor.png" alt="Image Viewer" /></a> 
  
  <a class="dock-item2" href="#" id="ieditor"><span>Image Editor</span><img alt="" src="dock/pixlr.png" alt="Image Editor" /></a> 

  <a class="dock-item2" href="#" id="music"><span>Music Player</span><img alt="" src="dock/mplayer.png" alt="Music Player" /></a>   

  <a class="dock-item2" href="#" id="browser"><span>Web Browser</span><img alt="" src="dock/webbrowser.png" alt="web Browser" /></a> 
 
  

  </div>

</div>





<!--dock menu JS options -->

<script type="text/javascript">

	

	$(document).ready(

		function()

		{

			$('#dock2').Fisheye(

				{

					maxWidth: 60,

					items: 'a',

					itemsText: 'span',

					container: '.dock-container2',

					itemWidth: 40,

					proximity: 80,

					alignment : 'left',

					valign: 'bottom',

					halign : 'center'

				}

			)

		}

	);



</script>
    </form>

   

</body>





</html>
