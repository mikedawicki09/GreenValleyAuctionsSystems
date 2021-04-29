<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="CustomerPortal.aspx.cs" Inherits="GreenValleyAuctionsSystem.CustomerPortal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <style>
        .hidden {
            display: none;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
            color: black;
            font-weight: bold;
        }
    </style>
    <br />
    <br />
    <br />
    <br />
    <h1>CUSTOMER DASHBOARD</h1>

    <section style="background-color: #f1f8f7">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="card shadow">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2>
                                <asp:Label ID="lblActiveServices" runat="server" Text="Your Services"></asp:Label></h2>
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="grdvwActiveServices" runat="server"
                                DataSourceID="datasrcActiveServices"
                                AllowSorting="true" CssClass="quick"
                                AllowPaging="true"
                                AutoGenerateColumns="false"
                                OnRowCommand="grdvwActiveServices_RowCommand"
                                BorderWidth="0"
                                DataKeyNames="serviceID"
                                GridLines="Horizontal" EmptyDataText="You Have No Active Services"
                                AlternatingRowStyle-BackColor="#f1f8f7" CellPadding="5" CellSpacing="10" width="450" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="white"
                                HeaderStyle-ForeColor="#1c593f">
                                <columns>
                                    <asp:BoundField DataField="serviceID" SortExpression="serviceID" ItemStyle-Width="150px" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" ReadOnly="true" />
                                    <asp:BoundField HeaderText="Service Name" DataField="serviceName" SortExpression="serviceName" ItemStyle-Width="150px" />
                                    <asp:BoundField HeaderText="Service Status" DataField="serviceStatus" SortExpression="serviceStatus" ItemStyle-Width="150px" />
                                </columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="card shadow">
                        <div class="card-header" style="background-color: #fff2cc">
                            <h2>Green Valley Facebook</h2>
                        </div>
                        <div class="card-body">
                            <div id="fb-root"></div>
                            <script async="async" defer="defer" crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0" nonce="DwshkZrc"></script>
                            <div class="fb-page" data-href="https://www.facebook.com/greenvalleyauctions/" data-tabs="timeline" data-width="500" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                                <blockquote cite="https://www.facebook.com/greenvalleyauctions/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/greenvalleyauctions/">Green Valley Auctions</a></blockquote>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:SqlDataSource
            ID="datasrcActiveServices"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT * FROM dbo.SERVICE WHERE SERVICE.customerID = @customerID;">
            <selectparameters>
                <asp:SessionParameter Name="customerID" SessionField="customerID" Type="Int32" />
                <asp:SessionParameter Name="emailAddress" SessionField="CustomerUsername" Type="String" />
            </selectparameters>
        </asp:SqlDataSource>
        <br />
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
    <footer class="sticky-bottom"></footer>
</asp:Content>


