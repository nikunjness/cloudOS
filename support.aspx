<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="support.aspx.cs" Inherits="support" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td rowspan="14" width="20%">
                &nbsp;</td>
            <td colspan="2">
               <h2 style="text-align:left">Support</h2></td>
            <td rowspan="14" width="20%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align=left 
                style="font-family: 'Book Antiqua'; font-size: large; font-weight: bold">
                Use this form to leave feedback, ideas, suggestions and bug reports.</td>
        </tr>
        <tr>
            <td colspan="2" align=left>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <b>Type</b></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Suggestion</asp:ListItem>
                    <asp:ListItem>Praise</asp:ListItem>
                    <asp:ListItem>Issue</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <b>Subject</b></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="181px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" 
                    ErrorMessage="Please Eneter Subject for your query" Font-Names="Book Antiqua" 
                    ForeColor="#33CC33"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <b>Email</b></td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="181px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="You must enter your Email Id" 
                    Font-Names="Book Antiqua" ForeColor="#33CC33"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="Please Enter Valid Email Id" 
                    Font-Names="Book Antiqua" ForeColor="#33CC33" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <b>Message</b></td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" EnableTheming="True" Height="124px" 
                    TextMode="MultiLine" Width="420px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Please Enter Your message here." 
                    Font-Names="Book Antiqua" ForeColor="#33CC33"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Send" onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
</asp:Content>

