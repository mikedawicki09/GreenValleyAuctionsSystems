<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="AuctionAssessment.aspx.cs" Inherits="GreenValleyAuctionsSystems.AuctionAssessment" %>

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

        .quick {
            font-family: 'Quicksand', sans-serif;
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

        .hidden {
            display: none;
        }

        .special {
            margin: 20px;
            width: 200px;
            font-family: 'Quicksand', sans-serif;
            font-size: 13px;
            height: 50px;
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
    <header style="background-color: #ffffff">
        <div class="starter-template text-center py-5 px-3">
            <h1 class="text-uppercase">Auction Assessment</h1>
            <asp:Label ID="lblHeader" runat="server" Text="" Font-Bold="true" Font-Size="Larger"></asp:Label>
        </div>
    </header>
    <section style="background-color: #f1f8f7">

        <section>
            <div class="container">
                <div class="row"></div>
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
        </section>

        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2 class="card-title">Pre-Auction Asssessment</h2>
                            <asp:Button ID="BtnPopulate"
                                runat="server"
                                Text="Populate"
                                OnClick="BtnPopulate_Click"
                                CausesValidation="false"
                                class="btn btn-success text-white quick font-weight-bold" />
                        </div>
                        <%--  <width="40" height="40" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16" style="margin-bottom: 5px">
                                <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z" />
                                <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z" />
                                <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z" />
                                <!-- https://icons.getbootstrap.com/icons/list-task/-->--%>

                        <div class="card-body" style="background-color: #ffffff">
                            <asp:Table ID="tblPreliminary" runat="server" class="quick font-weight-bold">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblSell" runat="server" Text="What do you have to sell?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtSell" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVSell"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtSell"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="pre"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="whySell" Text="Why are you considering auction services?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList
                                            runat="server"
                                            ID="ddlReasonWhySell"
                                            AutoPostBack="true"
                                            CssClass="form-control shadow-sm imput-small custom-select quick font-weight-bold">
                                            <asp:ListItem Text="--Select--" Value=" " disabled="disabled" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Settling an estate" Value="Settling an estate"></asp:ListItem>
                                            <asp:ListItem Text="Moving and need to downsize" Value="Moving and need to downsize"></asp:ListItem>
                                            <asp:ListItem Text="Just getting rid of some stuff" Value="Just getting rid of some stuff"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator5"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="ddlReasonWhySell"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="pre"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblDeadlineDate" Text="Is there a deadline date?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList
                                            runat="server"
                                            ID="ddlDeadlineDate"
                                            AutoPostBack="true"
                                            CssClass="form-control shadow-sm imput-small custom-select quick font-weight-bold">
                                            <asp:ListItem Text="--Select--" Value=" " disabled="disabled" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator6"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="ddlDeadlineDate"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="pre"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblDate" Text="If yes, what is it?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtDeadlineDate" type="date" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVDeadlineDate"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtDeadlineDate"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="pre"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblAskedForPics" Text="Have pictures been requested?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList
                                            runat="server"
                                            ID="ddlPicsRequested"
                                            AutoPostBack="true"
                                            CssClass="form-control shadow-sm imput-small custom-select quick font-weight-bold">
                                            <asp:ListItem Text="--Select--" Value=" " disabled="disabled" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator7"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="ddlPicsRequested"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="pre"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblItemList" Text="Has a list of items been requested?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList
                                            runat="server"
                                            ID="ddlItemList"
                                            AutoPostBack="true"
                                            CssClass="form-control shadow-sm imput-small custom-select quick font-weight-bold">
                                            <asp:ListItem Text="--Select--" Value=" " disabled="disabled" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator8"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="ddlItemList"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="pre"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblAdditionalServices" Text="Are any additional services needed?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList
                                            runat="server"
                                            ID="ddlAdditionalServices"
                                            AutoPostBack="true"
                                            CssClass="form-control shadow-sm imput-small custom-select quick font-weight-bold">
                                            <asp:ListItem Text="--Select--" Value=" " disabled="disabled" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Move" Value="Move"></asp:ListItem>
                                            <asp:ListItem Text="Appraisal" Value="Appraisal"></asp:ListItem>
                                            <asp:ListItem Text="Trash Removal & Donation Hauling" Value="Trash Removal & Donation Hauling"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator9"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="ddlAdditionalServices"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="pre"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <br />
                            <h4>What needs to be scheduled?</h4>
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:CheckBoxList
                                            runat="server"
                                            ID="chkbxNeedsSceduled"
                                            CssClass="quick font-weight-bold">
                                            <asp:ListItem Text="Bring In" Value="Bring In"></asp:ListItem>
                                            <asp:ListItem Text="Auction Walk Thru" Value="Auction Walk Thru"></asp:ListItem>
                                            <asp:ListItem Text="Pick Up" Value="Pick Up"></asp:ListItem>
                                            <asp:ListItem Text="Trash Removal & Donation Hauling" Value="Trash Removal & Donation Hauling"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:Button
                                ID="btnSavePre"
                                runat="server"
                                Text="Save Pre-Assessment"
                                OnClick="btnSavePre_Click"
                                class="btn btn-success text-white"
                                ValidationGroup="pre" />
                            <asp:Label runat="server" ID="lblSaved" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="card">
                        <br />
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2 class="card-title">Auction Asssessment</h2>
                            <%--  <width="40" height="40" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16" style="margin-bottom: 5px">
                                <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z" />
                                <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z" />
                                <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z" />
                                <!-- https://icons.getbootstrap.com/icons/list-task/-->--%>
                        </div>
                        <div class="card-body shadow">
                            <br />
                            <asp:Table ID="tblAssessment" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblTypeOfHome" Text="Type of Home:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList
                                            runat="server"
                                            ID="ddlHomeType"
                                            AutoPostBack="true"
                                            CssClass="form-control shadow-sm imput-small custom-select quick font-weight-bold">
                                            <asp:ListItem Text="--Select--" Value=" " disabled="disabled" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Apartment" Value="Apartment"></asp:ListItem>
                                            <asp:ListItem Text="House" Value="House"></asp:ListItem>
                                            <asp:ListItem Text="Storage Unit" Value="Storage Unit"></asp:ListItem>
                                            <asp:ListItem Text="Place of Business" Value="Place of Business"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator11"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="ddlHomeType"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>


                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblLoadingDoor" runat="server" Visible="false" Text="How far walk is the walk to the loading door?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtLoadingDoor" Visible="false" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVDoor"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtLoadingDoor"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"
                                            Visible="false"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblSteps" runat="server" Visible="false" Text="How many steps are there leading up to the home?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtSteps" Visible="false" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVSteps"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtSteps"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"
                                            Visible="false"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server"
                                            ControlToValidate="txtSteps"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor="Red"
                                            ValidationGroup="assessment" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblClimateControlled" runat="server" Visible="false" Text="Is this unit climate controlled?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtClimateControlled" Visible="false" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVClimate"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtClimateControlled"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"
                                            Visible="false"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblOutdoor" runat="server" Visible="false" Text="Is it outdoor self storage?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtOutdoor" Visible="false" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVStorage"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtOutdoor"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"
                                            Visible="false"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblFloor" runat="server" Visible="false" Text="What floor is the apartment on?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtFloor" Visible="false" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVFloor"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtFloor"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"
                                            Visible="false"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server"
                                            ControlToValidate="txtFloor"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor="Red"
                                            ValidationGroup="assessment" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblElevator" runat="server" Visible="false" Text="Is there an elevator?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtElevator" Visible="false" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVElevator"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtElevator"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"
                                            Visible="false"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDistance" runat="server" Visible="false" Text="How far is the apartment from the elevator?"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtDistance" Visible="false" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RVElevatorDist"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtDistance"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"
                                            Visible="false"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <br />

                            <div class="row">
                                <div class="col overflow-auto" style="height: 350px;">
                                    <h4>Select Equipment Needed:</h4>
                                    <br />
                                    <asp:Table runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:CheckBoxList
                                                    ID="chkbxSpecialEquipment"
                                                    runat="server"
                                                    DataSourceID="dataSourceSpecialList"
                                                    DataTextField="Special Equipment"
                                                    DataValueField="specialEquipmentID"
                                                    CssClass="quick font-weight-bold">
                                                </asp:CheckBoxList>

                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>


                                <%--    <div class="col overflow-auto" style="height:350px;">
                                   <h4>Select Vehicles Needed:</h4>
                                    <br />
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:CheckBoxList
                                            ID="chkBoxVehicles"
                                            runat="server"
                                            DataSourceID="dataSourceVehicleList"
                                            DataTextField="Vehicle"
                                            DataValueField="equipmentID">
                                        </asp:CheckBoxList>
                                        
                                    </asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                                </div>--%>

                                <div class="col overflow-auto" style="height: 350px;">
                                    <h4>Select Materials Needed:</h4>
                                    <br />
                                    <asp:Table runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:CheckBoxList
                                                    ID="chkBoxMaterials"
                                                    runat="server"
                                                    DataSourceID="dataSourceMaterialList"
                                                    DataTextField="Materials"
                                                    DataValueField="materialID"
                                                    CssClass="quick font-weight-bold">
                                                </asp:CheckBoxList>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                            </div>

                            <h4>Estimated Rates and Fees</h4>
                            <asp:Table runat="server" CssClass="quick font-weight-bold">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPickUpFee" runat="server" Text="Pick Up Fee:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtPickUpFee" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator1"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtPickUpFee"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server"
                                            ControlToValidate="txtPickUpFee"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor="Red"
                                            ValidationGroup="assessment" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>

                                    <asp:TableCell>
                                        <asp:Label ID="lblConsignment" runat="server" Text="Consignment Rate:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtConsignmentRate" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator2"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtConsignmentRate"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server"
                                            ControlToValidate="txtConsignmentRate"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor="Red"
                                            ValidationGroup="assessment" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>

                                    <asp:TableCell>
                                        <asp:Label ID="lblSpace2" runat="server" Text="Trash Removal:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtTrashRemoval" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator3"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtTrashRemoval"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>

                                    <asp:TableCell>
                                        <asp:Label ID="lblAdditionalFees" runat="server" Text="Additional Fees:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" ID="txtAdditionalFees" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator4"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtAdditionalFees"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"
                                            ValidationGroup="assessment"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server"
                                            ControlToValidate="txtAdditionalFees"
                                            Operator="DataTypeCheck"
                                            Type="Integer"
                                            ErrorMessage="Enter a valid integer"
                                            Display="Dynamic"
                                            Text="*Must be an integer!"
                                            ForeColor="Red"
                                            ValidationGroup="assessment" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:Button
                                ID="BtnSave"
                                runat="server"
                                Text="Save Assessment"
                                OnClick="BtnSave_Click"
                                class="btn btn-success text-white"
                                ValidationGroup="assessment" />
                            <asp:Button
                                ID="BtnClear"
                                runat="server"
                                Text="Clear"
                                OnClick="BtnClear_Click"
                                class="btn btn-success text-white"
                                ValidationGroup="assessment" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
        ID="dataSourceMaterialList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select [materialID],[description]  AS Materials from dbo.MATERIALS"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="dataSourceSpecialList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select [specialEquipmentID],[description]  AS 'Special Equipment' from dbo.SPECIALEQUIPMENT"></asp:SqlDataSource>
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
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success text-white" CausesValidation="false" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
   <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CssClass="btn btn-outline-success floatBtn" OnClick="ImageButton1_Click" CausesValidation="false" ImageUrl="\GVAImages\toggle.svg" Width="60px" Height="60px" />
    <asp:Panel ID="Panel1" runat="server">
        <div id="float3" class="btn-custom shadow-lg">

            <h2 id="forms" runat="server" class="text-white" style="margin-top: 20px;">FORMS
                <asp:ImageButton ID="btnCollapse" CssClass="needPad btn btn-outline-success" CausesValidation="false" runat="server" OnClick="btnCollapse_Click" ImageUrl="\GVAImages\toggle.svg" Width="40" Height="40" /></h2>

        <i class="fa fa-plus my-float"></i>
        <ul>
           
            <li>
                <asp:Button ID="btnAuctionAssessmentForm" runat="server" Text="Auction Assessment Form" CausesValidation="false" class="btn  btn-success special shadow-sm text-white" OnClick="btnAuctionAssessmentForm_Click" /></li>
             <li>
                <asp:Button ID="btnAuctionServiceOrder" runat="server" Text="Auction Service Order Form" CausesValidation="false" class="btn  btn-success special shadow-sm text-white" OnClick="btnAuctionServiceOrder_Click" /></li>
            <li>
                <asp:Button ID="btnAppraisalServiceOrderForm" runat="server" Text="Appraisal Service Order Form" CausesValidation="false" class="btn  btn-success special shadow-sm text-white" OnClick="btnAppraisalServiceOrderForm_Click" /></li>
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
                            <asp:Label ID="lblTitle" runat="server" Text="Note Title: "></asp:Label>
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
                    <asp:Button ID="Button1" runat="server" Text="Save Note" OnClick="submitNote_Click" CausesValidation="false" class="btn btn-success text-white" />
                </div>
            </div>
        </div>
    </div>



</asp:Content>




