<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="AuctionSchedulingForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.AuctionSchedulingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">


    <style>
        #float3 {
            position: fixed;
            width: 300px;
            height: 700px;
            bottom: 40px;
            top: 150px;
            left: -40px;
            background-color: #1c593f;
            border-radius: 30px;
            text-align: center;
            margin-right: 15px;
        }

        .btnToDo {
            border: none;
            color: white;
            padding-bottom: 5px;
            padding-top: 5px;
            padding-left: 5px;
            padding-right: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            border-radius: 4px;
            height: 50px;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
        }

        .card-header {
            background-color: #fff2cc;
        }

        .special {
            margin: 20px;
            width: 200px;
            font-family: 'Quicksand', sans-serif;
            font-size: 13px;
            height: 50px;
        }

        .hidden {
            display: none;
        }
        .needPad {
            float: right;
            margin-right: 20px;
        }

        .floatBtn {
            position: fixed;
            width: 75px;
            height: 75px;
            left: 0px;
            top: 200px;
            background-color: #1c593f;
            border-radius: 10px;
            padding: 10px;
            text-align: center;
            margin-right: 15px;
        }

    </style>
    <br />
    <br />
    <br />
    <br />
    <br />
    <h1>Auction Service Order Form</h1>


    <div class="container">
        <div class="row">
            <div class="col-sm">
                <div class="card">
                    <div class="card-header" style="background-color: #fff2cc">
                        <h2>Customer Information</h2>
                    </div>
                    <div class="card-body shadow" style="background-color: #f1f8f7">
                        <asp:DetailsView
                            ID="dvCustomerInfo"
                            runat="server"
                            CssClass="quick"
                            HorizontalAlign="Left"
                            DataSourceID="datasrcCustomerInfo"
                            DataKeyNames="customerID"
                            GridLines="Horizontal"
                            BorderWidth="0"
                            AutoGenerateRows="false"
                            Width="400px">
                            <Fields>
                                <asp:CommandField ShowEditButton="true" ButtonType="Image" ControlStyle-CssClass="btn btn-success text-white" ControlStyle-Width="45px" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" />
                                <asp:BoundField HeaderText="customerID" HeaderStyle-Font-Bold="true" DataField="customerID" SortExpression="customerID" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                <asp:BoundField HeaderText="First Name: " HeaderStyle-Font-Bold="true" DataField="firstName" SortExpression="firstName" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="Last Name: " HeaderStyle-Font-Bold="true" DataField="lastName" SortExpression="lastName" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="Preferred Method of Contact: " HeaderStyle-Font-Bold="true" DataField="preferredContactMethod" SortExpression="zipcode" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="Email: " HeaderStyle-Font-Bold="true" DataField="emailAddress" SortExpression="emailAddress" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="Phone: " HeaderStyle-Font-Bold="true" DataField="phoneNumber" SortExpression="phoneNumber" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="Home Address: " HeaderStyle-Font-Bold="true" DataField="streetAddress" SortExpression="streetAddress" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="City: " HeaderStyle-Font-Bold="true" DataField="city" SortExpression="city" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="State: " HeaderStyle-Font-Bold="true" DataField="state" SortExpression="state" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="Zip: " HeaderStyle-Font-Bold="true" DataField="zipcode" SortExpression="zipcode" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <section style="background-color: #f1f8f7">
        <div class="container">
            <div class="col-lg-12">
                <div class="card" >

                    <div class="card-header" style="background-color: #fff2cc">
                        <h2>Add Auction Service Order Form</h2>
                        <asp:Button ID="BtnPopulate"
                            runat="server"
                            Text="Populate"
                            OnClick="BtnPopulate_Click"
                            CausesValidation="false"
                            class="btn btn-success text-white" />
                    </div>
                    <br />

                    <div class="card-body container">
                        <asp:Table ID="NewAuctionTable" runat="server" class="quick font-weight-bold">
                            <asp:TableRow>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblStatus"
                                        runat="server"
                                        Text="Customer Status: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblNewTicket"
                                        runat="server"
                                        Text="New Ticket"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblCustID"
                                        runat="server"
                                        Text="Customer Name: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblCustomerName"
                                        runat="server"
                                        Text=""></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblTitle"
                                        runat="server"
                                        Text="Note Title: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtTitle"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator4"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtTitle"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblNote"
                                        runat="server"
                                        Text="Note Details: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtNote"
                                        runat="server"
                                        TextMode="MultiLine"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RFVNote"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtNote"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblDate"
                                        runat="server"
                                        Text="Date of Auction: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtDate"
                                        runat="server"
                                        TextMode="Date"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator12"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtDate"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblTruck"
                                        runat="server"
                                        Text="Truck Accessibility: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtTruck"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RFVComp"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtTruck"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblTime"
                                        runat="server"
                                        Text="Time of Auction: "
                                        TextMode="Date"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtTime"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator13"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtTime"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="REVTime"
                                        runat="server"
                                        ControlToValidate="txtTime"
                                        ErrorMessage="Must be in hh:mm:ss AM/PM format!"
                                        ForeColor="Red"
                                        ValidationExpression="^(([0]?[1-9])|([1][0-2])):(([0-5][0-9])|([1-9])):([0-5][0-9]) [AP][M]$"></asp:RegularExpressionValidator>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblSupplies"
                                        runat="server"
                                        Text="Supplies Needed:"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtSupplies"
                                        runat="server"
                                        TextMode="MultiLine"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator1"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtSupplies"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblComp"
                                        runat="server"
                                        Text="Service Completion Date: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtComp"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator7"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtComp"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator
                                        ID="CVComp"
                                        ControlToValidate="txtComp"
                                        Text="Must be in YYYY-MM-DD format!"
                                        runat="server"
                                        Operator="DataTypeCheck"
                                        Type="Date"
                                        ErrorMessage="CompareValidator"
                                        ForeColor="Red"></asp:CompareValidator>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblBoxNum"
                                        runat="server"
                                        Text="Number of Boxes:"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtBoxes"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator2"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtBoxes"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                     <asp:CompareValidator runat="server"
                                            ControlToValidate="txtBoxes"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor ="Red"/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblBoxType"
                                        runat="server"
                                        Text="Box Type:"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtBoxType"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator3"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtBoxType"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblTrucks"
                                        runat="server"
                                        Text="Number of Trucks: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtTrucks"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator5"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtTrucks"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator runat="server"
                                            ControlToValidate="txtTrucks"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor ="Red"/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblAddress"
                                        runat="server"
                                        Text="Pickup Street Address: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtAddress"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RVAddress"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtAddress"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblCity"
                                        runat="server"
                                        Text="Pickup City: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtCity"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator8"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtCity"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblState"
                                        runat="server"
                                        Text="Pickup State: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtState"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator9"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtState"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblZipCode"
                                        runat="server"
                                        Text="Pickup ZipCode: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtZipCode"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator10"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtZipCode"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator runat="server"
                                            ControlToValidate="txtZipCode"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor ="Red"/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblVehicle"
                                        runat="server"
                                        Text="Vehicle: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList
                                        ID="ddlVehicle"
                                        runat="server"
                                        DataSourceID="dataSourceVehicleList"
                                        DataTextField="Vehicle"
                                        DataValueField="equipmentID"
                                        AutoPostBack="true"
                                        class="quick font-weight-bold">
                                    </asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblCost"
                                        runat="server"
                                        Text="Fixed/Estimated Total Cost: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtTotalCost"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator21"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtTotalCost"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator runat="server"
                                            ControlToValidate="txtTotalCost"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor ="Red"/>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label
                                        ID="lblPayment"
                                        runat="server"
                                        Text="Payment Method: "></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox
                                        ID="txtPaymentType"
                                        runat="server"
                                        CssClass="form-control shadow-sm quick font-weight-bold"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator22"
                                        runat="server"
                                        ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtPaymentType"
                                        SetFocusOnError="true"
                                        Text="* Required Field"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:Button
                            ID="BtnSave"
                            runat="server"
                            Text="Save"
                            OnClick="BtnSave_Click"
                            class="btn btn-success text-white quick font-weight-bold" />

                        <asp:Button
                            ID="BtnClear"
                            runat="server"
                            Text="Clear"
                            OnClick="BtnClear_Click"
                            class="btn btn-success text-white quick font-weight-bold" />

                        <asp:Button
                            ID="BtnCompletion"
                            runat="server"
                            Text="Go To Completion Form"
                            OnClick="BtnCompletion_Click"
                            Visible="false"
                            class="btn btn-success text-white quick font-weight-bold" />
                        <br />
                        <asp:Label
                            ID="lblNotify"
                            runat="server"
                            ForeColor="Green"
                            class="quick font-weight-bold"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="card">
                    <div class="card-header" style="background-color: #fff2cc">
                        <asp:Label
                            ID="lblInv2"
                            runat="server"
                            Text="Continuously Add Inventory As Needed."
                            Font-Bold="true"></asp:Label>
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="grdvwInventory"
                            runat="server" ShowFooter="true"
                            AutoGenerateColumns="false" OnRowCreated="grdvwRooms_RowCreated"
                            BorderWidth="0" class="quick"
                            AlternatingRowStyle-BackColor="#F1F8F7"
                            CssClass="quick font-weight-bold">
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="Inventory Item" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSpace" runat="server" Text="" Width="60px" Font-Bold="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:TextBox
                                            ID="txtInvDesc"
                                            runat="server"
                                            CssClass="form-control shadow-sm quick font-weight-bold"
                                            Placeholder="Item Description"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cost" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCost" runat="server" Width="60px" CssClass="form-control shadow-sm quick font-weight-bold" Placeholder="Cost"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnRemove" runat="server" CausesValidation="false"
                                            OnClick="btnRemove_Click" ForeColor="#1c593f">Remove</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Table ID="tblTotals" runat="server" Visible="false">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="lbltitleFinalTotal" runat="server" Text="Final Total:" Width="100px" Font-Bold="true"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label ID="lblFinalTotal" runat="server" Text="" Width="60px" Font-Bold="true" ForeColor="Red"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:Button
                            ID="btnAddInv"
                            runat="server"
                            Text="Add Inventory"
                            OnClick="ButtonAdd_Click"
                            class="btn btn-success text-white" />
                        <br />
                        <br />
                        <asp:Button
                            ID="btnSaveInv"
                            runat="server"
                            Text="Save All Inventory"
                            OnClick="btnSaveInv_Click"
                            class="btn btn-success text-white" />
                        <br />
                        <asp:Label
                            ID="lblAdded"
                            runat="server"
                            ForeColor="Green"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <%--   <div class="container">
            <div class="row">
                <div class="col">
                    <div style="margin-left: 170px">
                        <br />
               


                    </div>
                </div>
            </div>
        </div>--%>
    </section>

    <%-- <div id="float3" class="btn-custom shadow-lg">

        <h2 class="text-white" style="margin-top: 20px;">FORMS</h2>
        <i class="fa fa-plus my-float"></i>
        <ul>
            <li>
                <asp:Button ID="btnInitialContactForm" runat="server" Text="Initial Contact Form" OnClick="btnInitialContactForm_Click" class="btn btn-lg btn-success special shadow-sm text-white" CausesValidation="false" /></li>
            <li>
                <asp:Button ID="btnAuctionServiceOrder" runat="server" Text="Auction Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnAuctionServiceOrder_Click" CausesValidation="false" /></li>
            <li>
                <asp:Button ID="btnAuctionAssessmentForm" runat="server" Text="Auction Assessment Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnAuctionAssessmentForm_Click" CausesValidation="false" /></li>
            <li>
                <asp:Button ID="btnAppraisalServiceOrderForm" runat="server" Text="Appraisal Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnAppraisalServiceOrderForm_Click" CausesValidation="false" /></li>
            <li>
                <asp:Button ID="btnMoveAssessmentForm" runat="server" Text="Move Assessment Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnMoveAssessmentForm_Click" CausesValidation="false" /></li>
            <li>
                <asp:Button ID="btnMoveServiceOrder" runat="server" Text="Move Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnMoveServiceOrder_Click" CausesValidation="false" /></li>
        </ul>

    </div>--%>


    <%--    <asp:SqlDataSource
        ID="datasrcServiceTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT dbo.CUSTOMER.customerID, dbo.CUSTOMER.firstName, dbo.CUSTOMER.lastName, dbo.SERVICE.serviceID, dbo.AUCTIONSERVICE.dateOfService, dbo.SERVICE.serviceName, dbo.SERVICE.serviceStatus
                        FROM dbo.CUSTOMER, dbo.SERVICE, dbo.AUCTIONSERVICE
                        WHERE dbo.CUSTOMER.customerID = dbo.SERVICE.customerID AND SERVICE.serviceID = AUCTIONSERVICE.serviceID AND dbo.SERVICE.serviceName LIKE '%Auction'"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>

    </asp:SqlDataSource>--%>
    <asp:SqlDataSource
        ID="datasrcCustomerInfo"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT customerID, firstName, lastName, preferredContactMethod, emailAddress, phoneNumber, streetAddress, city, state, zipcode FROM dbo.CUSTOMER WHERE customerID = @customerID"
        UpdateCommand="UPDATE CUSTOMER SET firstName = @firstName, lastName =@lastName, preferredContactMethod=@preferredContactMethod, emailAddress=@emailAddress, phoneNumber=@phoneNumber, streetAddress=@streetAddress, city=@city, state=@state, zipcode=@zipcode FROM dbo.CUSTOMER WHERE CUSTOMER.customerID = @customerID">
        <SelectParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" Type="Int32" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="preferredContactMethod" Type="String" />
            <asp:Parameter Name="emailAddress" Type="String" />
            <asp:Parameter Name="phoneNumber" Type="String" />
            <asp:Parameter Name="streetAddress" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zipcode" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="dataSourceCustList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select [customerID], [firstName] + ' ' + [lastName]  AS CustomerName from dbo.CUSTOMER"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="dataSourceVehicleList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select [equipmentID], [description]  AS Vehicle from dbo.EQUIPMENT"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="dataSourceEmployeeList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select [employeeID], [firstName] + ' ' + [lastName] AS Employee from dbo.EMPLOYEE"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="calendarDates"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select dbo.SERVICE.timeDate from dbo.SERVICE where dbo.SERVICE.serviceName = 'Auction'"></asp:SqlDataSource>

    <div class="btn-custom">
        <a class="float bg-success" href="#popup1" style="padding-top: 10px;">

            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-plus-circle text-white" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
            </svg>
            <i class="fa fa-plus my-float"></i>


        </a>
    </div>
    <div id="popup1" class="overlay" style="float: right;">
        <div class="popup shadow-lg pop">
            <h1>Add to your to do List!</h1>
            <a class="close" href="#">&times;</a>
            <div class="content">
                <div class="container row">
                    <div class="col-md-12">
                        <div class="form-group md-form mb-0">
                            <label>To Do List Item:</label>
                            <asp:TextBox runat="server" ID="txtbxToDoItem" CssClass="form form-control input-sm"></asp:TextBox>
                            <%-- <input type="address" class="form-control shadow-sm imput-small" id="inputtodoitem" aria-describedby="emailHelp" placeholder="Enter To Do List Item ">--%>
                        </div>
                    </div>
                </div>

                <div class="container row">
                    <div class="col-md-12">
                        <div class="form-group mb-0">
                            <label>Description:</label>
                            <asp:TextBox runat="server" ID="txtbxToDoDescription" CssClass="form form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="container row">
                    <div class="col-md-12">
                        <div class="form-group mb-0">
                            <label>Deadline Date:</label>
                            <asp:TextBox runat="server" ID="todoDeadlineDate" TextMode="Date" CssClass="form form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="container row text-center" style="margin-top: 15px; margin-bottom: 15px;">
                    <div class="col-sm">
                        <asp:RadioButtonList ID="rblUrgent" runat="server" RepeatDirection="Horizontal" class=" container col-md-12 text-center">
                            <asp:ListItem Text="Urgent" Value="Urgent" class="btnToDo btn-success text-white"></asp:ListItem>
                            <asp:ListItem Text="Very Urgent" Value="Very Urgent" class="btnToDo btn-danger text-white"></asp:ListItem>
                        </asp:RadioButtonList>
                        <%-- <div class="btn btn-danger text-white">
                            <asp:Label ID="lblVeryUrgent" runat="server" Text="Very Urgent"></asp:Label>
                            <asp:RadioButton ID="rbVeryUrgent" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="btn btn-success text-white">
                            <asp:Label ID="lblUrgent" runat="server" Text="Urgent"></asp:Label>
                            <asp:RadioButton ID="rbUrgent" runat="server" />--%>
                    </div>
                </div>
            </div>
            <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CausesValidation="false" class="btn btn-success text-white" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
     <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CssClass="btn btn-outline-success floatBtn" CausesValidation="false" OnClick="ImageButton1_Click" ImageUrl="\GVAImages\toggle.svg" Width="60px" Height="60px" />
    <asp:Panel ID="Panel1" runat="server">
        <div id="float3" class="btn-custom shadow-lg">

            <h2 id="forms" runat="server" class="text-white" style="margin-top: 20px;">FORMS
                <asp:ImageButton ID="btnCollapse" CssClass="needPad btn btn-outline-success" runat="server" CausesValidation="false" OnClick="btnCollapse_Click" ImageUrl="\GVAImages\toggle.svg" Width="40" Height="40" /></h2>

        <i class="fa fa-plus my-float"></i>
        <ul>
            <li>
                <asp:Button ID="Button3" runat="server" Text="Auction Assessment Form" class="btn btn-lg btn-success special shadow-sm text-white" CausesValidation="false" OnClick="btnAuctionAssessmentForm_Click" /></li>
            <li>
                <asp:Button ID="Button2" runat="server" Text="Auction Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" CausesValidation="false" OnClick="btnAuctionServiceOrder_Click" /></li>
            <li>
                <asp:Button ID="Button4" runat="server" Text="Appraisal Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" CausesValidation="false" OnClick="btnAppraisalServiceOrderForm_Click" /></li>
            <li>
                <asp:LinkButton ID="lbtnToCustomerFile" runat="server" OnClick="lbtnToCustomerFile_Click" CausesValidation="false" ForeColor="white">Go Back To Auction Details</asp:LinkButton></li>
        </ul>

    </div>
        </asp:Panel>
        <div class=" btn-custom">
        <a class="float2 bg-success" href="#popup2" style="padding-top: 10px;">

            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16" class="text-white">
                <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
                <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z" />
                <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z" />
            </svg>
            <i class="fa fa-plus my-float"></i>


        </a>
    </div>

    <div id="popup2" class="overlay" style="float: right;">
        <div class="popup shadow-lg pop">
            <h1>Add a Note!</h1>
            <a class="close" href="#">&times;</a>
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="form-group md-form mb-0">
                            <asp:Label ID="Label1" runat="server" Text="Note Title: "></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group md-form mb-0">
                            <asp:TextBox ID="txtTitle2" runat="server" Placeholder="Enter Note Title" CssClass="form-control shadow-sm input-small"></asp:TextBox>
                        </div>
                    </div>

                </div>

                <div class="container">
                    <div class="row">
                        <div class="form-group md-form mb-0">
                            <asp:Label ID="lblBody" runat="server" Text="Note Body: "></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group md-form mb-0">
                            <asp:TextBox ID="txtBody" runat="server" Placeholder="Enter Note Body" CssClass="form-control shadow-sm input-small"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                    <asp:Button ID="Button5" runat="server" Text="Save Note" OnClick="submitNote_Click" CausesValidation="false" class="btn btn-success text-white" />
                </div>
            </div>
        </div>
    </div>


</asp:Content>





