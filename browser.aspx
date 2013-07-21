<%@ Page Language="C#" AutoEventWireup="true" CodeFile="browser.aspx.cs" Inherits="browser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
<script type="text/javascript" src="browser.js"> </script> 

</head>
<body onload="f()">

    <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
        <tr bgcolor="#D1D1D1">
            <td width="130px">
                <img id="back" alt="" src="photos/browser/back.png" onclick="back()" />
                <img id="fwd" alt="" src="photos/browser/for.png" onclick="fwd()" />
                <img alt="" src="photos/browser/ref.png" onclick="rfrsh()" />
            </td>
            <td>
                <input id="ad" type="text" style="width:98%" /></td>
            <td width="110px">
                <img alt="" src="photos/browser/go.png" onclick="go()" /><img alt="" 
                    src="photos/browser/home.png" onclick="home()" /></td>
        </tr>
        </table>
        
        <iframe id="myframe" scrolling="auto" src="http://www.bing.com"></iframe> 



</body>
</html>
