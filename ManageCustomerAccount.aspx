<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="ManageCustomerAccount.aspx.cs" Inherits="GreenValleyAuctionsSystems.ManageCustomerAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
        <style>
        .hidden {
            display: none;
        }
        .btn {
            height: 30px;
            width: 100px;
        }
        .txMarg {
            margin-right: 12px;
        }
        .btnBtn {
            margin-right: 10px;
        }
        .txtSpace {
            margin-bottom: 5px;
            margin-right: 10px;
        }

    </style>

    <br />
    <br />
    <br />
    <br />
    <br />

    <h1 class="text-uppercase">Manage Account</h1>

    <section style="background-color: #f1f8f7;">

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-11 col-sm-12">
                <div class="row">
                    <div class="card" style="height:625px; padding: 0px;">
                        <div class="card-header" style="background-color: #fff2cc; margin-right: 0px;">

                            <div class="row">
                                <div class="col-md-4"><h2>Personal Account Information</h2></div>
                                <div class="col-md-5"></div>
                            </div>
                        </div>
                        <div class="card-body overflow-auto">
                            <div class="container">
                                <asp:DetailsView 
                                    ID="grdvwCustomerAccount"
                                    runat="server"  class="quick"
                                    DataSourceID="datasrcCustomerInfo" 
                                    AutoGenerateEditButton="false" 
                                    AutoGenerateRows="false" 
                                    DataKeyNames="customerID" 
                                    GridLines="Horizontal" 
                                    BorderWidth="0px" 
                                    HeaderStyle-Font-Underline="true" 
                                    EmptyDataText="No customer in the database due to error."
                                    AlternatingRowStyle-BackColor="#F1F8F7" 
                                    CellPadding="6" 
                                    CellSpacing="5" 
                                    HeaderStyle-HorizontalAlign="Left" 
                                    HeaderStyle-ForeColor="#1C593F">
                                    <Fields>
                                        <asp:CommandField HeaderText="Edit" ShowEditButton="true" ButtonType="Image" ControlStyle-Width="60px" ControlStyle-CssClass="btn btn-success text-white" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" ItemStyle-Width="160px" />
                                        <asp:BoundField HeaderText="customerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden bold" ReadOnly="true" ItemStyle-CssClass="hidden"/>
                                        <asp:BoundField HeaderText="First Name" DataField="firstName" SortExpression="firstName" ItemStyle-Width="130px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true" />
                                        <asp:BoundField HeaderText="Last Name" DataField="lastName" SortExpression="lastName" ItemStyle-Width="130px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true" />
                                        <asp:BoundField HeaderText="Preferred Contact" DataField="preferredContactMethod" SortExpression="preferredContactMethod" ItemStyle-Width="130px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true" />
                                        <asp:BoundField HeaderText="Email" DataField="emailAddress" SortExpression="emailAddress" ItemStyle-Width="150px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true"/>
                                        <asp:BoundField HeaderText="Address" DataField="streetAddress" SortExpression="streetAddress" ItemStyle-Width="200px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true"/>
                                        <asp:BoundField HeaderText="City" DataField="city" SortExpression="city" ItemStyle-Width="75px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true"/>
                                        <asp:BoundField HeaderText="State" DataField="state" SortExpression="state" ItemStyle-Width="75px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true"/>
                                        <asp:BoundField HeaderText="Zip" DataField="zipCode" SortExpression="zipCode" ItemStyle-Width="100px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true"/>
                                        <asp:BoundField HeaderText="Phone Number" DataField="phoneNumber" SortExpression="phoneNumber" ItemStyle-Width="160px" ControlStyle-CssClass="form-control shadow-sm input-small" HeaderStyle-Font-Bold="true"/>                                        
                                    </Fields>
                                </asp:DetailsView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-10 col-sm-12">
                <div class="row">
                    <div class="card" style="height: 300px; padding: 0px;">
                        <div class="card-header" style="background-color: #fff2cc; margin-right: 0px;">

                            <div class="row">
                                <div class="col-md-4"><h2>Change Password</h2></div>
                                <div class="col-md-5"></div>
                            </div>
                        </div>
                        <div class="card-body overflow-auto">
                            <div class="container">
                                <asp:Table ID="tblChangePassword" runat="server" CssClass="quick">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblOldPassword" runat="server" Text="Old Password: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="form-control shadow-sm input-small txtSpace"></asp:TextBox>
                                        </asp:TableCell>
<%--                                        <asp:TableCell>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a password." ControlToValidate="txtOldPassword"></asp:RequiredFieldValidator>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblNewPasswordOne" runat="server" Text="New Password: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtNewPasswordOne" runat="server" TextMode="Password" CssClass="form-control shadow-sm input-small txtSpace"></asp:TextBox>
                                        </asp:TableCell>
<%--                                        <asp:TableCell>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a password." ControlToValidate="txtNewPasswordOne"></asp:RequiredFieldValidator>
                                        </asp:TableCell--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblNewPasswordTwo" runat="server" Text="Confirm New Password: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtNewPasswordTwo" runat="server" TextMode="Password" CssClass="form-control shadow-sm input-small txtSpace"></asp:TextBox>
                                        </asp:TableCell>
<%--                                        <asp:TableCell>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a password." ControlToValidate="txtNewPasswordTwo"></asp:RequiredFieldValidator>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click" CssClass="btn btn-success text-white" Width="150px" Height="40px" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow >
                                        <asp:TableCell ColumnSpan="2">
                                            <br />
                                            <asp:Label ID="lblResponse" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource 
        ID="datasrcCustomerInfo" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:Lab4 %>" 
        SelectCommand="SELECT CUSTOMER.customerID, CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.preferredContactMethod, CUSTOMER.emailAddress, CUSTOMER.streetAddress, CUSTOMER.city, CUSTOMER.state, CUSTOMER.zipCode, CUSTOMER.phoneNumber FROM CUSTOMER WHERE CUSTOMER.emailAddress = @CustomerUsername" 
        UpdateCommand="UPDATE CUSTOMER SET firstName = @firstName, lastName = @lastName, preferredContactMethod = @preferredContactMethod, emailAddress = @emailAddress, streetAddress = @streetAddress, city = @city, state = @state, zipCode = @zipCode, phoneNumber = @phoneNumber WHERE CUSTOMER.emailAddress = @emailAddress">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerUsername" SessionField="CustomerUsername" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="preferredContactMethod" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zipCode" Type="String"/>
            <asp:Parameter Name="phoneNumber" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

        </section>


</asp:Content>

    



