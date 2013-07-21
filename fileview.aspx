<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="fileview.aspx.cs" Inherits="fileview" %>
<%@ Reference VirtualPath="~/cloudos.aspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Untitled Page</title>
<script type="text/javascript" src="default/jquery.min.js"></script>
<script type="text/javascript" src="default/jquery.windows-engine.js"></script>
<link type="text/css" rel="stylesheet" href="default/jquery.windows-engine.css"/>
<script type="text/javascript" src="dock/js/jquery.js"></script>
<link href="css/fileview.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/fmanager.js"></script>

<style type="text/css">
body
{
    font-family: Trebuchet MS, Lucida Sans Unicode, Arial, sans-serif;
    margin-left: 0px;
    
}
#Menu
{
    /* The menu container */
    border:ridge 1px black;    /* Border around the entire menu */
    background-color:#dfdfdf; /* White background color of the menu */
    margin: 0px;
    padding: 0px;
    width: 60; /* Width of context menu */            
    display: none;
    position: absolute;
    -moz-box-shadow: 5px 5px 5px #888;
    -webkit-box-shadow: 5px 5px 5px #888;
}
#Menu li
{
    /* Each menu item */
    list-style-type: none;            
    cursor: pointer;
    clear: both;
}
#Menu li div
{
    /* Dynamically created divs */
    cursor: pointer;
}
#Menu li:hover
{         
    background: rgb(155, 205, 255);	
	background: rgba(155, 205, 255, 0.6);    
	border-style: outset;
}       
.link
{
	text-decoration:none;
	font-family:Arial;
	font-size:14px;
    color:Black;
}
.link:hover
{
	cursor:default;
}
.btn
{
	width:80px;
	height:25px;
}
.grid
{
	position:relative;
	margin-top:0px;
	padding-top:0px;
        top: -245px;
        left: 158px;
        width: 85%;
        
}
.style1
{
    height: 36px;
}
.ifrm
{
	background-color:#dfdfdf;
	overflow:visible;
}  

#popup
{
	background-color:#ffffff;
	color: black;           
    display:none;
    width:150px;
    margin:0px;
    padding:0px;
    -moz-box-shadow: 5px 5px 5px #888;
    -webkit-box-shadow: 5px 5px 5px #888;
    position:absolute;
        top: 16px;
        left: 62px;
}
#popup li
{
    /* Each menu item */
    list-style-type: none;            
    cursor: pointer;
    clear: both;
}
#popup li:hover
{         
    background: rgb(134, 153, 173);	
	background: rgba(134, 153, 173, 0.6);    
	
} 
#error
{
	text-align:center;
	background-color:#d1d1d1;
	height:100%;
	width:100%;
}      
</style>

</head>
<body>
<script type="text/javascript" src="fmanager.js"></script>
<form id="form1" runat="server" enctype="multipart/form-data">
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
</asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;padding:0px">
<tr style="background-image: url('photos/top_mid.gif')">
            <td width="160px" class="style1">
            <asp:ImageButton ID="up" runat="server" ImageUrl="~/photos/window/up.png" onclick="up_Click" /> &nbsp;&nbsp; 
            <img alt="" src="photos/window/add.png" onclick="show()" />&nbsp;&nbsp;
            </td>
            <td class="style1">
            <input type="text" id="addressbar" style="width: 90%" readonly="readonly" runat="server"/>
            </td>
</tr>
<tr>
            <td>
            <div id="sidepanel" style="width: 100%; height: 100%;background-color:#dfdfdf">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/photos/icons/hd.png" />
            <br />
            <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/photos/icons/hm.png" onclick="ImageButton14_Click" />
            <br />
            <asp:ImageButton ID="ImageButton13" runat="server" ImageUrl="~/photos/icons/doc.png" onclick="ImageButton15_Click" />
            <br />
            <asp:ImageButton ID="ImageButton20" runat="server" ImageUrl="~/photos/icons/ms.png" onclick="ImageButton16_Click" />
            <br />
            <asp:ImageButton ID="ImageButton21" runat="server" ImageUrl="~/photos/icons/pic.png" onclick="ImageButton17_Click" />
            <br />
            <asp:ImageButton ID="ImageButton22" runat="server" ImageUrl="~/photos/icons/mv.png" onclick="ImageButton18_Click" />
            <br />
            <asp:ImageButton ID="ImageButton23" runat="server" ImageUrl="~/photos/icons/tr.png" onclick="ImageButton19_Click" />
            <br />
            </div>
            </td>
