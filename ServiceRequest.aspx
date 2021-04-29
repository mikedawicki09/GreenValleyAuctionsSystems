<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="ServiceRequest.aspx.cs" Inherits="GreenValleyAuctionsSystem.ServiceRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <br />
    <br />
    <br />
    <h1>Service Request</h1>
    <section style="background-color:#f1f7f8">
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
       
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblServiceType" runat="server" Text="Service Type: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlServiceType" runat="server" AutoPostBack="true" Width="175px" CssClass="form form-control input-sm">
                    <asp:ListItem Text="Select a Service Type" Value=""></asp:ListItem>
                    <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                    <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                     <asp:ListItem Text="Appraisal" Value="Appraisal"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblRequestDescription" runat="server" Text="Request Description: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtRequestDescription" runat="server" textmode="MultiLine" CssClass="form form-control input-sm"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDeadlineDate" runat="server" Text="Deadline Date: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDeadlineDate" runat="server" TextMode="Date" CssClass="form form-control input-sm"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Request"  CssClass="btn btn-success text-white" OnClick="btnSubmit_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        </section>
    <footer class="sticky-bottom"> </footer>
</asp:Content>

