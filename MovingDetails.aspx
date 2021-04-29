<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="MovingDetails.aspx.cs" Inherits="GreenValleyAuctionsSystem.MovingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="MovingDetailsStyle.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@200;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <style>
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
            width: 200px;
        }
        a:hover {color: #00B74A; }
    </style>

    <br />
    <br />
    <br />
    <br />
    <br />
    <h1>
        <asp:Label ID="newTitle" CssClass="title" runat="server" Text="" Font-Bold="true"></asp:Label></h1>
    <br />
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
                            <asp:CommandField ShowEditButton="true" ButtonType="Image" ControlStyle-CssClass="btn btn-success text-white" ControlStyle-Width="60px" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" />
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
    <section></section>
    <asp:ImageButton ID="ImageButton1" runat="server" Visible="false" CssClass="btn btn-outline-success floatBtn" OnClick="ImageButton1_Click" ImageUrl="\GVAImages\toggle.svg" Width="60px" Height="60px" />
    <asp:Panel ID="Panel1" runat="server">
        <div id="float3" runat="server" class="btn-custom shadow-lg float3">
            <h2 runat="server" id="forms" class="text-white" style="margin-top: 30px;">FORMS 
                <asp:ImageButton ID="btnCollapse" CssClass="needPad btn btn-outline-success" runat="server" OnClick="btnCollapse_Click" ImageUrl="\GVAImages\toggle.svg" Width="40" Height="40" /></h2>

            <i class="fa fa-plus my-float"></i>
            <ul>
                <li>
                    <asp:Button ID="btnMoveAssessmentForm" runat="server" Text="Move Assessment Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnMoveAssessmentForm_Click" /></li>
                <li>
                    <asp:Button ID="btnMoveServiceOrder" runat="server" Text="Move Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnMoveServiceOrder_Click" /></li>
                 <li>
                    <asp:Button ID="btnCompletion" runat="server" Text="Move Completion Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnCompletion_Click" /></li>
                <li>
                    <asp:Button ID="btnAppraisalServiceOrderForm" runat="server" Text="Appraisal Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white" OnClick="btnAppraisalServiceOrderForm_Click" /></li>
                <li>
                    <asp:LinkButton ID="lbtnToCustomerFile" runat="server" OnClick="lbtnToCustomerFile_Click" CausesValidation="false" ForeColor="white">Go Back To Customer File</asp:LinkButton></li>
            </ul>
        </div>
    </asp:Panel>
    <div class="container" style="margin-left: 350px;">
        <div class="container text-center" style="margin-bottom: 60px; margin-top: 70px;">
            <h2 class="text-center" style="color: green;">Ticket Status</h2>
            <asp:Button ID="btnUpdate" CssClass="btn btn-success fourPx" runat="server" Text="Update Status" OnClick="btnUpdate_Click" />
            <div id="divPopUp" runat="server" class="popUpStatus shadow-lg hidden quick" style="right: 280px; bottom: 0px; padding-top: 20px; display: none;">
                <asp:Table ID="tblePopUp" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <div style="float: right;">
                                <asp:Button ID="btnExit" CssClass="btn btn-outline-danger exit" runat="server" Text="X" OnClick="btnExit_Click" />
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                        <h2 class="text-center" style="border-bottom:solid; min-width:495px; color:green;">Update Ticket Status!</h2>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                        <h5>Next Step:</h5>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <div>
                                <asp:CheckBox ID="checkBxCompleted" runat="server" Text="" />
                                <asp:Label ID="lblServiceCompleted" runat="server" Text=""></asp:Label>
                                <br />
                                <br />
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <div style="float: right;">
                                <asp:Button ID="btnTaskCompleted" runat="server" CssClass="btn btn-outline-success twoPx" Text="Completed" OnClick="btnTaskCompleted_Click" />
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>

                </asp:Table>
            </div>

        </div>





        <ul style="width: 1400px;">
            <li id="step1" runat="server" class="list">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2-circle" style="padding-bottom: 10px;" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z" />
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z" />
                </svg>
                <div>
                    <br />
                    <asp:Label ID="status1" runat="server" CssClass="fontBefore text-center" Width="50px" Text=" Schedule Assessment"></asp:Label>
                </div>
            </li>
            <li id="step2" runat="server" class="list">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2-circle" style="padding-bottom: 10px;" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z" />
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z" />
                </svg>
                <div>
                    <br />
                    <asp:Label ID="status2" runat="server" CssClass="fontBefore text-center" Width="50px" Text="Present Estimate"></asp:Label>
                </div>
            </li>
            <li id="step3" runat="server" class="list">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2-circle" style="padding-bottom: 10px;" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z" />
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z" />
                </svg>
                <div>
                    <br />
                    <asp:Label ID="status3" runat="server" CssClass="fontBefore text-center" Width="50px" Text="Estimate Accepted"></asp:Label>
                </div>
            </li>
            <li id="step4" runat="server" class="list">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2-circle" style="padding-bottom: 10px;" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z" />
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z" />
                </svg>
                <div>
                    <br />
                    <asp:Label ID="status4" runat="server" CssClass="fontBefore text-center" Width="50px" Text="Schedule Move"></asp:Label>
                </div>
            </li>
            <li id="step5" runat="server" class="list">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2-circle" style="padding-bottom: 10px;" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z" />
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z" />
                </svg>
                <div>
                    <br />
                    <asp:Label ID="status5" runat="server" CssClass="fontBefore text-center" Width="50px" Text="Move Completed"></asp:Label>
                </div>
            </li>
            <li id="step6" runat="server" class="list">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white" class="bi bi-check2-circle" style="padding-bottom: 10px;" viewBox="0 0 16 16">
                    <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z" />
                    <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z" />
                </svg>
                <div>
                    <br />
                    <asp:Label ID="status6" runat="server" CssClass="fontBefore text-center" Width="50px" Text="Review Completed"></asp:Label>
                </div>
            </li>
            <li id="step8" runat="server" class="list" style="background-color: white; box-shadow: none;">

                <div>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" CssClass="text-white" Width="50px" Text="Review Completed"></asp:Label>
                </div>
            </li>

        </ul>

    </div>

    <section></section>

    <section style="background-color: #f1f8f7;" class="shadow">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card" style="min-height: 458px; max-height: 458px;">
                        <div class="card-header" style="background-color: #fff2cc;">
                            <h2>Moving Details</h2>
                        </div>
                        <div class="card-body">
                            <asp:DetailsView
                                ID="DVMovingDetails"
                                runat="server"
                                DataSourceID="dataSrcMovingDetails"
                                CssClass="quick"
                                AutoGenerateRows="False"
                                AutoGenerateEditButton="false"
                                DataKeyNames="movingServiceID"
                                AlternatingRowStyle-BackColor="#f1f8f7"
                                CellPadding="3"
                                BorderWidth="0"
                                Width="475"
                                HeaderStyle-HorizontalAlign="Left">
                                <Fields>
                                    <asp:CommandField ShowEditButton="true" ButtonType="Image" ControlStyle-CssClass="btn btn-success text-white" ControlStyle-Width="60px" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" />
                                    <asp:BoundField HeaderText="movingServiceID" DataField="movingServiceID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                    <asp:BoundField HeaderText="Move Date: " DataField="dateOfService" ReadOnly="False" ItemStyle-Width="150px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Origin Street Address: " DataField="originStreetAddress" ItemStyle-Width="150px" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Origin City: " DataField="originCity" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Origin State: " DataField="originState" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Origin Zipcode: " DataField="originZipcode" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Destination Street Address: " DataField="destinationStreetAddress" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Destination City: " DataField="destinationCity" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Destination State: " DataField="destinationState" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Destination Zipcode: " DataField="destinationZipcode" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card" style="min-height: 458px; max-height: 458px;">
                        <div class="card-header" style="background-color: #fff2cc;">
                            <h2>Additional Moving Details</h2>
                        </div>
                        <div class="card-body">
                            <asp:DetailsView
                                ID="DVAddMovingDetails"
                                runat="server"
                                CssClass="quick"
                                DataSourceID="dataSrcAddMovingDetails"
                                AutoGenerateRows="False"
                                AutoGenerateEditButton="false"
                                DataKeyNames="movingServiceID"
                                BorderWidth="0px"
                                Width="475px"
                                AlternatingRowStyle-BackColor="#f1f8f7" CellPadding="3" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#266141"
                                HeaderStyle-ForeColor="White">
                                <Fields>
                                    <asp:CommandField ShowEditButton="true" ButtonType="Image" ControlStyle-CssClass="btn btn-success text-white" ControlStyle-Width="60px" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" />
                                    <asp:BoundField HeaderText="movingServiceID" DataField="movingServiceID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                    <asp:BoundField HeaderText="Pricing Retrieved: " DataField="pricingRetrieved" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Estimated Price: " DataField="estimatePrice" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Estimated Time (Hours): " DataField="hourEstimate" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Cost of Supplies: " DataField="supplyCost" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Mileage: " DataField="mileage" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Actual Time (Hours): " DataField="hourFinal" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Fuel: " DataField="fuel" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Insurance: " DataField="insurance" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Food/Hotel: " DataField="foodAndHotel" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                    <asp:BoundField HeaderText="Number of Workers: " DataField="men" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                </Fields>
                            </asp:DetailsView>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <a href="" class="heading" data-toggle="collapse" data-parent="#accordian" data-target="#c3">Vehicles</a>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c3">
                                    <asp:ImageButton ID="addVehicle" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success" OnClick="addVehicle_Click" ControlStyle-Width="60px" />
                                    <br />
                                    <p>

                                        <asp:GridView
                                            ID="grdvwVehicleTable"
                                            runat="server"
                                            DataSourceID="datasrcVehicle"
                                            AutoGenerateEditButton="false"
                                            AutoGenerateColumns="false"
                                            DataKeyNames="equipmentServiceID"
                                            GridLines="Horizontal"
                                            CssClass="quick"
                                            BorderWidth="0px"
                                            Width="450px"
                                            HeaderStyle-Font-Underline="true"
                                            EmptyDataText="No Vehicles associated with this service."
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="3" HeaderStyle-HorizontalAlign="Left"
                                            HeaderStyle-ForeColor="#1C593F">
                                            <Columns>
                                                <asp:BoundField HeaderText="equipmentServiceID" DataField="equipmentServiceID" SortExpression="equipmentServiceID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="Name" DataField="description" SortExpression="description" ItemStyle-Width="330px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                                <asp:CommandField HeaderText="Remove" ShowDeleteButton="true" ButtonType="Image" ControlStyle-Width="70px" ControlStyle-CssClass="btn" DeleteImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="80px" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:Table ID="tbleAdd" runat="server" CellPadding="5">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="ddlVehicles" runat="server" class="form-control select2 quick" Visible="false" Width="160px" AutoPostBack="false"></asp:DropDownList>

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:ImageButton ID="btnNewVehicle" runat="server" ImageUrl="\GVAImages\save.svg" CssClass="btn btn-success btnNew" Visible="false" OnClick="btnNewVehicle_Click" ControlStyle-Width="60px" />
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:ImageButton ID="btnCancelVehicle" runat="server" ImageUrl="\GVAImages\cancel.svg" CssClass="btn btn-success btnNew" Visible="false" OnClick="btnCancelVehicle_Click"
                                                        ControlStyle-Width="60px" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>

                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm ">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc"><a class="heading" href="" data-toggle="collapse" data-parent="#accordian" data-target="#c4">Notes</a></div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c4">
                                    <br />
                                    <p>
                                        <asp:GridView ID="grdvwNotesTable"
                                            DataSourceID="dataSrcNote"
                                            runat="server"
                                            AutoGenerateColumns="false"
                                            AutoGenerateEditButton="false"
                                            DataKeyNames="noteID"
                                            CssClass="quick"
                                            BorderWidth="0"
                                            GridLines="Horizontal"
                                            Width="650"
                                            HeaderStyle-Font-Underline="true"
                                            EmptyDataText="No workflows associated with that customer."
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="5" CellSpacing="5" HeaderStyle-HorizontalAlign="Left"
                                            HeaderStyle-ForeColor="#1C593F">
                                            <Columns>
                                                <asp:BoundField HeaderText="noteID" DataField="noteID" SortExpression="noteID" ItemStyle-Width="100px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="employeeID" DataField="employeeID" SortExpression="employeeID" ItemStyle-Width="100px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="serviceID" DataField="serviceID" SortExpression="serviceID" ItemStyle-Width="80px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="Name" DataField="FullName" SortExpression="FullName" ItemStyle-Width="220px" ReadOnly="true" />
                                                <asp:BoundField HeaderText="Note Title" DataField="noteTitle" SortExpression="noteTitle" ItemStyle-Width="272px" ReadOnly="false" ControlStyle-CssClass="btn btn-1" />
                                                <asp:TemplateField HeaderText="Note" ItemStyle-Width="60px">
                                                    <ItemTemplate>
                                                        <div class='remark'>
                                                            <%#  Convert.ToString(Eval("noteBody")).Length >0? 
                                                "<span class='btn btn-outline-success' style='width:50px; padding: 2px;'>view</span>" : "" %>
                                                            <div id="divPopup" class="remarkdetail shadow-lg">
                                                                <h3>
                                                                    <asp:Label ID="lblNote" runat="server" Text="Note" ForeColor="#1C593F" Font-Size="Large" Font-Underline="true" Font-Bold="true"></asp:Label></h3>
                                                                <%# Convert.ToString(Eval("noteBody")).Replace("\n","<br/>") %>
                                                            </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField HeaderText="Remove" ShowDeleteButton="true" ButtonType="Image" ControlStyle-Width="50px" ControlStyle-CssClass="btn" DeleteImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="50px" />
                                            </Columns>
                                        </asp:GridView>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <a class="heading" href="" data-toggle="collapse" data-target="#c5" data-parent="#accordian">Crew Members</a>

                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c5">
                                    <asp:ImageButton ID="addEmp" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success " OnClick="addEmp_Click" ControlStyle-Width="60px" />
                                    <br />
                                    <p>
                                        <asp:GridView ID="grdvwCrew"
                                            runat="server"
                                            DataSourceID="dataSrcCrew"
                                            AutoGenerateEditButton="false"
                                            AutoGenerateColumns="false"
                                            DataKeyNames="crewID"
                                            CssClass="quick"
                                            GridLines="Horizontal"
                                            BorderWidth="0px"
                                            Width="450px"
                                            EmptyDataText="No employees associated with this Service."
                                            HeaderStyle-Font-Underline="true"
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="3" HeaderStyle-HorizontalAlign="Left"
                                            HeaderStyle-ForeColor="#1C593F">
                                            <Columns>
                                                <asp:BoundField HeaderText="crewID" DataField="crewID" SortExpression="crewID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="Name" DataField="fullName" SortExpression="fullName" ItemStyle-Width="390px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                                <asp:CommandField HeaderText="Remove" ShowDeleteButton="true" ButtonType="Image" ControlStyle-Width="70px" ControlStyle-CssClass="btn" DeleteImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="90px" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:Table ID="tbleEmp" runat="server" CellPadding="5">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="ddlEmp" Visible="false" Width="180px" runat="server" class="form-control select2 quick" AutoPostBack="false"></asp:DropDownList>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:ImageButton ID="btnNewEmp" runat="server" ImageUrl="\GVAImages\save.svg" CssClass="btn btn-success btnNew" Visible="false" OnClick="btnNewEmp_Click" ControlStyle-Width="60px" />
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:ImageButton ID="btnCancelEmp" runat="server" ImageUrl="\GVAImages\cancel.svg" CssClass="btn btn-success btnNew" Visible="false" OnClick="btnCancelEmp_Click" ControlStyle-Width="60px" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>

                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <a class="heading" href="" data-toggle="collapse" data-parent="#accordian" data-target="#c6">Furniture to be Moved</a>

                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c6">
                                    <asp:ImageButton ID="addRoom" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success" OnClick="addRoom_Click" ControlStyle-Width="60px" />

                                    <br />
                                    <p>
                                        <asp:GridView ID="grdvwRoomTable"
                                            runat="server"
                                            DataSourceID="dataSrcRoom"
                                            AutoGenerateEditButton="false"
                                            AutoGenerateColumns="false"
                                            DataKeyNames="furnitureID"
                                            CssClass="quick"
                                            GridLines="Horizontal"
                                            BorderWidth="0px"
                                            Width="650px"
                                            HeaderStyle-Font-Underline="true"
                                            EmptyDataText="No Furniture associated with this Service."
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-HorizontalAlign="Left"
                                            HeaderStyle-ForeColor="#1C593F">
                                            <Columns>
                                                <asp:BoundField HeaderText="furnitureID" DataField="furnitureID" SortExpression="furnitureID" ItemStyle-Width="0px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="Name" DataField="name" SortExpression="name" ItemStyle-Width="210px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                                <asp:BoundField HeaderText="Room" ControlStyle-ForeColor="#266141" DataField="roomType" SortExpression="roomType" ItemStyle-Width="170px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                                <asp:BoundField HeaderText="Quanity" DataField="quantity" ControlStyle-ForeColor="#266141" SortExpression="quantity" ItemStyle-Width="110px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                                <asp:BoundField HeaderText="CU" DataField="cubicUnit" ControlStyle-ForeColor="#266141" SortExpression="cubicUnit" ItemStyle-Width="110px" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:Table ID="tbleAddRoom" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:ImageButton ID="btnNewRoom" runat="server" ImageUrl="\GVAImages\save.svg" CssClass="btn btn-success btnNew" Visible="false" OnClick="btnNewRoom_Click" ControlStyle-Width="60px" />
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:ImageButton ID="btnCancelRoom" runat="server" ImageUrl="\GVAImages\cancel.svg" CssClass="btn btn-success btnNew" Visible="false" OnClick="btnCancelRoom_Click" ControlStyle-Width="60px" />
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="ddlName" runat="server" Visible="false" Width="200px" class="form-control select2 quick" AutoPostBack="false"></asp:DropDownList>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="ddlRoom" runat="server" Visible="false" Width="200px" class="form-control select2 quick" AutoPostBack="false"></asp:DropDownList>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="quantitySelector" TextMode="Number" runat="server" Visible="false" ControlStyle-CssClass="form-control shadow-sm input-small txtMarg" ControlStyle-Width="55px" />

                                                    <asp:CompareValidator runat="server"
                                                        ControlToValidate="quantitySelector"
                                                        Operator="DataTypeCheck"
                                                        Type="Integer"
                                                        ErrorMessage="Enter a valid integer"
                                                        Display="Dynamic"
                                                        Text="*" />

                                                    <asp:CompareValidator runat="server"
                                                        ControlToValidate="quantitySelector"
                                                        Operator="GreaterThanEqual"
                                                        ValueToCompare="0"
                                                        Type="Integer"
                                                        ErrorMessage="The integer cannot be less than zero"
                                                        Display="Dynamic"
                                                        Text="*" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>

                                        <br />
                                        <asp:Label ID="lblTotalCU" CssClass="quick font-weight-bold" runat="server" Text=""></asp:Label>

                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

     <%--   <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <a class="heading" href="" data-toggle="collapse" data-parent="#accordian" data-target="#c7">PDF/Document</a>

                            <div id="divFile1" runat="server" style="float: left; width: 270px;" class=" hidden">
                                <input id="oFile" type="file" runat="server" name="oFile" />
                            </div>
                            <div id="divFile2" runat="server" class="hidden" style="float: left;">
                                <asp:ImageButton ID="btnUploads" Width="60px" ImageUrl="\GVAImages\save.svg" runat="server" CssClass="btn btn-success text-white twoPx" OnClick="btnUploads_Click" />
                                <asp:ImageButton ID="btnCancelUploads" Width="60px" ImageUrl="\GVAImages\cancel.svg" runat="server" CssClass="btn btn-success text-white twoPx" OnClick="btnCancelUploads_Click" />
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c7">
                                    <asp:ImageButton ID="btnAddDoc" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success" OnClick="btnAddDoc_Click" ControlStyle-Width="60px" />
                                    <br />
                                    <p>

                                        <asp:GridView ID="grdDocuments"
                                            runat="server"
                                            DataSourceID="datasrcDocuments"
                                            AutoGenerateEditButton="false"
                                            AutoGenerateColumns="false"
                                            CssClass="quick"
                                            OnRowCommand="grdDocuments_RowCommand"
                                            DataKeyNames="fileID"
                                            GridLines="Horizontal"
                                            BorderWidth="0px"
                                            Width="450px"
                                            HeaderStyle-Font-Underline="true"
                                            EmptyDataText="No Documents associated with this Service."
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-HorizontalAlign="Left"
                                            HeaderStyle-ForeColor="#1C593F">
                                            <Columns>
                                                <asp:BoundField HeaderText="fileID" DataField="fileID" SortExpression="fileID" ItemStyle-Width="0px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                                <asp:TemplateField HeaderText="File" ControlStyle-Width="312px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" Text='<%#Eval("fileName") %>' CommandArgument='<%#Eval("fileName") %>' CommandName="view"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remove">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" CommandArgument='<%#Eval("fileName") %>' HeaderStyle-CssClass="hidden" ControlStyle-Width="70px" ControlStyle-CssClass="btn" ImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="90px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </p>
                                    <asp:Label ID="lblUploadResult1" runat="server" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card" style="max-height: 450px;">
                        <div class="card-header" style="background-color: #fff2cc">
                            <a class="heading" href="" data-parent="#accordian" data-toggle="collapse" data-target="#c8">Images</a>

                            <br />
                            <div id="divFiles2" runat="server" style="float: left; width: 270px;" class=" hidden">
                                <input id="imageFile" type="file" runat="server" name="imageFile" />
                            </div>
                            <div id="divImages2" runat="server" class="hidden" style="float: left;">
                                <asp:ImageButton ID="btnImageUpload" Width="60px" ImageUrl="\GVAImages\save.svg" runat="server" CssClass="btn btn-success text-white twoPx" OnClick="btnImageUpload_Click" />
                                <asp:ImageButton ID="btnCancelImage" Width="60px" ImageUrl="\GVAImages\cancel.svg" runat="server" CssClass="btn btn-success text-white twoPx" OnClick="btnCancelImage_Click" />
                            </div>

                        </div>
                        <div class="card-body overflow-auto">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c8">
                                    <asp:ImageButton ID="btnAddImage" runat="server" ImageUrl="\GVAImages\plus.svg" CssClass="btn btn-success" OnClick="btnAddImage_Click" ControlStyle-Width="60px" />
                                    <br />
                                    <p>
                                        <asp:GridView ID="grdImages"
                                            runat="server"
                                            DataSourceID="datasrcImages"
                                            AutoGenerateEditButton="false"
                                            AutoGenerateColumns="false"
                                            OnRowCommand="grdImages_RowCommand"
                                            DataKeyNames="fileID"
                                            GridLines="Horizontal"
                                            BorderWidth="0px"
                                            Width="450px"
                                            HeaderStyle-Font-Underline="true"
                                            EmptyDataText="No Images associated with this Service."
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-HorizontalAlign="Left"
                                            HeaderStyle-ForeColor="#1C593F">
                                            <Columns>
                                                <asp:BoundField HeaderText="fileID" DataField="fileID" SortExpression="fileID" ItemStyle-Width="0px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden databind" />
                                                <asp:TemplateField HeaderText="Image" ControlStyle-Width="340px">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imageEnlarge" ImageUrl='<%#Eval("fileName") %>' CommandArgument='<%#Eval("fileName") %>' CommandName="view" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remove">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" CommandArgument='<%#Eval("fileName") %>' ControlStyle-Width="70px" ControlStyle-CssClass="btn" ImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="90px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </p>
                                    <asp:Label ID="lblUploadResult2" runat="server" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>--%>

       <%-- <asp:SqlDataSource
            ID="datasrcImages"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT fileID, '\CustomerFiles\' +  fileName AS fileName FROM dbo.[FILE], dbo.SERVICE WHERE SERVICE.serviceID = [FILE].serviceID AND fileType = 'Image' AND SERVICE.serviceID = @serviceID"
            DeleteCommand="DELETE FROM dbo.[FILE] WHERE [FILE].fileID = @fileID"
            OnDeleted="datasrcImages_Deleted">
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource
            ID="datasrcDocuments"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT fileID, fileName FROM dbo.[FILE], dbo.SERVICE WHERE SERVICE.serviceID = [FILE].serviceID AND fileType = 'Information File or Contract' AND SERVICE.serviceID = @serviceID"
            DeleteCommand="DELETE FROM dbo.[FILE] WHERE [FILE].fileID = @fileID"
            OnDeleted="datasrcDocuments_Deleted">
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
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
            ID="datasrcCrew"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT CREW.crewID, SERVICE.serviceID, EMPLOYEE.firstName + ' ' +  EMPLOYEE.lastName AS fullName FROM dbo.EMPLOYEE,dbo.CREW, dbo.SERVICE WHERE EMPLOYEE.employeeID = CREW.employeeID AND SERVICE.serviceID = CREW.serviceID AND SERVICE.serviceID = @serviceID"
            DeleteCommand="DELETE FROM dbo.CREW WHERE CREW.crewID = @crewID">
            <DeleteParameters>
                <asp:Parameter Name="crewID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource
            ID="datasrcVehicle"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT EQUIPMENTSERVICE.equipmentServiceID, EQUIPMENT.description FROM dbo.EQUIPMENT,dbo.EQUIPMENTSERVICE, dbo.SERVICE WHERE EQUIPMENT.equipmentID = EQUIPMENTSERVICE.equipmentID AND SERVICE.serviceID = EQUIPMENTSERVICE.serviceID AND SERVICE.serviceID = @serviceID "
            DeleteCommand="DELETE FROM dbo.EQUIPMENTSERVICE WHERE EQUIPMENTSERVICE.equipmentServiceID = @equipmentServiceID">
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="equipmentServiceID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>




        <asp:SqlDataSource
            ID="dataSrcNote"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT EMPLOYEENOTE.noteID, EMPLOYEE.employeeID,SERVICE.serviceID, EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as FullName, EMPLOYEENOTE.noteTitle, EMPLOYEENOTE.noteBody FROM dbo.EMPLOYEE,dbo.EMPLOYEENOTE, dbo.SERVICE WHERE EMPLOYEE.employeeID = EMPLOYEENOTE.employeeID AND SERVICE.serviceID = EMPLOYEENOTE.serviceID AND SERVICE.serviceID = @serviceID "
            DeleteCommand="DELETE FROM dbo.EMPLOYEENOTE WHERE EMPLOYEENOTE.noteID = @noteID">
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="noteID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>



        <asp:SqlDataSource
            ID="datasrcRoom"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT FURNITURE.furnitureID, FURNITURE.name, ROOMS.roomType, FURNITURESERVICE.quantity, FURNITURE.cubicUnit FROM dbo.FURNITURE, dbo.FURNITURESERVICE, dbo.MOVINGSERVICE, dbo.ROOMS, dbo.SERVICE WHERE FURNITURE.furnitureID = FURNITURESERVICE.furnitureID AND ROOMS.roomID = FURNITURESERVICE.roomID AND FURNITURESERVICE.serviceID = SERVICE.serviceID AND MOVINGSERVICE.serviceID = SERVICE.serviceID  AND SERVICE.serviceID = @serviceID">
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>



        <asp:SqlDataSource
            ID="dataSrcMovingDetails"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="Select MOVINGSERVICE.movingServiceID, CONVERT(varchar, MOVINGSERVICE.dateOfService,107) as dateOfService ,MOVINGSERVICE.originStreetAddress, MOVINGSERVICE.originCity, MOVINGSERVICE.originState, MOVINGSERVICE.originZipcode, MOVINGSERVICE.destinationStreetAddress, MOVINGSERVICE.destinationCity, MOVINGSERVICE.destinationState, MOVINGSERVICE.destinationZipcode FROM dbo.MOVINGSERVICE, dbo.SERVICE WHERE MOVINGSERVICE.serviceID = SERVICE.serviceID AND SERVICE.serviceID = @serviceID"
            UpdateCommand="UPDATE MOVINGSERVICE SET dateOfService=@dateOfService, originStreetAddress= @originStreetAddress, originCity= @originCity, originState= @originState, originZipcode = @originZipcode, destinationStreetAddress = @destinationStreetAddress, destinationCity=@destinationCity, destinationState = @destinationState, destinationZipcode = @destinationZipcode FROM MOVINGSERVICE, dbo.SERVICE WHERE MOVINGSERVICE.serviceID = SERVICE.serviceID AND SERVICE.serviceID = @serviceID">
            <UpdateParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
                <asp:Parameter Name="dateOfService" Type="String" />
                <asp:Parameter Name="originStreetAddress" Type="String" />
                <asp:Parameter Name="originCity" Type="String" />
                <asp:Parameter Name="originState" Type="String" />
                <asp:Parameter Name="originZipcode" Type="String" />
                <asp:Parameter Name="destinationStreetAddress" Type="String" />
                <asp:Parameter Name="destinationCity" Type="String" />
                <asp:Parameter Name="destinationState" Type="String" />
                <asp:Parameter Name="destinationZipcode" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource
            ID="dataSrcAddMovingDetails"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="Select MOVINGSERVICE.movingServiceID, MOVINGSERVICE.pricingRetrieved, MOVINGSERVICE.estimatePrice, MOVINGSERVICE.hourEstimate, MOVINGSERVICE.supplyCost, MOVINGSERVICE.mileage, MOVINGSERVICE.hourFinal, MOVINGSERVICE.fuel, MOVINGSERVICE.insurance, MOVINGSERVICE.foodAndHotel, MOVINGSERVICE.men FROM dbo.MOVINGSERVICE, dbo.SERVICE WHERE MOVINGSERVICE.serviceID = SERVICE.serviceID AND MOVINGSERVICE.serviceID = @serviceID"
            UpdateCommand="UPDATE MOVINGSERVICE SET pricingRetrieved= @pricingRetrieved, estimatePrice= @estimatePrice, hourEstimate= @hourEstimate, supplyCost = @supplyCost, mileage = @mileage, hourFinal=@hourFinal, fuel = @fuel, insurance =@insurance, foodAndHotel = @foodAndHotel, men=@men  FROM dbo.MOVINGSERVICE, dbo.SERVICE WHERE MOVINGSERVICE.serviceID = dbo.SERVICE.serviceID AND SERVICE.serviceID = @serviceID">
            <UpdateParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
                <asp:Parameter Name="pricingRetrieved" Type="String" />
                <asp:Parameter Name="estimatePrice" Type="String" />
                <asp:Parameter Name="hourEstimate" Type="String" />
                <asp:Parameter Name="supplyCost" Type="String" />
                <asp:Parameter Name="mileage" Type="String" />
                <asp:Parameter Name="hourFinal" Type="String" />
                <asp:Parameter Name="fuel" Type="String" />
                <asp:Parameter Name="insurance" Type="String" />
                <asp:Parameter Name="foodAndHotel" Type="String" />
                <asp:Parameter Name="men" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="serviceID" SessionField="serviceID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <div class="btn-custom">
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
                                <asp:Label ID="lblTitle" runat="server" Text="Note Title: " CssClass="quick"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:TextBox ID="txtTitle" runat="server" Placeholder="Enter Note Title" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                            </div>
                        </div>

                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:Label ID="lblBody" runat="server" Text="Note Body: " CssClass="quick"></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:TextBox ID="txtBody" runat="server" Placeholder="Enter Note Body" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save Note" OnClick="btnSubmit_Click" class="btn btn-success text-white quick" />
                    </div>
                </div>
            </div>
        </div>



        <div class="btn-custom">
            <a class="float bg-success" href="#popup1" style="padding-top: 10px;">

                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-plus-circle text-white" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                </svg>
                <i class="fa fa-plus my-float"></i>


            </a>
        </div>

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
                <h1>Add to your to do List!</h1>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <div class="container row">
                        <div class="col-md-12">
                            <div class="form-group md-form mb-0">
                                <label class="quick">To Do List Item:</label>
                                <asp:TextBox runat="server" ID="txtbxToDoItem" CssClass="form form-control input-sm quick"></asp:TextBox>
                                <%-- <input type="address" class="form-control shadow-sm imput-small" id="inputtodoitem" aria-describedby="emailHelp" placeholder="Enter To Do List Item ">--%>
                            </div>
                        </div>
                    </div>
                    <div class="container row">
                        <div class="col-md-12">
                            <div class="form-group mb-0">
                                <label class="quick">Description:</label>
                                <asp:TextBox runat="server" ID="txtbxToDoDescription" CssClass="form form-control input-sm quick"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="container row">
                        <div class="col-md-12">
                            <div class="form-group mb-0">
                                <label class="quick">Deadline Date:</label>
                                <asp:TextBox runat="server" ID="todoDeadlineDate" TextMode="Date" CssClass="form form-control input-sm quick"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="container row text-center" style="margin-top: 15px; margin-bottom: 15px;">
                        <div class="col-sm">
                            <asp:RadioButtonList ID="rblUrgent" runat="server" RepeatDirection="Horizontal" class=" container col-md-12 text-center">
                                <asp:ListItem Text="Urgent" Value="Urgent" class="btn btnToDo btn-success text-white quick"></asp:ListItem>
                                <asp:ListItem Text="Very Urgent" Value="Very Urgent" class="btn btnToDo btn-danger text-white quick"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
                <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                    <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-success text-white quick" OnClick="btnSubmitToDo_Click" />
                </div>
            </div>
        </div>





        <asp:Label ID="lblHelp" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />

        <br />
        <br />
        <br />

        <br />
        <br />
        <br />


    </section>
    <script>
        $('.select2').select2();
    </script>

    <footer class="sticky-bottom"></footer>

</asp:Content>