</tr>
</table>
                  
   <asp:GridView ID="GridView1"           
            runat="server" AutoGenerateColumns="False" 
        CellPadding="4" GridLines="None" 
        onselectedindexchanged="selectindex_changed" 
            onrowdatabound="Grd_RowDataBound" EmptyDataText="Empty" 
        HorizontalAlign="Left" CssClass="grid" ForeColor="#333333">
         
                                                   <RowStyle BackColor="#EFF3FB" />
         
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="25px" Width="25px" 
                        ImageUrl='<%# Eval("Icon") %>' />
                </ItemTemplate>
                <FooterTemplate>
                    <table cellpadding="0" cellspacing="0" 
                        style="margin:5px 0px; border:1px solid #A0A0A0;width:100%;height:100%">
                        <tr>
                            <td style="padding: 2px 4px; height: 17px; font-family: Segoe UI; font-style: normal; font-weight: normal; font-size: 9pt; text-decoration: none; background-color: buttonface; color: #102040; background-image: url(mvwres://Microsoft.Web.Design.Client, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a/TemplateHeaderBackground.gif); background-repeat: repeat-x; border-bottom: 1px solid #A0A0A0;">
                                ItemTemplate
                            </td>
                        </tr>
                        <tr style="">
                            <td class="grid" 
                                style="padding:4px;height:50px;vertical-align:top;color:#333333;background-color:#EFF3FB;">
                                <asp:Image ID="Image1" runat="server" Height="25px" 
                                    ImageUrl='<%# Eval("Icon") %>' Width="25px" />
                            </td>
                        </tr>
                    </table>
                </FooterTemplate>
                <ItemStyle Width="20px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" ></asp:TextBox>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                        Text='<%# Eval("Name") %>' CssClass="link"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <table cellpadding="0" cellspacing="0" 
                        style="margin:5px 0px; border:1px solid #A0A0A0;width:100%;height:100%">
                        <tr>
                            <td style="padding: 2px 4px; height: 17px; font-family: Segoe UI; font-style: normal; font-weight: normal; font-size: 9pt; text-decoration: none; background-color: buttonface; color: #102040; background-image: url(mvwres://Microsoft.Web.Design.Client, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a/TemplateHeaderBackground.gif); background-repeat: repeat-x; border-bottom: 1px solid #A0A0A0;">
                                ItemTemplate
                            </td>
                        </tr>
                        <tr style="">
                            <td class="grid" 
                                style="padding:4px;height:50px;vertical-align:top;color:#333333;background-color:#EFF3FB;">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                                    CssClass="link" Text='<%# Eval("Name") %>'></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    <table cellpadding="0" cellspacing="0" 
                        style="margin:5px 0px; border:1px solid #A0A0A0;width:100%;height:100%">
                        <tr>
                            <td style="padding: 2px 4px; height: 17px; font-family: Segoe UI; font-style: normal; font-weight: normal; font-size: 9pt; text-decoration: none; background-color: buttonface; color: #102040; background-image: url(mvwres://Microsoft.Web.Design.Client, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a/TemplateHeaderBackground.gif); background-repeat: repeat-x; border-bottom: 1px solid #A0A0A0;">
                                ItemTemplate
                            </td>
                        </tr>
                        <tr style="">
                            <td class="grid" 
                                style="padding:4px;height:50px;vertical-align:top;color:#333333;background-color:#EFF3FB;">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </FooterTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Size") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
            
                                                   <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                   <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" VerticalAlign="Bottom" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                                                   <EditRowStyle BackColor="#2461BF" />
                                                   <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>

<ul id="Menu">
<li><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/photos/Buttons/dld.png" OnClick="mnu_click" CommandName="Download" /></li>
<li><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/photos/Buttons/cpy.png" OnClick="mnu_click" CommandName="Copy" /></li>
<li><asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/photos/Buttons/pst.png" OnClick="mnu_click" CommandName="Paste"/></li>
<li><asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/photos/Buttons/opn.png" OnClick="mnu_click" CommandName="Open"/></li>
<li><asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/photos/Buttons/rnm.png" OnClick="mnu_click" CommandName="Rename"/></li>
<li><asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/photos/Buttons/dpl.png" OnClick="mnu_click" CommandName="Duplicate"/></li>
<li><asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/photos/Buttons/cmp.png" OnClick="mnu_click" CommandName="Compress"/></li>
<li><asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/photos/Buttons/trs.png" OnClick="mnu_click" CommandName="Trash"/></li>
</ul>
<script type="text/javascript">
         initMenu();
         MenuObj.style.display = 'none';
</script>

<ul id="popup">
<li><span onclick="upload()"><img alt="" src="photos/window/local.png" /></span></li>
<li><asp:ImageButton ID="folder" runat="server" 
        ImageUrl="~/photos/window/folder.png" onclick="folder_Click" /></li>
<li><asp:ImageButton ID="file" runat="server" ImageUrl="~/photos/window/file.png" 
        onclick="file_Click" /></li>
</ul>

<input id="Hidden1" type="hidden" runat="server" />

&nbsp;</form>
</body>
</html>
