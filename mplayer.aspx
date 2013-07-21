<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mplayer.aspx.cs" Inherits="mplayer" %>
<%@ Register assembly="Media-Player-ASP.NET-Control" namespace="Media_Player_ASP.NET_Control" tagprefix="cc1" %>
<%@ Register assembly="ASPNetAudio.NET3" namespace="ASPNetAudio" tagprefix="ASPNetAudio" %>
<%@ Register assembly="ASPNetMediaGUI.NET3" namespace="ASPNetMediaGUI" tagprefix="ASPNetMediaGUI" %>
<%@ Register assembly="ASPNetVideo.NET3" namespace="ASPNetVideo" tagprefix="ASPNetVideo" %>
<%@ Register assembly="ASPNetFlashVideo.NET3" namespace="ASPNetFlashVideo" tagprefix="ASPNetFlashVideo" %>
<%@ Register assembly="ASPNetFlash.NET3" namespace="ASPNetFlash" tagprefix="ASPNetFlash" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>cloudOS-Music player</title>
<style type="text/css">
table
{
	margin:0px;
	padding:0px;
	top:0px;
	left:0px;
	right:0px;
	left:0px;
}
.lst
{
	text-decoration:none;
	color:Black;
	
}
    .style10
    {
        height: 55px;
    }
    .style11
    {
        width: 132px;
        height: 55px;
    }
    .style12
    {
        height: 55px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
   
         <table bgcolor="#D1D1D1" style="width: 100%; height: 100%;">
             <tr>
                 <td class="style11">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/photos/player/scan.png" onclick="ImageButton1_Click" />
                 </td>
                 <td width="20%" class="style12" align="center" colspan="2">
                     <asp:Image ID="Image1" runat="server" ImageUrl="~/photos/player/mplayer.png" 
                         Height="53px" />
                     OneClickPlayer</td>
             </tr>
             <tr>
                 <td colspan="2" align="center" style="font-weight: bold; color: #FFFFFF">
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         onselectedindexchanged="songchng" Width="100%" CellPadding="4" 
                         GridLines="None" EmptyDataText="No Songs">
                         <RowStyle BackColor="#EFF3FB" ForeColor="White" />
                         <Columns>
                             <asp:TemplateField HeaderText="Songs" SortExpression="Name">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select" 
                                         Text='<%# Eval("Name") %>' CssClass="lst"></asp:LinkButton>
                                     <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("FullName") %>' 
                                         Visible="False"></asp:Literal>
                                 </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                 </EditItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                         <HeaderStyle Font-Bold="True" ForeColor="White" />
                         
                         <EditRowStyle BackColor="#2461BF" />
                         <AlternatingRowStyle BackColor="White" />
                         
                     </asp:GridView>
                 </td>
                 <td runat="server" id="bground" height="500px" width="100%" bgcolor="Black" rowspan="2" align="center">
                <ASPNetFlashVideo:FlashVideo ID="FlashVideo1" runat="server" Height="100%" 
                         Width="100%">
                </ASPNetFlashVideo:FlashVideo>
                     <asp:Image ID="Image2" runat="server" ImageUrl="~/photos/player/dancer.gif" 
                         Visible="False" />
                 </td>
             </tr>
             <tr>
                 <td colspan="2" align="center" style="font-weight: bold; color: #FFFFFF">
                     <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                         onselectedindexchanged="vdochng" Width="100%" CellPadding="4" 
                         GridLines="None" EmptyDataText="No Videos">
                         <RowStyle BackColor="#EFF3FB" />
                         <Columns>
                             <asp:TemplateField HeaderText="Videos">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton2" runat="server" CommandName="select" 
                                         CssClass="lst" Text='<%# Eval("Name") %>'></asp:LinkButton>
                                     <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("FullName") %>' 
                                         Visible="False"></asp:Literal>
                                 </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                 </EditItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                         <HeaderStyle Font-Bold="True" ForeColor="White" />
                         <EditRowStyle BackColor="#2461BF" />
                         <AlternatingRowStyle BackColor="White" />
                     </asp:GridView>
                 </td>
             </tr>
             <tr>
                 <td colspan="2">
                     <ASPNetAudio:Audio ID="Audio1" runat="server" AutoPlay="False">
                     </ASPNetAudio:Audio>
                 </td>
                 <td align="center">
                       <ASPNetMediaGUI:PlayButton ID="PlayButton1" runat="server" ButtonType="Image" 
                    ImageUrl="~/photos/player/play.png">
                </ASPNetMediaGUI:PlayButton>
                <ASPNetMediaGUI:PauseButton ID="PauseButton1" runat="server" ButtonType="Image" 
                    ImageUrl="~/photos/player/pause.png">
                </ASPNetMediaGUI:PauseButton>
                <ASPNetMediaGUI:StopButton ID="StopButton1" runat="server" ButtonType="Image" 
                    ImageUrl="~/photos/player/stop.png">
                </ASPNetMediaGUI:StopButton>
                <ASPNetMediaGUI:MuteButton ID="MuteButton1" runat="server" ButtonType="Image" 
                    ImageUrl="~/photos/player/mute.png">
                </ASPNetMediaGUI:MuteButton>
                <ASPNetMediaGUI:VolumeUpButton ID="VolumeUpButton1" runat="server" ButtonType="Image" 
                    ImageUrl="~/photos/player/inc.png">
                </ASPNetMediaGUI:VolumeUpButton>
                <ASPNetMediaGUI:VolumeDownButton ID="VolumeDownButton1" runat="server" ButtonType="Image" 
                    ImageUrl="~/photos/player/dec.png">
                </ASPNetMediaGUI:VolumeDownButton></td>
             </tr>
         </table>
    </form>
</body>
</html>
