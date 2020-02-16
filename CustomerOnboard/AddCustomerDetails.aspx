<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddCustomerDetails.aspx.cs" Inherits="CustomerOnboard.AddCustomerDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <table class="auto-style1">
    <tr>
        <td style="width: 284px">
            Username</td>
        <td>
            <asp:TextBox ID="txtHospital" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 284px">
            Address</td>
        <td>
            <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 284px; text-align: center;">
            <asp:Button ID="btnSubmit" runat="server" Font-Names="Tahoma" Font-Size="Small" Text="Submit" OnClick="btnSubmit_Click" />
        </td>
        <td>
            <asp:Button ID="btnCancel" runat="server" Font-Names="Tahoma" Font-Size="Small" OnClick="btnCancel_Click" Text="Cancel" />
        </td>
    </tr>
    <tr>
        <td style="width: 284px; height: 23px">
            <asp:Label ID="lblMessage" runat="server" Font-Names="Tahoma" Font-Size="Small"></asp:Label>
        </td>
        <td style="height: 23px"></td>
    </tr>
</table>


</asp:Content>
