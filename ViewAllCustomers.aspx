<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ViewAllCustomers.aspx.cs" Inherits="GreenValleyAuctionsSystem.ViewAllCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
   <h1 class="text-uppercase">Customer Contacts</h1>
  <div class="container">
<div class="row">
    <div class="col">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomer" runat="server" Text="Search Customer: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtbxSearch" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSearch" runat="server" class="btn btn-custom text-white" Text="Search" OnClick="btnSearch_Click" />
                <br />
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
</div>
<div class="col">
        <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAddContact" runat="server" class="btn btn-custom text-white" Text="Add Contact ->" OnClick="btnAddNew_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
   </div>
   
   
    <br />
    <br />
  
    <asp:GridView ID="grdvwCustomerTable"
        runat="server"
        DataSourceID="datasrcCustomerTable"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        AutoGenerateEditButton="true"
        DataKeyNames="customerID"
        GridLines="Horizontal"
        EmptyDataText="No customers in database matching that name."
        AlternatingRowStyle-BackColor="LightGray" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
        HeaderStyle-ForeColor="White">
        <Columns>
            <asp:BoundField ReadOnly="true" HeaderText="customerID" DataField="customerID" SortExpression="customerID" Visible="false" />
            <asp:BoundField HeaderText="First Name" DataField="firstName" SortExpression="firstName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="Last Name" DataField="lastName" SortExpression="lastName" ItemStyle-Width="150px" />
            <asp:BoundField HeaderText="Email Address" DataField="emailAddress" SortExpression="emailAddress" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="Phone Number" DataField="phoneNumber" SortExpression="phoneNumber" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="Street" DataField="streetAddress" SortExpression="streetAddress" ItemStyle-Width="250px" />
            <asp:BoundField HeaderText="City" DataField="city" SortExpression="city"/>
            <asp:BoundField HeaderText="State" DataField="state" SortExpression="state"/>
            <asp:BoundField HeaderText="Zip Code" DataField="zipcode" SortExpression="zipcode"/>
            <asp:BoundField HeaderText="Initial Method of Contact" DataField="initialContact" SortExpression="initialContact" ItemStyle-Width="200px" />
            <asp:BoundField HeaderText="How did you hear about us?" DataField="discoveredFrom" SortExpression="discoveredFrom" ItemStyle-Width="200px" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource
        ID="datasrcCustomerTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT customerID, firstName, lastName, initialContact, discoveredFrom, 
        emailAddress, streetAddress, city, state, zipcode, phoneNumber FROM CUSTOMER"
        UpdateCommand=" UPDATE CUSTOMER SET firstName = @firstName, lastName = @lastName, emailAddress = @emailAddress,
        phoneNumber= @phoneNumber, streetAddress=@streetAddress, city=@city, state=@state, zipcode=@zipcode, initialContact = @initialContact, discoveredFrom= @discoveredFrom WHERE customerID= @customerID"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>

</div>
<footer class="sticky-bottom">

</footer>

</asp:Content>
