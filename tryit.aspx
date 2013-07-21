<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="tryit.aspx.cs" Inherits="tryit" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
.content
{
   	font-family:Rockwell;
  	font-size:18px;
  	text-align:left;
        width: -30%;
}
.shadow
{
      	box-shadow:0px 0px 10px #54A5F6;
        -webkit-box-shadow0px 0px 10px #54A5F6;
        -moz-box-shadow:0px 0px 10px #54A5F6;
        border-radius:25px;
        -moz-border-radius:25px;
        -webkit-border-radius:25px;           
        margin-left:5%;
        margin-right:5%;
} 
    
     #txt
     {
     	font-family:Harlow Solid Italic;
     	font-size:x-large;
     	font-weight:700;
     	text-align:center;
     }
     #try
     {
     	color:Black;
     	text-decoration:underline;
     	
     }
     #try:hover
     {
     	color:Green;
     	text-decoration:none;
     }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td rowspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td rowspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <div class="shadow">
                
                
                    <table style="width:100%;">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style1">
                            </td>
                            <td align="center">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/photos/main.png" />
                            </td>
                            <td class="style1">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                     <span id="txt">Simply your desktop online.Its true.just&nbsp;<a id="try" href="signin.aspx">try it here.</a></span></td>
                        </tr>
                    </table>
                
                
                </div></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

