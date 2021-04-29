<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="MoveForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.MoveForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@200;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <style type="text/css">
        .select2-container .select2-selection--single {
            height: 34px !important;
        }

        .select2-container--default .select2-selection--single {
            border: 1px solid #ccc !important;
            border-radius: 0px !important;
        }

        .hidden {
            display: none;
        }

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


        .progress {
            border-radius: 10px;
            width: 85%;
            height: 10px;
            text-align: center;
        }

        .progress-bar {
            border-radius: 0px;
            padding: 0px;
        }

        .wrapper > img {
            position: absolute;
            top: 0;
            left: 0;
            text-align: center;
        }

        .remarkdetail {
            display: none;
        }

        .remark:hover .remarkdetail {
            display: block;
            position: absolute;
            text-align: left;
            width: 350px;
            border-width: 0;
            height: 150px;
            overflow: auto;
            padding: 20px;
            float: right;
            border-radius: 12px;
            background-color: white;
            margin-left: 140px;
            bottom: 100px;
        }


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

        .main-header {
            padding-top: 70px;
            text-align: center;
            font-family: 'Josefin Sans', sans-serif;
            color: darkgreen;
            font-size: 45px;
        }

        .cardhead {
            font-size: 40px;
            font-family: 'Josefin Sans', sans-serif;
            margin-top: 10px;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
            color: black;
            font-weight: bold;
        }

        h4 {
            font-family: 'Josefin Sans', sans-serif;
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
            <h1 class="text-uppercase main-header">Move Assessment</h1>
            <asp:Label ID="lblHeader" runat="server" Text="" Font-Bold="true" Font-Size="Larger"></asp:Label>
        </div>
    </header>
    <section>
        <div class="container">
            <div class="row"></div>
            <div class="col-sm">
                <div class="card">
                    <div style="background-color: #fff2cc">
                        <h2 class="cardhead">Customer Information</h2>
                    </div>
                    <div class="card-body shadow" style="background-color: #f1f8f7">
                        <asp:DetailsView
                            ID="dvCustomerInfo"
                            runat="server" class="quick"
                            HorizontalAlign="Left"
                            DataSourceID="datasrcCustomerInfo"
                            DataKeyNames="customerID"
                            GridLines="Horizontal"
                            BorderWidth="0"
                            AutoGenerateRows="false"
                            Width="400px">
                            <Fields>
                                <asp:CommandField ShowEditButton="true" ButtonType="Image" ControlStyle-CssClass="btn btn-success text-white" ControlStyle-Width="40px" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" />
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

    <section style="background-color: #f1f8f7">
        <div class="container" style="margin-left: 15px;">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2 class="cardhead">Pre-Assessment Information</h2>
                            <asp:Button ID="btnPopulate"
                                runat="server"
                                Text="Populate"
                                OnClick="btnPopulate_Click"
                                CausesValidation="false"
                                class="btn btn-success text-white quick" />
                        </div>
                        <div class="card-body shadow">
                            <h4>Address Information:</h4>
                            <div class="row container">
                                <div class="col">
                                    <asp:Table ID="tblOriginnInfo" runat="server" HorizontalAlign="left" CssClass="quick">
                                        <asp:TableRow Height="50px" VerticalAlign="Top">
                                            <asp:TableCell ColumnSpan="3">
                                                <asp:CheckBox ID="chkbxSame" runat="server" OnCheckedChanged="chkbxSame_CheckedChanged" AutoPostBack="true" />
                                                <asp:Label
                                                    ID="lblchkbx"
                                                    runat="server"
                                                    Text=" Same as Current Customer Home Address?"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblOriginAddress"
                                                    runat="server" Width="175px"
                                                    Text="Origin Street Address: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtOriginAddress"
                                                    runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator11"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtOriginAddress"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblOriginCity"
                                                    runat="server" Width="175px"
                                                    Text="Origin City: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtOriginCity"
                                                    runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator13"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtOriginCity"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblOriginState"
                                                    runat="server" Width="175px"
                                                    Text="Origin State: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtOriginState"
                                                    runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator15"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtOriginState"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblOriginZipCode"
                                                    runat="server" Width="175px"
                                                    Text="Origin Zip Code: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtOriginZipCode"
                                                    runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator12"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtOriginZipCode"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                                <div class="col">
                                    <asp:Table ID="tblDestinationInfo" runat="server" HorizontalAlign="right" CssClass="quick">
                                        <asp:TableRow Height="50px">
                                            <asp:TableCell>
                                            <br />
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblDestAddress"
                                                    runat="server" Width="175px"
                                                    Text="Destination Street Address: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtDestinationAddress"
                                                    runat="server" CssClass="form-control shadow-sm input-small"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator16"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtDestinationAddress"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblDestCity"
                                                    runat="server" Width="175px"
                                                    Text="Destination City: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtDestinationCity"
                                                    runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator17"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtDestinationCity"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblDestState"
                                                    runat="server" Width="175px"
                                                    Text="Destination State: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtDestinationState"
                                                    runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator18"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtDestinationState"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Label
                                                    ID="lblDestZipCode"
                                                    runat="server" Width="175px"
                                                    Text="Destination Zip Code: "></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox
                                                    ID="txtDestinationZipCode"
                                                    runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator20"
                                                    runat="server" ValidationGroup="PreAssessment"
                                                    ErrorMessage="RequiredFieldValidator"
                                                    ControlToValidate="txtDestinationZipCode"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                                <br />
                                <h4>Scheduling Information:</h4>
                                <div class="row container">
                                    <div class="col">
                                        <asp:Table ID="tblSchedulelInfo1" runat="server" HorizontalAlign="Left" class="quick">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label
                                                        ID="lblMoveDate"
                                                        runat="server" Width="175px"
                                                        Text="Date of Move: "></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox
                                                        ID="txtMoveDate"
                                                        runat="server"
                                                        TextMode="Date" CssClass="form-control shadow-sm"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator14"
                                                        runat="server" ValidationGroup="PreAssessment"
                                                        ErrorMessage="RequiredFieldValidator"
                                                        ControlToValidate="txtMoveDate"
                                                        SetFocusOnError="true"
                                                        Text="* Required Field"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label
                                                        ID="lblMoveTime"
                                                        runat="server"
                                                        Text="Time of Move: "></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox
                                                        ID="txtMoveTime"
                                                        runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator22"
                                                        runat="server" ValidationGroup="PreAssessment"
                                                        ErrorMessage="RequiredFieldValidator"
                                                        ControlToValidate="txtMoveTime"
                                                        SetFocusOnError="true"
                                                        Text="* Required Field"
                                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator
                                                        ID="REVTime"
                                                        runat="server"
                                                        ControlToValidate="txtMoveTime"
                                                        ErrorMessage="Must be in hh:mm:ss AM/PM format!"
                                                        ForeColor="Red"
                                                        ValidationExpression="^(([0]?[1-9])|([1][0-2])):(([0-5][0-9])|([1-9])):([0-5][0-9]) [AP][M]$"></asp:RegularExpressionValidator>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>

                                <h4>Add-On Services:</h4>
                                <div class="row container">
                                    <div class="col">
                                        <asp:Table ID="tblAddOns" runat="server" HorizontalAlign="Left" class="quick">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label
                                                        ID="lblAddOns"
                                                        runat="server" Width="175px"
                                                        Text="Add-On Services: "></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell HorizontalAlign="left" Width="400px">
                                                    <br />
                                                    <asp:CheckBox ID="chkbxPacking" runat="server" />
                                                    <asp:Label
                                                        ID="lblPacking"
                                                        runat="server"
                                                        Text=" Packing"></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkbxTrash" runat="server" />
                                                    <asp:Label
                                                        ID="lblTrash"
                                                        runat="server"
                                                        Text=" Trash Removal and Donation Hauling"></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkbxAuction" runat="server" />
                                                    <asp:Label
                                                        ID="lblAuction"
                                                        runat="server"
                                                        Text=" Auction"></asp:Label>

                                                </asp:TableCell>

                                            </asp:TableRow>
                                            <asp:TableRow HorizontalAlign="Left">
                                                <asp:TableCell HorizontalAlign="Left">
                                                    <asp:Label ID="lblDescriptionOfAddOns" runat="server" Text="Add-On Description:" Width="175px"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <br />
                                                    <asp:TextBox ID="txtbxAddOnDesc" runat="server" CssClass="form-control shadow-sm" TextMode="MultiLine" Width="225px"></asp:TextBox>
                                                    <br />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>

                                    <h4>Other Information:</h4>
                                    <div class="row container">
                                        <div class="col">
                                            <asp:Table ID="tblOther" runat="server" HorizontalAlign="Left" class="quick">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label
                                                            ID="lblMLS"
                                                            runat="server" Width="175px"
                                                            Text="MLS Listing? "></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:RadioButtonList ID="rblMLSListing" runat="server">
                                                            <asp:ListItem Text="Yes" />
                                                            <asp:ListItem Text="No" />
                                                        </asp:RadioButtonList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator6"
                                                            runat="server" ValidationGroup="PreAssessment"
                                                            ErrorMessage="RequiredFieldValidator"
                                                            ControlToValidate="rblMLSListing"
                                                            SetFocusOnError="true"
                                                            Text="* Required Field"
                                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                </asp:Table>
                                        </div>
                                        <div class="row container">
                                            <div class="col">
                                                <br />
                                                <asp:Table ID="tblEnd" runat="server">
                                                    <asp:TableRow>
                                                        <asp:TableCell>
                                                            <asp:Button ID="btnSavePreAssessment" runat="server" Text="Save" ValidationGroup="PreAssessment" class="btn btn-success text-white quick" OnClick="btnSavePreAssessment_Click" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Button ID="btnClearPre" runat="server" Text="Clear" ValidationGroup="PreAssessment" class="btn btn-success text-white quick" OnClick="btnClearPre_Click" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Label ID="lblPreNotify" runat="server" Text=""></asp:Label>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
    </section>
    <section style="background-color: #f1f8f7">
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2 class="cardhead">Assessment Information</h2>
                            <asp:Button ID="btnPopulate2"
                                runat="server"
                                Text="Populate"
                                OnClick="btnPopulate2_Click"
                                CausesValidation="false"
                                class="btn btn-success text-white quick" />
                        </div>
                        <div class="card-body shadow">
                            <asp:Table ID="tblAssessmentInfo" runat="server" CellPadding="5" class="quick">
                                <asp:TableRow>
                                    <asp:TableCell VerticalAlign="Middle">
                                        <asp:Label ID="lblTypeOfHome" runat="server" Text="Type of Home: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList ID="ddlTypeOfHome" runat="server" CssClass="form-control shadow-sm input-small custom-select">
                                            <asp:ListItem Text="--Select--" Value="" disabled="disabled" Selected="True" />
                                            <asp:ListItem Text="Apartment" />
                                            <asp:ListItem Text="House" />
                                            <asp:ListItem Text="Storage Unit" />
                                            <asp:ListItem Text="Place of Business" />
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblNumOfFloors" runat="server" Text="Number of Floors: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxNumOfFloors" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator1"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtbxNumOfFloors"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDistance" runat="server" Text="Distance from Truck: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDistance" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator2"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtbxDistance"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDriveway" runat="server" Text="Driveway Accessibility: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDriveway" runat="server" CssClass="form-control shadow-sm" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator3"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtbxDriveway"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell VerticalAlign="middle">
                                        <asp:Label ID="lblLoadingConditions" runat="server" Text="Loading Conditions: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxLoadingConditions" CssClass="form-control shadow-sm" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator4"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtbxLoadingConditions"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell VerticalAlign="middle">
                                        <asp:Label ID="lblOutdoor" runat="server" Text="Outdoor Spaces: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxOutdoor" runat="server" CssClass="form-control shadow-sm" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator5"
                                            runat="server"
                                            ErrorMessage="RequiredFieldValidator"
                                            ControlToValidate="txtbxOutdoor"
                                            SetFocusOnError="true"
                                            Text="* Required Field"
                                            ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblEquipment" runat="server" Text="Special Equipment:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:CheckBoxList
                                            ID="cblEquipment"
                                            runat="server" AutoPostBack="true" DataSourceID="datasrcSpecialEquipment" DataTextField="description"
                                            DataValueField="description" AppendDataBoundItems="true">
                                        </asp:CheckBoxList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <br />
                            <fieldset>
                                <br />
                               <h3 class="quick">Add Furniture by Room Type</h3>
                                <asp:GridView ID="grdvwRooms"
                                    runat="server" ShowFooter="true"
                                    AutoGenerateColumns="false" OnRowCreated="grdvwRooms_RowCreated"
                                    BorderWidth="0" class="quick"
                                    AlternatingRowStyle-BackColor="#F1F8F7">
                                    <Columns>
                                        <asp:BoundField DataField="RowNumber" HeaderText="Room Number" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />

                                        <asp:TemplateField HeaderText="Room Type">
                                            <ItemTemplate>
                                                <asp:DropDownList
                                                    ID="ddlRoomType" runat="server" DataSourceID="datasrcRoomType" AutoPostBack="false"
                                                    DataTextField="roomType" DataValueField="roomType" AppendDataBoundItems="true" class="form-control select2 quick">
                                                    <asp:ListItem Text="--Select--" Value="" disabled="disabled" Selected="True" />
                                                </asp:DropDownList>
                                                <asp:SqlDataSource
                                                    ID="datasrcRoomType" runat="server" ConnectionString="<%$ ConnectionStrings:Lab4 %>" SelectCommand="SELECT DISTINCT roomID, roomType FROM ROOMS"></asp:SqlDataSource>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Furniture">
                                            <ItemTemplate>
                                                <asp:DropDownList
                                                    ID="ddlFurniture" runat="server" DataSourceID="datasrcFurniture" AutoPostBack="false"
                                                    DataTextField="name" DataValueField="name" AppendDataBoundItems="true" class="form-control select2 quick">
                                                    <asp:ListItem Text="--Select--" Value="" disabled="disabled" Selected="True" />
                                                </asp:DropDownList>
                                                <asp:SqlDataSource
                                                    ID="datasrcFurniture" runat="server" ConnectionString="<%$ ConnectionStrings:Lab4 %>" SelectCommand="SELECT furnitureID, name FROM FURNITURE"></asp:SqlDataSource>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity" HeaderStyle-Width="100px" ItemStyle-Width="200px">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtbxQuantity" runat="server" TextMode="Number" Width="60px" CssClass="form-control shadow-sm"></asp:TextBox>
                                                <asp:CompareValidator runat="server"
                                                    ControlToValidate="txtbxQuantity"
                                                    Operator="DataTypeCheck"
                                                    Type="Integer"
                                                    ErrorMessage="Enter a valid integer"
                                                    Display="Dynamic"
                                                    Text="Enter a valid integer" ForeColor="Red" />
                                                <asp:CompareValidator runat="server"
                                                    ControlToValidate="txtbxQuantity"
                                                    Operator="GreaterThanEqual"
                                                    ValueToCompare="0"
                                                    Type="Integer"
                                                    ErrorMessage="The integer cannot be less than zero"
                                                    Display="Dynamic"
                                                    Text="*" ForeColor="Red" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CU" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCU" runat="server" Text="" Width="60px" Font-Bold="true"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total CU" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTOTCU" runat="server" Text="" Width="60px" Font-Bold="true" CssClass="hidden"></asp:Label>
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
                                <asp:Table ID="tblTotals" runat="server" Visible="false" CssClass="quick">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lbltitleFinalTotal" runat="server" Text="Final Total:" Width="100px" Font-Bold="true"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblFinalTotal" runat="server" Text="" Width="60px" Font-Bold="true" ForeColor="Red"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <br />
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                            </fieldset>
                            <div class="container">
                                <div class="row container " style="width: 200px;">
                                    <asp:Button ID="ButtonAdd" runat="server"
                                        Text="Add More Furniture"
                                        OnClick="ButtonAdd_Click" CausesValidation="false" class="btn btn-success text-white" />

                                </div>
                                <%--<div class="row container " style="width: 200px;">
                                    <asp:Button ID="btnCalculate" runat="server"
                                        Text="Calculate Cubic Feet" OnClick="btnCalculate_Click"
                                        CausesValidation="false" class="btn btn-success text-white" />
                                </div>--%>
                                <br />
                                <div class="row container " style="width: 200px;">
                                    <asp:Button ID="btnSaveFurniture" runat="server"
                                        Text="Save Furniture List" OnClick="btnSaveFurniture_Click"
                                        CausesValidation="false" class="btn btn-success text-white" />
                                </div>
                                <div class="row container" style="width: 300px; margin-top: 15px;">
                                    <asp:Label ID="lblNotify" runat="server" Text=""></asp:Label>
                                    <asp:Button ID="btnSave" runat="server" Text="Save Move Assessment Form" OnClick="btnSave_Click"
                                        CausesValidation="false" class="btn btn-success text-white" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>



        <div class="btn-custom">
            <a class="float2 bg-success" href="#popup4" style="padding-top: 10px;">

                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16" class="text-white">
                    <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z" />
                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z" />
                </svg>
                <i class="fa fa-plus my-float"></i>


            </a>
        </div>

        <div id="popup4" class="overlay" style="float: right;">
            <div class="popup shadow-lg pop">
                <h1>Start to Schedule a Service!</h1>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:Label ID="lblService" runat="server" Text="Select Your Service: "></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:DropDownList ID="ddlService" runat="server" CssClass="form-control shadow-sm input-small">
                                    <asp:ListItem Text="--Select--" Value="" disabled="disabled" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="Move Assessment" Value="Move Assessment"></asp:ListItem>
                                    <asp:ListItem Text="Auction Walk Thru" Value="Auction Walk Thru"></asp:ListItem>
                                    <asp:ListItem Text="Packing" Value="Packing"></asp:ListItem>
                                    <asp:ListItem Text="Move" Value="Move"></asp:ListItem>
                                    <asp:ListItem Text="Auction Pick Up" Value="Auction Pick Up"></asp:ListItem>
                                    <asp:ListItem Text="Auction Bring In" Value="Auction Bring In"></asp:ListItem>
                                    <asp:ListItem Text="Appraisal" Value="Appraisal"></asp:ListItem>
                                    <asp:ListItem Text="Consignment Shop Pick Up" Value="Consignment Shop Pick Up"></asp:ListItem>
                                    <asp:ListItem Text="Consignment Shop Bring In" Value="Consignment Shop Bring In"></asp:ListItem>
                                    <asp:ListItem Text="Trash Removal" Value="Trash Removal"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:Label ID="lblDate1" runat="server" Text="Potential Date/Time 1: "></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:TextBox ID="TextBox2" runat="server" Type="date" CssClass="form-control shadow-sm input-small"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:Label ID="lblDate2" runat="server" Text="Potential Date/Time 2: "></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:TextBox ID="txtDate2" runat="server" Type="date" CssClass="form-control shadow-sm input-small"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:Label ID="lblDate3" runat="server" Text="Potential Date/Time 3: "></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:TextBox ID="txtDate3" runat="server" Type="date" CssClass="form-control shadow-sm input-small"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                        <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-success text-white" />
                    </div>
                </div>
            </div>
        </div>


        <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CssClass="btn btn-outline-success floatBtn" OnClick="ImageButton1_Click" ImageUrl="\GVAImages\toggle.svg" Width="60px" Height="60px" />
        <asp:Panel ID="Panel1" runat="server">
            <div id="float3" class="btn-custom shadow-lg">

                <h2 id="forms" runat="server" class="text-white" style="margin-top: 20px;">FORMS
                <asp:ImageButton ID="btnCollapse" CssClass="needPad btn btn-outline-success" runat="server" OnClick="btnCollapse_Click" CausesValidation="false" ImageUrl="\GVAImages\toggle.svg" Width="40" Height="40" /></h2>

                <i class="fa fa-plus my-float"></i>
                <ul>
                    <li>
                        <asp:Button ID="btnMoveAssessmentForm" runat="server" Text="Move Assessment Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnMoveAssessmentForm_Click" CausesValidation="false" /></li>
                    <li>
                        <asp:Button ID="btnMoveServiceOrder" runat="server" Text="Move Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnMoveServiceOrder_Click" CausesValidation="false" /></li>
                     <li>
                        <asp:Button ID="btnAppraisalServiceOrderForm" runat="server" Text="Appraisal Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnAppraisalServiceOrderForm_Click" CausesValidation="false" /></li>
                    <li>
                        <asp:LinkButton ID="lbtnToCustomerFile" runat="server" OnClick="lbtnToCustomerFile_Click" ForeColor="white" CausesValidation="false">Go Back To Move Details</asp:LinkButton></li>
                </ul>

            </div>
        </asp:Panel>

        <div class=" btn-custom">
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
                <h1>Add to Your To Do List!</h1>
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
                                <asp:ListItem Text="Urgent" Value="Urgent" class="btn btn-success text-white"></asp:ListItem>
                                <asp:ListItem Text="Very Urgent" Value="Very Urgent" class="btn btn-danger text-white"></asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                    </div>
                </div>
                <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                    <asp:Button ID="btnSubmitToDO" runat="server" Text="Submit" class="btn btn-success text-white" OnClick="btnSubmitToDO_Click" CausesValidation="false" />
                </div>
            </div>
        </div>



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
                        <asp:Button ID="btnSubmit" runat="server" Text="Save Note" OnClick="submitNote_Click" CausesValidation="false" class="btn btn-success text-white" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="sticky-bottom"></footer>

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
        ID="datasrcSpecialEquipment"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT DISTINCT description FROM SPECIALEQUIPMENT"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcRooms"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"></asp:SqlDataSource>

    <script>
        $('.select2').select2();
    </script>

</asp:Content>




