<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ManageEmployees.aspx.cs" Inherits="GreenValleyAuctionsSystems.ManageEmployees" %>

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

        .addBtn {
            margin-left: 40px;
            margin-top: 15px;
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
    <h1 class="text-uppercase">Manage Employees</h1>

    <section style="background-color: #f1f8f7;">

        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-6 col-sm-12">
                    <div class="row">
                        <div class="card" style="height: 700px; padding: 0px;">
                            <div class="card-header" style="background-color: #fff2cc; margin-right: 0px;">

                                <div class="row">
                                    <div class="col-md-4">
                                        <h2>Employee List </h2>
                                    </div>
                                    <div class="col-md-5"></div>
                                </div>
                            </div>
                            <asp:ImageButton ID="addEmployee" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success addBtn" OnClick="addEmployee_Click" ControlStyle-Width="60px" />
                            <div class="card-body overflow-auto">
                                <div class="container">
                                    <asp:GridView
                                        ID="grdvwEmployeeTable"
                                        runat="server"
                                        DataSourceID="datasrcEmployee"
                                        AutoGenerateEditButton="false"
                                        OnRowCommand="grdvwEmployeeTable_RowCommand"
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
                                            <asp:BoundField HeaderText="Phone Number" DataField="phoneNumber" SortExpression="phoneNumber" ItemStyle-Width="160px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                            <asp:BoundField HeaderText="Position" DataField="position" SortExpression="position" ItemStyle-Width="120px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                            <asp:BoundField HeaderText="Email Address" DataField="emailAddress" SortExpression="emailAddress" ItemStyle-Width="150px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                            <asp:BoundField HeaderText="Hourly Wage" DataField="hourlyWage" SortExpression="hourlyWage" ItemStyle-Width="130px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                            <asp:TemplateField HeaderStyle-CssClass="hidden">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnTrash" runat="server" CommandName="Delete" CommandArgument='<%#Eval("employeeID") %>' ControlStyle-Width="60px" ControlStyle-CssClass="btn" ImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="50px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                    </asp:GridView>
                                    <asp:Table ID="tbleAddEmployee" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:ImageButton ID="btnNewEmployee" runat="server" ImageUrl="\GVAImages\save.svg" CssClass="btn btn-success btnNew hidden" OnClick="btnNewEmployee_Click" ControlStyle-Width="60px" />
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:ImageButton ID="btnCancelEmployee" runat="server" ImageUrl="\GVAImages\cancel.svg" CssClass="btn btn-success btnNew btnBtn " Visible="false" OnClick="btnCancelEmployee_Click" ControlStyle-Width="60px" />
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtFirstName" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="100px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtlastName" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="100px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtPhoneNumber" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="130px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtPosition" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="120px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtEmailAddress" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="200px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtHourlyWage" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="130px"></asp:TextBox>
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

        <asp:Label ID="lblResponse" runat="server" Text=""></asp:Label>

        <asp:SqlDataSource
            ID="datasrcEmployee"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT EMPLOYEE.employeeID, EMPLOYEE.firstName, EMPLOYEE.lastName, EMPLOYEE.phoneNumber, EMPLOYEE.position, EMPLOYEE.emailAddress, EMPLOYEE.hourlyWage FROM EMPLOYEE"
            UpdateCommand="UPDATE EMPLOYEE SET firstName = @firstName, lastName = @lastName, phoneNumber = @phoneNumber, position = @position, emailAddress = @emailAddress, hourlyWage = @hourlyWage WHERE EMPLOYEE.employeeID = @employeeID"
            DeleteCommand="DELETE  FROM CREW WHERE employeeID = @employeeID"
            OnDeleted="datasrcEmployee_Deleted">
            <UpdateParameters>
                <asp:Parameter Name="employeeID" Type="Int32" />
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="phoneNumber" Type="String" />
                <asp:Parameter Name="position" Type="String" />
                <asp:Parameter Name="emailAddress" Type="String" />
                <asp:Parameter Name="hourlyWage" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="employeeID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>


    </section>
    <br />
    <br />



</asp:Content>

