<%@ Page Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="sendmail.aspx.cs" Inherits="sendmail" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style3
        {
            height: 28px;
        }
        .txt
        {
        	font-family:FangSong;
        	font-size:medium;
            color:White;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<table class="txt" style="width:100%;" bgcolor="#6666FF">
        <tr>
                <td>&nbsp;</td>
                <td align="center" colspan="2"><h1>Send Emails</h1></td>
                <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="style3"></td>
                <td class="style3"><asp:Label ID="Label1" runat="server">From:</asp:Label></td>
                <td class="style3"><asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FromValidator1" runat="server" ErrorMessage="Please Enter the Email From." Width="200px" Height="23px" ControlToValidate="txtFrom"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="FromValidator2" runat="server" ErrorMessage="Please Enter a Valid From Email address" ControlToValidate="txtFrom" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                <td class="style3"></td>
        </tr>
        <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
        </tr>
        <tr>
                <td>&nbsp;</td>
                <td><asp:Label ID="Label2" runat="server">To: </asp:Label></td>
                <td><asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ToValidator1" runat="server" ErrorMessage="Please Enter the Email To." Width="200px" Height="23px" ControlToValidate="txtTo"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ToValidator2" runat="server" 
                        ErrorMessage="Please Enter a Valid To Email address" ControlToValidate="txtTo" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                <td>&nbsp;</td>
        </tr>
        <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td><asp:Label ID="Label3" runat="server">Subject</asp:Label></td>
            <td><asp:TextBox ID="txtSubject" runat="server"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td><asp:Label ID="Label4" runat="server">Mail:</asp:Label></td>
            <td> <textarea runat="server" id="txtContent" rows="7" cols="24"></textarea></td>
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td><asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click"></asp:Button>
            <asp:Label ID="lblStatus" runat="server"> </asp:Label></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table> 
  

   

        
</asp:Content>

