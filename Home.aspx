<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GreenValleyAuctionsSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <style>
        .quick {
            font-family: 'Quicksand', sans-serif;
            color: black;
            font-weight: bold;
        }
    </style>
    <br />
    <br />
    <br />
    <br />
    <br />
    
    
    <h1>Select Desired Portal</h1>
    <asp:Table ID="tbleHome" runat="server" HorizontalAlign="Center">
     
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnEmployee" runat="server" Text="Employee Portal"  class="btn btn-primary btn-success text-white shadow-sm quick" OnClick="btnEmployee_Click" />
            </asp:TableCell>
            <asp:TableCell>
                  <asp:Button ID="btnCustomer" runat="server" Text="Customer Portal"  class="btn btn-primary btn-success text-white shadow-sm quick" OnClick="btnCustomer_Click" />
            </asp:TableCell>
        </asp:TableRow>
    
        </asp:Table>
</asp:Content>
