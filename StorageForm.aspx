<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="StorageForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.StorageForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Table ID="tblStorageForm" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHeader" runat="server" Text="Customer Storage Form" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomerName" runat="server" Text="Select a Customer: " Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList 
                    ID="ddlCustomerList" 
                    runat="server" 
                    DataSourceID="srcCustomers" 
                    DataTextField="Customer Name" 
                    OnSelectedIndexChanged="ddlCustomerList_SelectedIndexChanged" 
                    AutoPostBack="true" 
                    AppendDataBoundItems="true" Width="200px"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStorageArea" runat="server" Text="Select a Storage Area: " Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlStorageArea" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlStorageArea_SelectedIndexChanged">
                    <asp:ListItem Text="---" Value="---"></asp:ListItem>
                    <asp:ListItem Text="Gallery 3 Rows" Value="Gallery 3 Rows"></asp:ListItem>
                    <asp:ListItem Text="Warehouse R1" Value="Warehouse R1"></asp:ListItem>
                    <asp:ListItem Text="Warehouse R2" Value="Warehouse R2"></asp:ListItem>
                    <asp:ListItem Text="Warehouse R3" Value="Warehouse R3"></asp:ListItem>
                    <asp:ListItem Text="Warehouse R4" Value="Warehouse R4"></asp:ListItem>
                    <asp:ListItem Text="Warehouse R5" Value="Warehouse R5"></asp:ListItem>
                    <asp:ListItem Text="Warehouse L1" Value="Warehouse L1"></asp:ListItem>
                    <asp:ListItem Text="Warehouse L2" Value="Warehouse L2"></asp:ListItem>
                    <asp:ListItem Text="Warehouse L3" Value="Warehouse L3"></asp:ListItem>
                    <asp:ListItem Text="Warehouse L4" Value="Warehouse L4"></asp:ListItem>
                    <asp:ListItem Text="Warehouse L5" Value="Warehouse L5"></asp:ListItem>
                    <asp:ListItem Text="Trailer 1, Nose" Value="Trailer 1, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 1, Middle" Value="Trailer 1, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 1, Doors" Value="Trailer 1, Doors"></asp:ListItem>
                    <asp:ListItem Text="Trailer 2, Nose" Value="Trailer 2, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 2, Middle" Value="Trailer 2, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 2, Doors" Value="Trailer 2, Doors"></asp:ListItem>
                    <asp:ListItem Text="Trailer 3, Nose" Value="Trailer 3, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 3, Middle" Value="Trailer 3, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 3, Doors" Value="Trailer 3, Doors"></asp:ListItem>
                    <asp:ListItem Text="Trailer 4, Nose" Value="Trailer 4, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 4, Middle" Value="Trailer 4, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 4, Doors" Value="Trailer 4, Doors"></asp:ListItem>
                    <asp:ListItem Text="Trailer 5, Nose" Value="Trailer 5, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 5, Middle" Value="Trailer 5, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 5, Doors" Value="Trailer 5, Doors"></asp:ListItem>
                    <asp:ListItem Text="Trailer 6, Nose" Value="Trailer 6, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 6, Middle" Value="Trailer 6, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 6, Doors" Value="Trailer 6, Doors"></asp:ListItem>
                    <asp:ListItem Text="Trailer 7, Nose" Value="Trailer 7, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 7, Middle" Value="Trailer 7, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 7, Doors" Value="Trailer 7, Doors"></asp:ListItem>
                    <asp:ListItem Text="Trailer 8, Nose" Value="Trailer 8, Nose"></asp:ListItem>
                    <asp:ListItem Text="Trailer 8, Middle" Value="Trailer 8, Middle"></asp:ListItem>
                    <asp:ListItem Text="Trailer 8, Doors" Value="Trailer 8, Doors"></asp:ListItem>
                </asp:DropDownList>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNumberItems" runat="server" Text="Number of Items in Lot: " Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtNumberItems" runat="server" TextMode="Number" Width="200px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Storage Allocation" OnClick="btnSubmit_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>


    <asp:SqlDataSource 
        ID="srcCustomers" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:Lab4 %>" 
        SelectCommand="SELECT CUSTOMER.firstName + ' ' + CUSTOMER.lastName as 'Customer Name' FROM CUSTOMER;">
    </asp:SqlDataSource>
</asp:Content>


