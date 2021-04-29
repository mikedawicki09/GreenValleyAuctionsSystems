<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="ServiceCompletionForm.aspx.cs" Inherits="GreenValleyAuctionsSystems.ServiceCompletionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <style>
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
    </style>
    <br />
    <br />
    <br />
    <br />
    <br />
    <header style="background-color: #ffffff">
        <div class="starter-template text-center py-5 px-3">
            <h1 class="text-uppercase">Service Completion Form</h1>
        </div>
    </header>
    <section style="background-color: #f1f8f7">
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2 class="card-title">Service Completion Form</h2>

                        </div>
                        <div class="card-body shadow">
                            <section style="float: left">
                                <asp:Table ID="tbleCompletionForm" runat="server" HorizontalAlign="Center" class="quick font-weight-bold">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblFName" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblLName" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblAddy" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblTelephone" runat="server" Text="Telephone:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblCustEmail" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblType" runat="server" Text="Type of Service:  "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblServiceType" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblDate" runat="server" Text="Date of Service:  "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblServiceDate" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblTotal" runat="server" Text="Total Fixed/Estimated Cost:  "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblTotalCost" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblPayment" runat="server" Text="Payment Type:  "></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lblPaymentType" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblComments" runat="server" Text="Comments:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="form-control shadow-sm imput-small quick font-weight-bold"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Button ID="btnComment" runat="server" Text="Save Comment" class="btn btn-success text-white" OnClick="btnComment_Click" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblNotify" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <br />
                                <asp:Table runat="server" class="quick font-weight-bold">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblExperience" runat="server" Text="How was your experience?"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label ID="lblSpace" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Button ID="btnPositive" runat="server" Text="Positive" class="btn btn-success text-white" OnClick="btnPositive_Click" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Button ID="btnNegative" runat="server" Text="Negative" class="btn btn-success text-white" OnClick="btnNegative_Click" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </section>
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
                            <h2 class="card-title">Email Template</h2>
                        </div>
                        <div class="card-body shadow">
                            <asp:Table runat="server" class="quick font-weight-bold">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblRec" runat="server" Text="Recipient:" Visible="false"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtRec" runat="server" CssClass="form-control shadow-sm imput-small quick font-weight-bold" Visible="false"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblSub" runat="server" Text="Subject:" Visible="false"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtSub" runat="server" CssClass="form-control shadow-sm imput-small quick font-weight-bold" Style="width: 1000px;" Visible="false"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblBody" runat="server" Text="Body:" Visible="false"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" CssClass="form-control shadow-sm imput-small quick font-weight-bold" Visible="false"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button ID="btnSend" runat="server" Text="Send E-mail" OnClick="butSend_Click" class="btn btn-success text-white" Visible="false" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblSent" runat="server" Text="" Visible="false"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
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
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success text-white" OnClick="btnSubmitToDo_Click" />
            </div>
        </div>
    </div>

    <footer class="sticky-bottom">
    </footer>
</asp:Content>


