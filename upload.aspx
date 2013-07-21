<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>
<%@ Reference VirtualPath="~/fileview.aspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="default/jquery.min.js"></script>
    <script type="text/javascript" src="default/jquery.windows-engine.js"></script> 
    
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
       
                <table bgcolor="#D1D1D1" style="width: 100%; height: 100%;">
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
                        <td align="center">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="center">
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Upload"/>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
           
    
    </div>
    </form>
</body>
</html>
