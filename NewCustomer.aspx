<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="GreenValleyAuctionsSystem.NewCustomer" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@200;400&display=swap" rel="stylesheet">

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

        .card-header {
            background-color: #fff2cc;
            font-size: 40px;
            font-family: 'Josefin Sans', sans-serif;
        }




        .special {
            margin: 20px;
            width: 200px;
            font-family: 'Quicksand', sans-serif;
            font-size: 13px;
            height: 50px;
        }

        #cellSaveButton {
            margin: 15px;
        }

        #cellCustomerFileButton {
            margin: 15px;
        }

        .hidden {
            display: none;
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
            color: black;
            font: bold;
        }
    </style>

    <br />
    <br />
    <br />
    <br />
    <br />
    <%-- <div id="float3" class="btn-custom shadow-lg">

        <h2 class="text-white" style="margin-top: 20px;">FORMS</h2>
        <i class="fa fa-plus my-float"></i>
         <ul>
    <li>
        <asp:Button ID="btnInitialContactForm" runat="server" Text="Initial Contact Form" OnClick="btnInitialContactForm_Click" class="btn btn-lg btn-success special shadow-sm text-white quick" /></li>
    <li>
        <asp:Button ID="btnAuctionServiceOrder" runat="server" Text="Auction Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white quick" OnClick="btnAuctionServiceOrder_Click" /></li>
    <li>
        <asp:Button ID="btnAuctionAssessmentForm" runat="server" Text="Auction Assessment Form" class="btn btn-lg btn-success special shadow-sm text-white quick" OnClick="btnAuctionAssessmentForm_Click" /></li>
    <li>
        <asp:Button ID="btnAppraisalServiceOrderForm" runat="server" Text="Appraisal Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white quick" OnClick="btnAppraisalServiceOrderForm_Click" /></li>
    <li>
        <asp:Button ID="btnMoveAssessmentForm" runat="server" Text="Move Assessment Form" class="btn btn-lg btn-success special shadow-sm text-white quick" OnClick="btnMoveAssessmentForm_Click" /></li>
    <li>
        <asp:Button ID="btnMoveServiceOrder" runat="server" Text="Move Service Order Form" class="btn btn-lg btn-success special shadow-sm text-white quick" OnClick="btnMoveServiceOrder_Click" /></li>
    </ul>

    </div>--%>

    <h1 class="text-uppercase">Initial Contact Form</h1>
    <asp:Table ID="tblDirectory" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnNewCustomer" runat="server" Text="New Customer" CssClass="btn btn-success text-white quick" OnClick="btnNewCustomer_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnExistingCustomer" runat="server" Text="Existing Customer" CssClass="btn btn-success text-white quick" BackColor="Gray" OnClick="btnExistingCustomer_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <section style="background-color: #f1f8f7;">
        <div class="container">

            <div class="card shadow">
                <div class="card-header">
                    <h2>Add New Customer</h2>
                    <asp:Button ID="btnPopulate" runat="server" Text="Populate" CssClass="btn btn-success text-white quick" OnClick="btnPopulate_Click" />
                    <asp:Button ID="btnGoToCustomerFile" runat="server" Text="Go To Customer File" OnClick="btnGoToCustomerFile_Click" CssClass="btn btn-success text-white quick" Visible="false" />
                </div>
                <div class="card-body">
                    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblFName" runat="server" CssClass="quick" Text="Customer First Name:"></asp:Label>

                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxFName" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFName" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxFName" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblLName" runat="server" CssClass="quick" Text=" Customer Last Name: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxLName" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxLName" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblHowTheyHeard" runat="server" CssClass="quick" Text="How did you hear about us?"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlHowTheyHeard" CssClass="quick" runat="server">
                                    <asp:ListItem Text="Word of Mouth" Value="Word of Mouth"></asp:ListItem>
                                    <asp:ListItem Text="Facebook" Value="Facebook"></asp:ListItem>
                                    <asp:ListItem Text="Google" Value="Google"></asp:ListItem>
                                    <asp:ListItem Text="Website" Value="Website"></asp:ListItem>
                                    <asp:ListItem Text="Realtor" Value="Realtor"></asp:ListItem>
                                    <asp:ListItem Text="Mailings" Value="Mailings"></asp:ListItem>
                                    <asp:ListItem Text="Newspaper" Value="Newspaper"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblPhoneNumber" runat="server" CssClass="quick" Text="Phone Number: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxPhoneNumber" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxPhoneNumber" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblPhoneType" runat="server" CssClass="quick" Text=" Phone Type: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlPhoneType" runat="server" CssClass=" shadow-sm quick">
                                    <asp:ListItem
                                        Text="Home"
                                        Value="Home">
                                    </asp:ListItem>
                                    <asp:ListItem
                                        Text="Cell"
                                        Value="Cell">
                                    </asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblEmail" runat="server" CssClass="quick" Text="Email: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxEmail" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxEmail" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblPrefferedMethodofContact" runat="server" CssClass="quick" Text="Preferred Method of Contact:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlPrefferedContact" CssClass="quick" runat="server">
                                    <asp:ListItem Text="Phone Call"></asp:ListItem>
                                    <asp:ListItem Text="Text"></asp:ListItem>
                                    <asp:ListItem Text="Email"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblMethodOfContact" runat="server" CssClass="quick" Text="Method of Initial Contact: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxMethodOfContact" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMethodOfContact" CssClass="quick" runat="server" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxMethodOfContact" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblServices" runat="server" CssClass="quick" Text="Service of Interest: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlServiceOfInterest" CssClass="quick" runat="server">
                                    <asp:ListItem Text="Auction"></asp:ListItem>
                                    <%-- <asp:ListItem Text="Appraisal"></asp:ListItem>--%>
                                    <asp:ListItem Text="Move"></asp:ListItem>
                                    <%--<asp:ListItem Text="Consignment"></asp:ListItem>--%>
                                    <asp:ListItem Text="Combination"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCustomerStreet" runat="server" CssClass="quick" Text="Street Address: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxCustomerStreet" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCustStreet" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxCustomerStreet" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCustomerCity" runat="server" CssClass="quick" Text="City: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxCustomerCity" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCustCity" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxCustomerCity" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCustomerState" runat="server" CssClass="quick" Text="State: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxCustomerState" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCustState" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxCustomerState" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCustomerZipCode" runat="server" CssClass="quick" Text="ZipCode: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxCustomerZipCode" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCustZip" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxCustomerZipCode" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="deadlineDate" runat="server" CssClass="quick" Text="Deadline Date:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtbxDeadlineDate" runat="server" TextMode="Date" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDeadlineDate" runat="server" CssClass="quick" ErrorMessage="This Field is Required!" ForeColor="Red" ControlToValidate="txtbxDeadlineDate" ValidationGroup="customerInfo"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>

            <div class="btn-custom">
                <a class="float2 bg-success" href="#popup2" style="padding-top: 10px;">

                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-journal-text text-white" viewBox="0 0 16 16">
                        <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z" />
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z" />
                    </svg>
                    <i class="fa fa-plus my-float"></i>


                </a>
            </div>

        </div>


        <div id="popup2" class="overlay" style="float: right;">
            <div class="popup shadow-lg pop">
                <h1>Add a Note!</h1>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:Label ID="lblTitle" runat="server" CssClass="quick" Text="Note Title: "></asp:Label>
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
                                <asp:Label ID="lblBody" runat="server" CssClass="quick" Text="Note Body: "></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group md-form mb-0">
                                <asp:TextBox ID="txtBody" runat="server" Placeholder="Enter Note Body" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save Note" OnClick="submitNote_Click" class="btn btn-success text-white quick" />
                    </div>
                </div>
            </div>
        </div>



        <div class="container">
            <div class="col-md-12" style="justify-content: center;">
                <asp:Button ID="btnSave" runat="server" Text="Save New Contact" CssClass="btn btn-lg btn-success shadow  text-white quick" OnClick="btnSave_Click" CausesValidation="true" ValidationGroup="customerInfo" />

                <div style="justify-content: center; margin-top: 25px;">

                    <asp:Label ID="lblConfirmation" runat="server" Text="" CssClass="alert alert-success arrow-left quick" Visible="false"></asp:Label>
                </div>
            </div>
        </div>

    </section>
    <h1 runat="server" id="serviceRequest" class="hidden">New Customer's Service Request</h1>
    <div class="container">
        <div class="row">
            <div class="col-sm">
                <div runat="server" id="auctionCard" class="card shadow hidden">
                    <div runat="server" id="auctionCardHeader" class="card-header hidden">
                        <h2 runat="server" id="auctionRequest" class="hidden">Auction</h2>
                    </div>
                    <fieldset id="fieldset1" style="margin: 10px;">
                        <div class="container">
                            <asp:Table ID="Table3" runat="server" HorizontalAlign="Left" Visible="false">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPickupStreet" runat="server" CssClass="quick" Text="Pickup Street Address: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxPickupStreet" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPickupCity" runat="server" CssClass="quick" Text="Pickup City: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxPickupCity" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPickupState" runat="server" CssClass="quick" Text="Pickup State: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxPickupState" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPickupZipCode" runat="server" CssClass="quick" Text="Pickup Zip Code: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxPickupZipCode" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </fieldset>
                </div>
            </div>


            <div class="col-sm">
                <div runat="server" id="moveCard" class="card shadow hidden overflow-auto" style="max-height: 350px">
                    <div runat="server" id="moveCardHeader" class="card-header hidden">
                        <h2 runat="server" id="moveRequest" class="hidden">Move</h2>
                    </div>
                    <div class="container overflow-auto">
                        <div class="card-body">
                            <asp:Table ID="Table4" runat="server" HorizontalAlign="Right" Visible="false" Style="margin: 10px;" CssClass="overflow-auto">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentStreet" runat="server" CssClass="quick" Text="Current Street Address: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentStreet" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentCity" runat="server" CssClass="quick" Text="Current City: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentCity" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentState" runat="server" CssClass="quick" Text="Current State: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentState" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentZipCode" runat="server" CssClass="quick" Text="Current ZipCode: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentZipCode" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationStreet" runat="server" CssClass="quick" Text="Destination Street Address: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDestinationStreet" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationCity" runat="server" CssClass="quick" Text="Destination City: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDestinationCity" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationState" runat="server" CssClass="quick" Text="Destination State: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDestinationState" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationZipCode" runat="server" CssClass="quick" Text="Destination ZipCode: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDestinationZipCode" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:Table ID="Table5" runat="server" HorizontalAlign="Center">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btnSaveService" runat="server" class="btn btn-lg btn-success text-white quick" Visible="false" Text="Save Service" OnClick="btnSaveService_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="Label1" runat="server" CssClass="quick" Text="" Visible="false"></asp:Label>

                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
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

        <div id="popup1" class="overlay" style="float: right;">
            <div class="popup shadow-lg pop">
                <h1>Add to your to do List!</h1>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <div class="container row">
                        <div class="col-md-12">
                            <div class="form-group md-form mb-0">
                                <label cssclass="quick">To Do List Item:</label>
                                <asp:TextBox runat="server" ID="txtbxToDoItem" CssClass="form form-control input-sm quick"></asp:TextBox>
                                <%-- <input type="address" class="form-control shadow-sm imput-small" id="inputtodoitem" aria-describedby="emailHelp" placeholder="Enter To Do List Item ">--%>
                            </div>
                        </div>
                    </div>

                    <div class="container row">
                        <div class="col-md-12">
                            <div class="form-group mb-0">
                                <label cssclass="quick">Description:</label>
                                <asp:TextBox runat="server" ID="txtbxToDoDescription" CssClass="form form-control input-sm quick"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="container row">
                        <div class="col-md-12">
                            <div class="form-group mb-0">
                                <label cssclass="quick">Deadline Date:</label>
                                <asp:TextBox runat="server" ID="todoDeadlineDate" TextMode="Date" CssClass="form form-control input-sm quick"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="container row text-center" style="margin-top: 15px; margin-bottom: 15px;">
                        <div class="col-sm">
                            <asp:RadioButtonList ID="rblUrgent" runat="server" RepeatDirection="Horizontal" class=" container col-md-12 text-center">
                                <asp:ListItem Text="Urgent" Value="Urgent" class="btnToDo btn-success text-white quick"></asp:ListItem>
                                <asp:ListItem Text="Very Urgent" Value="Very Urgent" class="btnToDo btn-danger text-white quick"></asp:ListItem>
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
                    <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-success text-white quick" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>


    </section>
    <footer class="sticky-bottom"></footer>
</asp:Content>


