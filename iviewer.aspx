<%@ Page Language="C#" AutoEventWireup="true" CodeFile="iviewer.aspx.cs" Inherits="iviewer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            height: 37px;
        }
        .img
        {
        	margin:20px;
        	padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:100%;" bgcolor="#DFDFDF" border="0" cellpadding="0" 
        cellspacing="0">
        <tr>
            <td class="style1">
                <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/photos/window/scanp.png" onclick="ImageButton2_Click" />
            </td>
            <td class="style1">
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    onrowdatabound="GridView1_RowDataBound" AllowPaging="True" 
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                    onpageindexchanging="GridView1_PageIndexChanging" PageSize="3">
                    <RowStyle BackColor="#F7F7DE" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="select" 
                                    Height="150px" ImageUrl='<%# Eval("FullName") %>' Width="150px" />
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("FullName") %>' 
                                    Visible="False"></asp:Literal>
                            </ItemTemplate>
                            <HeaderTemplate>
                                Photos
                            </HeaderTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
            <td align="center">
                <asp:Image ID="Image2" runat="server" Height="500px" Width="700px" 
                    CssClass="img" BackColor="White" />
            </td>
        </tr>
        </table>
       
    </form>
</body>
</html>
