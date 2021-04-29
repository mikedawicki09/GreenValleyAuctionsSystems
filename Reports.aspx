<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="GreenValleyAuctionsSystems.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .quick {
            font-family: 'Quicksand', sans-serif;
            color: black;
            font: bold;
        }

        .card-header {
            background-color: #fff2cc;
            font-size: 40px;
            font-family: 'Josefin Sans', sans-serif;
            font: bold;
        }

        .title {
            padding-top: 70px;
            text-align: center;
            font-family: 'Josefin Sans', sans-serif;
            color: darkgreen;
            font-size: 45px;
        }

        h2 {
            font-family: 'Josefin Sans', sans-serif;
        }
    </style>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@200;400&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@200;400&display=swap" rel="stylesheet">

    <br />
    <br />
    <br />
    <br />
    <header>

        <div class="starter-template text-center py-5 px-3">
            <h1 class="text-uppercase title">REPORTS</h1>
        </div>
    </header>
    <br />
    <div class="container">
        <div class="col-lg-12 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #fff2cc">
                    <h2>Total Amount Grossed from Moving Services</h2>
                </div>
                <script type='text/javascript' src='https://prod-useast-b.online.tableau.com/javascripts/api/viz_v1.js'></script>
                <div class='tableauPlaceholder' style='width: 1044px; height: 563px;'>
                    <object class='tableauViz' width='1044' height='563' style='display: none;'>
                        <param name='host_url' value='https%3A%2F%2Fprod-useast-b.online.tableau.com%2F' />
                        <param name='embed_code_version' value='3' />
                        <param name='site_root' value='&#47;t&#47;greenvalleyauctions' />
                        <param name='name' value='GreenValleyAuctionsReports&#47;AmountGrossedOverTimePeriod' />
                        <param name='tabs' value='no' />
                        <param name='toolbar' value='yes' />
                        <param name='showAppBanner' value='false' />
                        <param name='subscriptions' value='no' />
                        <param name='showShareOptions' value='false' />
                        <param name='customViews' value='no' />
                        <param name='alerts' value='no' />
                        <param name='dataDetails' value='no' />
                    </object>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #fff2cc">
                    <h2>Storage Report </h2>
                </div>
                <script type='text/javascript' src='https://prod-useast-b.online.tableau.com/javascripts/api/viz_v1.js'></script>
                <div class='tableauPlaceholder' style='width: 1280px; height: 563px;'>
                    <object class='tableauViz' width='1044' height='562' style='display: none;'>
                        <param name='host_url' value='https%3A%2F%2Fprod-useast-b.online.tableau.com%2F' />
                        <param name='embed_code_version' value='3' />
                        <param name='site_root' value='&#47;t&#47;greenvalleyauctions' />
                        <param name='name' value='GreenValleyAuctionsReports&#47;StorageLocations' />
                        <param name='tabs' value='no' />
                        <param name='toolbar' value='yes' />
                        <param name='showAppBanner' value='false' />
                        <param name='subscriptions' value='no' />
                        <param name='showShareOptions' value='false' />
                        <param name='customViews' value='no' />
                        <param name='alerts' value='no' />
                        <param name='dataDetails' value='no' />
                    </object>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #fff2cc">
                    <h2>Where our Customers Hear About Us </h2>
                </div>
                <script type='text/javascript' src='https://prod-useast-b.online.tableau.com/javascripts/api/viz_v1.js'></script>
                <div class='tableauPlaceholder' style='width: 1044px; height: 563px;'>
                    <object class='tableauViz' width='1044' height='563' style='display: none;'>
                        <param name='host_url' value='https%3A%2F%2Fprod-useast-b.online.tableau.com%2F' />
                        <param name='embed_code_version' value='3' />
                        <param name='site_root' value='&#47;t&#47;greenvalleyauctions' />
                        <param name='name' value='GreenValleyAuctionsReports&#47;WhereArePeopleHearingAboutUs' />
                        <param name='tabs' value='no' />
                        <param name='toolbar' value='yes' />
                        <param name='showAppBanner' value='false' />
                        <param name='subscriptions' value='no' />
                        <param name='showShareOptions' value='false' />
                        <param name='customViews' value='no' />
                        <param name='alerts' value='no' />
                        <param name='dataDetails' value='no' />
                    </object>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #fff2cc">
                    <h2>Moving Services Grouped By Destination City</h2>
                </div>
                <script type='text/javascript' src='https://prod-useast-b.online.tableau.com/javascripts/api/viz_v1.js'></script>
                <div class='tableauPlaceholder' style='width: 1044px; height: 563px;'>
                    <object class='tableauViz' width='1044' height='563' style='display: none;'>
                        <param name='host_url' value='https%3A%2F%2Fprod-useast-b.online.tableau.com%2F' />
                        <param name='embed_code_version' value='3' />
                        <param name='site_root' value='&#47;t&#47;greenvalleyauctions' />
                        <param name='name' value='GreenValleyAuctionsReports&#47;MovingServices' />
                        <param name='tabs' value='no' />
                        <param name='toolbar' value='yes' />
                        <param name='showAppBanner' value='false' />
                        <param name='subscriptions' value='no' />
                        <param name='showShareOptions' value='false' />
                        <param name='customViews' value='no' />
                        <param name='alerts' value='no' />
                        <param name='dataDetails' value='no' />
                    </object>
                </div>

            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #fff2cc">
                    <h2>Auction Services Grouped By Pickup City</h2>
                </div>
                <script type='text/javascript' src='https://prod-useast-b.online.tableau.com/javascripts/api/viz_v1.js'></script>
                <div class='tableauPlaceholder' style='width: 1044px; height: 563px;'>
                    <object class='tableauViz' width='1044' height='563' style='display: none;'>
                        <param name='host_url' value='https%3A%2F%2Fprod-useast-b.online.tableau.com%2F' />
                        <param name='embed_code_version' value='3' />
                        <param name='site_root' value='&#47;t&#47;greenvalleyauctions' />
                        <param name='name' value='GreenValleyAuctionsReports&#47;AuctionServices' />
                        <param name='tabs' value='no' />
                        <param name='toolbar' value='yes' />
                        <param name='showAppBanner' value='false' />
                        <param name='subscriptions' value='no' />
                        <param name='showShareOptions' value='false' />
                        <param name='customViews' value='no' />
                        <param name='alerts' value='no' />
                        <param name='dataDetails' value='no' />
                    </object>
                </div>
            </div>
        </div>
    </div>

    <footer class="sticky-bottom container">
    </footer>
</asp:Content>
