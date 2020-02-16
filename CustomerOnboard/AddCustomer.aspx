<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="CustomerOnboard.AddCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table class="auto-style1">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="Firstname"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="Lastname"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="Username"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="Password"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnSubmit" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="Submit" OnClick="btnSubmit_Click" />
        </td>
        <td>
            <asp:Button ID="btnCancel" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="Cancel" OnClick="btnCancel_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
