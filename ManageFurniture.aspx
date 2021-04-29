<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ManageFurniture.aspx.cs" Inherits="GreenValleyAuctionsSystems.ManageFurniture" %>

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
            margin-left: 25px;
        }

        .btnBtn {
            margin-right: 10px;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
            font: bold;
        }
    </style>

    <br />
    <br />
    <br />
    <br />
    <br />

    <h1 class="text-uppercase">Manage Furniture Listings</h1>

    <section style="background-color: #f1f8f7;">

        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-6 col-sm-12">
                    <div class="row">
                        <div class="card" style="height: 700px; padding: 0px;">
                            <div class="card-header" style="background-color: #fff2cc; margin-right: 0px;">

                                <div class="row">
                                    <div class="col-md-4">
                                        <h2>Furniture List</h2>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:ImageButton ID="addFurniture" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success addBtn" OnClick="addFurniture_Click" ControlStyle-Width="60px" /></div>
                                    <div class="col-md-5"></div>
                                </div>
                            </div>
                            <div class="card-body overflow-auto quick">
                                <div class="container">
                                    <asp:GridView
                                        ID="grdvwFurniture"
                                        runat="server"
                                        DataSourceID="datasrcFurniture"
                                        AutoGenerateEditButton="false"
                                        AutoGenerateColumns="false"
                                        DataKeyNames="furnitureID"
                                        GridLines="Horizontal" OnRowCommand="grdvwFurniture_RowCommand"
                                        BorderWidth="0px"
                                        HeaderStyle-Font-Underline="true"
                                        EmptyDataText="No furniture in the database at this time."
                                        AlternatingRowStyle-BackColor="#F1F8F7"
                                        CellPadding="6"
                                        CellSpacing="5"
                                        HeaderStyle-HorizontalAlign="Left"
                                        HeaderStyle-ForeColor="#1C593F" CssClass="quick" Font-Bold="true">
                                        <Columns>
                                            <asp:CommandField HeaderText="Edit" ShowEditButton="true" ButtonType="Image" ControlStyle-Width="60px" ControlStyle-CssClass="btn btn-success text-white" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" ItemStyle-Width="160px" />
                                            <asp:BoundField HeaderText="furnitureID" DataField="furnitureID" SortExpression="furnitureID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                            <asp:BoundField HeaderText="Furniture Name" DataField="name" SortExpression="name" ItemStyle-Width="215px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                            <asp:BoundField HeaderText="Cubic Unit(s)" DataField="cubicUnit" SortExpression="cubicUnit" ItemStyle-Width="170px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                            <asp:TemplateField HeaderStyle-CssClass="hidden">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnTrash" runat="server" CommandName="Delete" CommandArgument='<%#Eval("furnitureID") %>' ControlStyle-Width="60px" ControlStyle-CssClass="btn" ImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="50px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:Table ID="tblAddFurniture" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:ImageButton ID="btnNewFurniture" runat="server" ImageUrl="\GVAImages\save.svg" CssClass="btn btn-success btnNew hidden" OnClick="btnNewFurniture_Click" ControlStyle-Width="60px" />
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:ImageButton ID="btnCancelFurniture" runat="server" ImageUrl="\GVAImages\cancel.svg" CssClass="btn btn-success btnNew btnBtn" Visible="false" OnClick="btnCancelFurniture_Click" ControlStyle-Width="60px" />
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtName" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="175px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtCubicUnit" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="130px"></asp:TextBox>
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
            ID="datasrcFurniture"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT furnitureID, name, cubicUnit FROM FURNITURE"
            UpdateCommand="UPDATE FURNITURE SET name = @name, cubicUnit = @cubicUnit WHERE furnitureID = @furnitureID"
            DeleteCommand="DELETE FROM FURNITURESERVICE WHERE furnitureID = @furnitureID"
            OnDeleted="datasrcFurniture_Deleted">
            <UpdateParameters>
                <asp:Parameter Name="furnitureID" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="cubicUnit" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="furnitureID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </section>

</asp:Content>

