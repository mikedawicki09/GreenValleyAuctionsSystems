<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ManageEmployeeAccount.aspx.cs" Inherits="GreenValleyAuctionsSystems.ManageEmployeeAccount1" %>
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
            margin-right:12px;
        }
        .btnBtn {
         margin-right: 10px;
        }
        .txtSpace {
            margin-bottom: 5px;
            margin-right: 10px;
        }
         .quick {
            font-family: 'quicksand' sans-serif;
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
            <div class="col-lg-12 col-md-6 col-sm-12">
                <div class="row">
                    <div class="card" style="height: 250px; padding: 0px;">
                        <div class="card-header" style="background-color: #fff2cc;  margin-right: 0px;">

                            <div class="row">
                            <div class="col-md-4"><h2>Personal Account Information</h2></div>
                            <div class="col-md-5"></div>
                            </div>
                        </div>
                        <div class="card-body overflow-auto">
                            <div class="container">
                                <asp:GridView
                                    ID="grdvwEmployeeAccount"
                                    runat="server"
                                    DataSourceID="datasrcEmployeeInfo"
                                    AutoGenerateEditButton="false"
                                    AutoGenerateColumns="false"
                                    DataKeyNames="employeeID"
                                    GridLines="Horizontal"
                                    BorderWidth="0px"
                                    HeaderStyle-Font-Underline="true"
                                    EmptyDataText="No employees in the database at this time."
                                    AlternatingRowStyle-BackColor="#F1F8F7" CellPadding="6" CellSpacing="5" HeaderStyle-HorizontalAlign="Left"
                                    HeaderStyle-ForeColor="#1C593F" CssClass="quick" Font-Bold="true">
                                    <Columns>
                                        <asp:CommandField HeaderText="Edit" ShowEditButton="true" ButtonType="Image" ControlStyle-Width="60px" ControlStyle-CssClass="btn btn-success text-white" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" ItemStyle-Width="160px" />
                                        <asp:BoundField HeaderText="employeeID" DataField="employeeID" SortExpression="employeeID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                        <asp:BoundField HeaderText="First Name" DataField="firstName" SortExpression="firstName" ItemStyle-Width="130px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                        <asp:BoundField HeaderText="Last Name" DataField="lastName" SortExpression="lastName" ItemStyle-Width="120px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                        <asp:BoundField HeaderText="Phone Number" DataField="phoneNumber" SortExpression="phoneNumber" ItemStyle-Width="160px" ControlStyle-CssClass="form-control shadow-sm input-small"/>
                                        <asp:BoundField HeaderText="Email Address" DataField="emailAddress" SortExpression="emailAddress" ItemStyle-Width="150px" ControlStyle-CssClass="form-control shadow-sm input-small"/>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="card" style="height: 300px; padding: 0px;">
                        <div class="card-header" style="background-color: #fff2cc;  margin-right: 0px;">

                            <div class="row">
                            <div class="col-md-4"><h2>Change Password</h2></div>
                            <div class="col-md-5"></div>
                            </div>
                        </div>
                        <div class="card-body overflow-auto quick">
                            <div class="container">
                                <asp:Table ID="tblChangePassword" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblOldPassword" runat="server" Text="Old Password: " Font-Bold="true"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="form-control shadow-sm input-small txtSpace"></asp:TextBox>
                                        </asp:TableCell>
<%--                                        <asp:TableCell>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a password." ControlToValidate="txtOldPassword"></asp:RequiredFieldValidator>
                                        </asp:TableCell>--%>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblNewPasswordOne" runat="server" Font-Bold="true" Text="New Password: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtNewPasswordOne" runat="server" TextMode="Password" CssClass="form-control shadow-sm input-small txtSpace"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblNewPasswordTwo" runat="server" Font-Bold="true" Text="Confirm New Password: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtNewPasswordTwo" runat="server" TextMode="Password" CssClass="form-control shadow-sm input-small txtSpace"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click" CssClass="btn btn-success text-white" Width="150px" Height="40px"/>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
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
        ID="datasrcEmployeeInfo"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT EMPLOYEE.employeeID, EMPLOYEE.firstName, EMPLOYEE.lastName, EMPLOYEE.phoneNumber, EMPLOYEE.emailAddress FROM EMPLOYEE WHERE EMPLOYEE.emailAddress = @Username"  
        UpdateCommand="UPDATE EMPLOYEE SET firstName = @firstName, lastName = @lastName, phoneNumber = @phoneNumber, emailAddress = @emailAddress WHERE EMPLOYEE.emailAddress = @emailAddress">
         <SelectParameters>
             <asp:SessionParameter Name="Username" SessionField="Username" Type="String" />
         </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstName"  Type="String" />
            <asp:Parameter Name="lastName" Type="String"/>
            <asp:Parameter Name="phoneNumber" Type="String"/>
            <asp:Parameter Name="emailAddress" Type="String"/>
        </UpdateParameters>
    </asp:SqlDataSource>


        </section>



</asp:Content>




