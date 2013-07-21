<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="sig.aspx.cs" Inherits="signup" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
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
/*.grid
{
	position:relative;
	margin-top:0px;
	padding-top:0px;
        top: -135px;
        left: 239px;
        width: 85%;
        
}*/
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
#sidepanel li
{
	list-style-type: none;            
    cursor: pointer;
    clear: both;
}      

    


    

    .style1
    {
        height: 72px;
    }

    


    

</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  

   <script type="text/javascript" src="fmanager.js"></script>

<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
</asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
</asp:UpdatePanel>
    <table style="width: 100%;">
        <tr>
            <td width="50px" class="style1">
           
   
            <asp:ImageButton ID="up" runat="server" ImageUrl="~/photos/window/up.png" onclick="up_Click" /> 
                &nbsp;&nbsp; 
            <img alt="" src="photos/window/add.png" onclick="show()" />&nbsp;&nbsp;</td>
           
            <td class="style1">
           
   
            <input type="text" id="addressbar" style="width: 90%" readonly="readonly" runat="server"/></td>
           
            </tr>
            <tr>
    
            <td class="style3">
               
           
            <ul id="sidepanel">
            <li><asp:Image ID="Image2" runat="server" ImageUrl="~/photos/icons/hd.png" /></li>
            <li>         
            <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/photos/icons/hm.png" onclick="ImageButton14_Click" /></li>
            <li>
            <asp:ImageButton ID="ImageButton13" runat="server" ImageUrl="~/photos/icons/doc.png" onclick="ImageButton15_Click" /></li>
            <li>
            <asp:ImageButton ID="ImageButton20" runat="server" ImageUrl="~/photos/icons/ms.png" onclick="ImageButton16_Click" /></li>
            <li>
            <asp:ImageButton ID="ImageButton21" runat="server" ImageUrl="~/photos/icons/pic.png" onclick="ImageButton17_Click" /></li>
            <li>
            <asp:ImageButton ID="ImageButton22" runat="server" ImageUrl="~/photos/icons/mv.png" onclick="ImageButton18_Click" />
            </li><li>
            <asp:ImageButton ID="ImageButton23" runat="server" ImageUrl="~/photos/icons/tr.png" onclick="ImageButton19_Click" />
            </li>
            </ul>




            </td>
            <td class="style2">
                <asp:Panel ID="Panel1" runat="server" Height="100%" Width="100%">
               
                                  
   <asp:GridView ID="GridView1"           
            runat="server" AutoGenerateColumns="False" 
        CellPadding="4" GridLines="None" 
        onselectedindexchanged="selectindex_changed" 
            onrowdatabound="Grd_RowDataBound" EmptyDataText="Empty" 
        HorizontalAlign="Left" CssClass="grid" ForeColor="#333333" Width="100%" Height="100%">
         
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
     </asp:Panel>
              
            </td>
        </tr>
        </table>

<ul id="Menu">
<li><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/photos/Buttons/dld.png" OnClick="mnu_click" CommandName="Download" /></li>
<li><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/photos/Buttons/cpy.png" OnClick="mnu_click" CommandName="Copy" /></li>
<li><asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/photos/Buttons/pst.png" OnClick="mnu_click" CommandName="Paste"/></li>
<li><asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/photos/Buttons/opn.png" OnClick="mnu_click" CommandName="Open"/></li>
<li><asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/photos/Buttons/info.png" OnClick="mnu_click" CommandName="Info"/></li>
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


   
    
   
   
</asp:Content>

