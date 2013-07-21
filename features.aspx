<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="features.aspx.cs" Inherits="features" Title="CloudOS-Features" %>

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
      	box-shadow:0px 0px 10px #000;
        -webkit-box-shadow0px 0px 10px #000;
        -moz-box-shadow:0px 0px 10px #000;
        border-radius:25px;
        -moz-border-radius:25px;
        -webkit-border-radius:25px;           
        background-color:#9BCDFF;
        margin-left:5%;
        margin-right:5%;
} 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div><br /><br /><br /><br />
        <div class="shadow">

    <table style="width:100%">
        <tr>
            
            <td class="title" colspan="2">
                
                &nbsp;</td>
            <td class="title" colspan="2">
                
                &nbsp;</td>
        </tr>
        <tr>
            
            <td class="title" colspan="2">
                
                &nbsp;</td>
            <td class="title" colspan="2">
                
                &nbsp;</td>
        </tr>
        <tr>
            
            <td class="title" colspan="2">
                
                Web Desktop</td>
            <td class="title" colspan="2">
                
                Global File access</td>
        </tr>
        <tr>
            <td width="100px">                
                <asp:Image ID="Image2" runat="server" ImageUrl="~/photos/deskTop.png" />
            </td>
            <td class="content" rowspan="2" width="350px">                
                cloudOS provides you a set of applications so that you can use it as a global 
                desktop.You can see our applications page to get more information about our 
                applications.</td>
            <td width="100px">                
                <asp:Image ID="Image3" runat="server" Height="64px" 
                    ImageUrl="~/photos/str.png" Width="64px" />
            </td>
            <td class="content" rowspan="2" width="350px">                
                You can access your files globally from anywhere anytime.No need to carry and 
                care for storage devices with you,</td>
        </tr>
        <tr>
            <td class="content" width="100px">                
                &nbsp;</td>
            <td class="content" width="100px">                
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="title">
                &nbsp;</td>
            <td colspan="2" class="title">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="title">
                &nbsp;</td>
            <td colspan="2" class="title">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="title">
                &nbsp;
                No Plugins Required</td>
            <td colspan="2" class="title">
                Web Storage</td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image4" runat="server" Height="64px" 
                    ImageUrl="~/photos/plugin.png" Width="64px" />
            </td>
            <td rowspan="2" class="content">
                No more plugins to install and wait for the access.We know the value for the 
                time so we are here to provide you a faster access.</td>
            <td>
                <asp:Image ID="Image5" runat="server" Height="64px" 
                    ImageUrl="~/photos/storage.png" Width="64px" />
                                     </td>
            <td rowspan="2" class="content">
                An online personal drive to store all you love.Just upload and let us manage all 
                about it.</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="title">
                &nbsp; Applications</td>
            <td colspan="2" class="title">
                Free Accounts</td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image6" runat="server" Height="64px" 
                    ImageUrl="~/photos/apps.png" Width="64px" />
            </td>
            <td rowspan="2" class="content">
                A whole designed set of applications that let you manage your files,photos,music 
                and all other things on web.</td>
            <td>
                <asp:Image ID="Image1" runat="server" Height="64px" 
                    ImageUrl="~/photos/free.png" Width="99px" />
            </td>
            <td rowspan="2" class="content">
                We dont cost a penny for your cloudOS account.Just provide some detail and 
                experience the whole world of cloud computing.</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        </table>
</div><br /><br /><br /><br />
</div>

</asp:Content>

