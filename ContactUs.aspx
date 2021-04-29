<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="GreenValleyAuctionsSystem.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <br />
    <br />
    <br />
    <section style="background-color: #f1f8f7">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-6 col-sm-12">
                    <div class="card shadow">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2>
                                <asp:Label ID="lblActiveServices" runat="server" Text="Contact Green Valley"></asp:Label></h2>
                        </div>
                        <div class="card-body">
    <asp:Table ID="tblContactUs" runat="server" HorizontalAlign="left" CssClass="quick" CellPadding="5">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblContactUs" runat="server" Text="Contact Us" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblTelephone" runat="server" Text="Telephone: " Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="lblTelephoneNumber" runat="server" Text="(540) 434-4260"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text="Email: " Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="lblEmailAddress" runat="server" Text="info@greenvalleyauctions.com"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMailingShippingAddress" runat="server" Text="Mailing/Shipping Address" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInfo" runat="server" Text="Green Valley Auctions & Moving, Inc." Font-Bold="true" Font-Size="Larger"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAdd" runat="server" Text="2259 Green Valley Lane"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddTwo" runat="server" Text="Mt. Crawford, Virginia 22841"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHourOp" runat="server" Text="Hours of Operation" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMonFri" runat="server" Text="Monday through Friday: " Font-Bold="true" Font-Size="Larger"></asp:Label>
                <asp:Label ID="lblAddInfo" runat="server" Text="8:00 a.m. to 4:30 p.m."></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddInfoTwo" runat="server" Text="(We are closed between 12:00 p.m. and 1:00 p.m. for lunch.)" Font-Italic="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    
</asp:Content>



