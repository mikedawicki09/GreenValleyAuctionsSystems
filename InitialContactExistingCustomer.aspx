<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="InitialContactExistingCustomer.aspx.cs" Inherits="GreenValleyAuctionsSystem.InitialContactExistingCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <h1 class="text-uppercase">Inital Contact Form</h1>
    <asp:Table ID="tblHead" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnExistingCustomer" runat="server" Text="Existing Customer"  Class="btn btn-success text-white" OnClick="btnExistingCustomer_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnNewCustomer" runat="server" Text="New Customer"  BackColor="Gray" Class="btn btn-success text-white" OnClick="btnNewCustomer_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblName" runat="server" Text="Customer Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="datasrcExistingCustomers" DataTextField="Customer Name" DataValueField="Customer Name" AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMethodofContact" runat="server" Text="Method of Contact:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlContactMethods" runat="server">
                    <asp:ListItem
                        Text="In Person"
                        Value="In Person">
                    </asp:ListItem>
                    <asp:ListItem
                        Text="Phone Call"
                        Value="Phone Call">
                    </asp:ListItem>
                    <asp:ListItem
                        Text="Text"
                        Value="Text">
                    </asp:ListItem>
                    <asp:ListItem
                        Text="Email"
                        Value="Email">
                    </asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblServices" runat="server" Text="Services Required: "></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                <asp:Label ID="lblAuction" runat="server" Text="Auction: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:CheckBox ID="cbxAuction" runat="server" OnCheckedChanged="cbxAuction_CheckedChanged" AutoPostBack="true" />
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Right">
                <asp:Label ID="lblMove" runat="server" Text="Move: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Right">
                <asp:CheckBox ID="cbxMove" runat="server" OnCheckedChanged="cbxMove_CheckedChanged" AutoPostBack="true" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <div class="container">
    <asp:Table ID="Table2" runat="server" HorizontalAlign="Left" Visible="false">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDeadline" runat="server" Text="Deadline Date: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxDeadlineDate" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblReason" runat="server" Text="Reason for Selling: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxReason" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
       
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblItemName" runat="server" Text="Item Name: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxItemName" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPickupAddress" runat="server" Text="Pickup Street Address:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxAddress" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPickupCity" runat="server" Text="Pickup City: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxPickupCity" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPickupState" runat="server" Text="Pickup State: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxPickupState" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPickupZipcode" runat="server" Text="Pickup Zip Code: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxPickupZipCode" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAnotherItem" runat="server" Text="Add Item" class="btn btn-success text-white" OnClick="btnAnotherItem_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

      
    <asp:Table runat="server" ID="moreInvTable" HorizontalAlign="Left" Visible="false">
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNumberofItems" runat="server" Text="Number of Items:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblDisplayNumOfItems" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    runat="server"
                    Text="Item Name"></asp:Label>
                &nbsp
                                &nbsp
                                &nbsp
                                &nbsp
                               
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox
                    ID="lbInventory"
                    runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddInventoryWarning" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        </div>
<div class="container">
    <asp:Table ID="Table3" runat="server" HorizontalAlign="Right" Visible="false">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMoveDeadlineDate" runat="server" Text="Deadline Date: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxMoveDeadlineDate" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCurrentStreet" runat="server" Text="Current Street Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxCurrentStreet" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCurrentCity" runat="server" Text="Current City: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxCurrentCity" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCurrentState" runat="server" Text="Current State: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxCurrentState" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCurrentZipCode" runat="server" Text="Current ZipCode: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxCurrentZipCode" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationStreet" runat="server" Text="Destination Street Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxDestinationStreet" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationCity" runat="server" Text="Destination City: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxDestinationCity" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationState" runat="server" Text="Destination State: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxDestinationState" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationZipCode" runat="server" Text="Destination ZipCode: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxDestinationZipCode" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
    <div class="container">
     <asp:Table ID="Table4" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" class="btn btn-success text-white" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblConfirmation" runat="server" Text="" Visible="false"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        </div>
    <asp:SqlDataSource runat="server"
        ID="datasrcExistingCustomers"
        ConnectionString="<%$ ConnectionStrings: Lab4 %>"
        SelectCommand="select firstName + ' ' + lastName as 'Customer Name' from CUSTOMER;"></asp:SqlDataSource>
</asp:Content>



