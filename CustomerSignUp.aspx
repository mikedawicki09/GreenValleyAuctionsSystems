<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralMaster.Master" AutoEventWireup="true" CodeBehind="CustomerSignUp.aspx.cs" Inherits="GreenValleyAuctionsSystem.CustomerSignUp" %>

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
        .card-header {
            background-color: #fff2cc;
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
    </style>
    <br />
    <br />
    <header style="background-color: #ffffff">
        <div class="starter-template text-center py-5 px-3">
            <h1 class="text-uppercase main-header">Customer Sign Up</h1>
        </div>
    </header>
    <section style="background-color: #f1f8f7">
        <div class="container" style="margin-left: 15px;">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2 class="cardhead">Create a Customer Portal Account</h2>
                        </div>
                        <div class="card-body shadow">
                            <div class="row container">
                                <div class="col">
                                    <asp:Table ID="tblAccount" runat="server" HorizontalAlign="left" CssClass="quick" CellPadding="5">
                                        <asp:TableRow>
                                            <asp:TableCell Width="200px">
                                                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblLastName" runat="server" Text="Last Name:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblPassword1" runat="server" Text="Password:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblPassword2" runat="server" Text="Confirm Password:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                         </asp:Table>


                                    <asp:Table ID="tblAddress" runat="server" HorizontalAlign="right" CssClass="quick" CellPadding="5">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number:"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblAddress" runat="server" Text="Address:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblCity" runat="server" Text="City:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblState" runat="server" Text="State:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label ID="lblZipCode" runat="server" Text="Zip Code:" ></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control shadow-sm"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                <div>
                                    <br />
                                    <br />  
                                    <asp:Table ID="tblButton" runat="server" CssClass="quick" CellPadding="5">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" class="btn btn-success text-white quick" OnClick="btnSignUp_Click" />
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:Button ID="btnClear" runat="server" Text="Clear Form" class="btn btn-success text-white quick" OnClick="btnClear_Click"/>
                                            </asp:TableCell>
                                            <asp:TableCell HorizontalAlign="Center" >
                                                <asp:Label ID="lblStatus" runat="server" Text="" ></asp:Label>
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

    </section>

</asp:Content>




