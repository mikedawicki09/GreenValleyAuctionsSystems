<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="ServiceOrderForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.ServiceOrderForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@200;400&display=swap" rel="stylesheet">

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

        h1 {
            padding-top: 70px;
            text-align: center;
            font-family: 'Josefin Sans', sans-serif;
            color: darkgreen;
            font-size: 45px;
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

        .card-header {
            background-color: #fff2cc;
            font-size: 40px; font-family: 'Josefin Sans', sans-serif;
        }
    </style>

    <h1 class="text-uppercase">Service Request Form</h1>
    <asp:Table ID="tblDirectory" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnNewCustomer" runat="server" Text="New Customer" CssClass="btn btn-success text-white quick" BackColor="Gray" OnClick="btnNewCustomer_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnExistingCustomer" runat="server" Text="Existing Customer" CssClass="btn btn-success text-white quick" OnClick="btnExistingCustomer_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <section style="background-color: #f1f8f7;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card shadow">
                        <div class="card-header">
                            <h2 class="">Service Information</h2>
                             <asp:Button ID="btnGoToCustomerFile" runat="server" Text="Go To Customer File" OnClick="btnGoToCustomerFile_Click" CssClass="btn btn-success text-white quick" Visible="false" />
                        </div>
                        
                        <div class="card-body">
                            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Style="margin: 10px;">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblName" runat="server" class="quick" Text="Customer Name:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Left">
                                        <asp:DropDownList ID="ddlCustomers" runat="server" class="form-control select2 quick" DataTextField="Customer Name" DataValueField="customerID" AutoPostBack="false">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDeadline" runat="server" class="quick" Text="Deadline Date: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDeadlineDate" runat="server" class="quick" TextMode="Date"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblServices" runat="server" class="quick" Text="Services Required: "></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Left">
                                        <asp:Label ID="lblAuction" runat="server" class="quick" Text="Auction: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Left">
                                        <asp:CheckBox ID="cbxAuction" runat="server" OnCheckedChanged="cbxAuction_CheckedChanged" AutoPostBack="true" />
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:Label ID="lblMove" runat="server" class="quick" Text="Move: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:CheckBox ID="cbxMove" runat="server" OnCheckedChanged="cbxMove_CheckedChanged" AutoPostBack="true" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div runat="server" id="auctionCard" class="card shadow hidden">
                        <div runat="server" id="auctionCardHeader" class="card-header hidden">
                            <h2>Auction Service</h2>
                        </div>
                        <fieldset id="fieldset1" style="margin: 10px;">
                            <div class="container">
                                <asp:Table ID="Table2" runat="server" HorizontalAlign="Left" Visible="false">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblPickupStreet" runat="server" class="quick" Text="Pickup Street Address: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtbxPickupStreet" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblPickupCity" runat="server" class="quick" Text="Pickup City: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtbxPickupCity" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblPickupState" runat="server" class="quick" Text="Pickup State: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtbxPickupState" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblPickupZipCode" runat="server" class="quick" Text="Pickup Zip Code: "></asp:Label>
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
                            <h2>Move Service</h2>
                        </div>
                        <div class="container overflow-auto">
                            <asp:Table ID="Table3" runat="server" HorizontalAlign="Right" Visible="false" Style="margin: 10px;" CssClass="overflow-auto">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentStreet" runat="server" class="quick" Text="Current Street Address: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentStreet" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentCity" runat="server" class="quick" Text="Current City: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentCity" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentState" runat="server" class="quick" Text="Current State: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentState" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCurrentZipCode" runat="server" class="quick" Text="Current ZipCode: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxCurrentZipCode" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationStreet" runat="server" class="quick" Text="Destination Street Address: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDestinationStreet" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationCity" runat="server" class="quick" Text="Destination City: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDestinationCity" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationState" runat="server" class="quick" Text="Destination State: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtbxDestinationState" runat="server" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDestinationZipCode" runat="server" class="quick" Text="Destination ZipCode: "></asp:Label>
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
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Table ID="Table4" runat="server" HorizontalAlign="Center" CellPadding="10">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Center">
                                    <asp:Button ID="btnSave" runat="server" class="btn btn-lg btn-success text-white quick" Text="Save" OnClick="btnSave_Click" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="lblConfirmation" runat="server" class="alert alert-success arrow-left quick" Text="" Visible="false"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
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

            <div id="popup2" class="overlay" style="float: right;">
                <div class="popup shadow-lg pop">
                    <h1>Add a Note!</h1>
                    <a class="close" href="#">&times;</a>
                    <div class="content">
                        <div class="container">
                            <div class="row">
                                <div class="form-group md-form mb-0">
                                    <asp:Label ID="lblTitle" runat="server" class="quick" Text="Note Title: "></asp:Label>
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
                                    <asp:Label ID="lblBody" runat="server" class="quick" Text="Note Body: "></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group md-form mb-0">
                                    <asp:TextBox ID="txtBody" runat="server" Placeholder="Enter Note Body" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class=" container col-md-12 text-center" style="margin-top: 10px;">
                            <asp:Button ID="btnSubmit" runat="server" Text="Save Note" OnClick="btnSubmitNote_Click" class="btn btn-success text-white quick" />
                        </div>
                    </div>
                </div>
            </div>

        </section>
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
    <asp:SqlDataSource runat="server"
        ID="datasrcExistingCustomers"
        ConnectionString="<%$ ConnectionStrings: Lab4 %>"
        SelectCommand="select customerID, firstName + ' ' + lastName as 'Customer Name' from CUSTOMER;"></asp:SqlDataSource>
    <script>
        $('.select2').select2();
    </script>

</asp:Content>



