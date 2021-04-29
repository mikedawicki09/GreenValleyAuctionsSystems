<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ManageEquipment.aspx.cs" Inherits="GreenValleyAuctionsSystems.ManageEquipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
    <br />
    <br />
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

        .addBtn {
            margin-left: 20px;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
            font: bold;
        }
    </style>

    <h1 class="text-uppercase">Manage Company Equipment</h1>

    <section style="background-color: #f1f8f7;">

        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-6 col-sm-12">
                    <div class="row">
                        <div class="card" style="height: 550px; padding: 0px;">
                            <div class="card-header" style="background-color: #fff2cc; margin-right: 0px;">

                                <div class="row">
                                    <div class="col-md-4">
                                        <h2>Equipment List </h2>
                                    </div>

                                    <div class="col-md-5"></div>
                                </div>
                            </div>
                            <div class="card-body overflow-auto quick">
                                <asp:ImageButton ID="addEuipment" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success addBtn" OnClick="addEuipment_Click" ControlStyle-Width="60px" />
                                <div class="container">
                                    <asp:GridView
                                        ID="grdvwEquipmentTable"
                                        runat="server"
                                        DataSourceID="datasrcEquipment"
                                        AutoGenerateEditButton="false"
                                        AutoGenerateColumns="false"
                                        DataKeyNames="equipmentID"
                                        OnRowCommand="grdvwEquipmentTable_RowCommand"
                                        GridLines="Horizontal"
                                        BorderWidth="0px"
                                        HeaderStyle-Font-Underline="true"
                                        EmptyDataText="No employees in the database at this time."
                                        AlternatingRowStyle-BackColor="#F1F8F7" CellPadding="8" CellSpacing="5" HeaderStyle-HorizontalAlign="Left"
                                        HeaderStyle-ForeColor="#1C593F" CssClass="quick" Font-Bold="true">
                                        <Columns>
                                            <asp:CommandField HeaderText="Edit" ShowEditButton="true" ButtonType="Image" ControlStyle-Width="60px" ControlStyle-CssClass="btn btn-success text-white quick" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" ItemStyle-Width="160px" />
                                            <asp:BoundField HeaderText="equipmentID" DataField="equipmentID" SortExpression="equipmentID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                            <asp:BoundField HeaderText="Description" DataField="description" SortExpression="description" ItemStyle-Width="170px" ControlStyle-CssClass="form-control shadow-sm input-small quick" />
                                            <asp:BoundField HeaderText="Purchase Cost" DataField="purchaseCost" SortExpression="purchaseCost" ItemStyle-Width="170px" ControlStyle-CssClass="form-control shadow-sm input-small quick" />
                                            <asp:BoundField HeaderText="Purchase Date" DataField="purchaseDate" SortExpression="purchaseDate" ItemStyle-Width="200px" ControlStyle-CssClass="form-control shadow-sm input-small quick" />
                                            <asp:TemplateField HeaderText="Remove">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnTrash" runat="server" CommandName="Delete" CommandArgument='<%#Eval("equipmentID") %>' ControlStyle-Width="60px" ControlStyle-CssClass="btn" ImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="50px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:Table ID="tbleAddEquipment" runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:ImageButton ID="btnNewEquipment" runat="server" ImageUrl="\GVAImages\save.svg" CssClass="btn btn-success btnNew hidden" OnClick="btnNewEquipment_Click" ControlStyle-Width="60px" />
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:ImageButton ID="btnCancelEquipment" runat="server" ImageUrl="\GVAImages\cancel.svg" CssClass="btn btn-success btnNew btnBtn " Visible="false" OnClick="btnCancelEquipment_Click" ControlStyle-Width="60px" />
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtDescription" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="120px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtPurchaseCost" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="140px"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtPurchaseDate" runat="server" Visible="false" TextMode="Date" ControlStyle-CssClass="form-control shadow-sm input-small txMarg" ControlStyle-Width="200px"></asp:TextBox>
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
            ID="datasrcEquipment"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT EQUIPMENT.equipmentID, EQUIPMENT.description, EQUIPMENT.purchaseCost, CONVERT(varchar,EQUIPMENT.purchaseDate,107) as purchaseDate FROM EQUIPMENT"
            UpdateCommand="UPDATE EQUIPMENT SET description = @Description, purchaseCost = @PurchaseCost, purchaseDate = @PurchaseDate WHERE EQUIPMENT.equipmentID = @equipmentID"
            DeleteCommand="DELETE FROM EQUIPMENTSERVICE WHERE equipmentID = @equipmentID"
            OnDeleted="datasrcEquipment_Deleted">
            <UpdateParameters>
                <asp:Parameter Name="equipmentID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="PurchaseCost" Type="String" />
                <asp:Parameter Name="PurchaseDate" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="equipmentID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </section>

</asp:Content>


