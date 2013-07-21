<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="recovery.aspx.cs" Inherits="recovery" Title="CloudOS-Recovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:left">

    <table style="width:100%;">
        <tr>
            <td rowspan="9" width="25%">
                &nbsp;</td>
            <td colspan="2">
<h2 style="text-align:left">cloudOS password recovery</h2>
            </td>
            <td rowspan="9" width="25%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
<div style="text-align:left">Please enter your username or email address in the form 
    and submit it. An email will be sent to your registered email address with a 
    link.<br /> Click on the link or paste it in your web browser to set a new 
    password. </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
<div style="text-align:left">Enter Your UserName Here =&gt;</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="196px"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Please Enter youe Email Or Username"></asp:RequiredFieldValidator></td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/photos/sendbutt_arrow.gif" onclick="ImageButton1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="*=Required." ForeColor="Red"></asp:Label></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    </div>
    </asp:Content>

