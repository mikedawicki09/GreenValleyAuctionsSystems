<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="CustomerFile.aspx.cs" Inherits="GreenValleyAuctionsSystem.CustomerFile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
            width: 90%;
            height: 10px;
            text-align: center;
            top: 5px;
            color: #1c593f;
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
            margin-left: 240px;
            bottom: 100px;
        }

        .btn {
            height: 30px;
            width: 100px;
        }

        .pushbaroverMove {
            margin-right: 20px;
            margin-top: 20px;
        }

        .pushbaroverAuction {
            margin-right: 20px;
            margin-top: 20px;
        }

        .panelpadding {
            padding: 10px;
        }

        .main-header {
            padding-top: 70px;
            text-align: center;
            font-family: 'Josefin Sans', sans-serif;
            color: darkgreen;
            font-size: 45px;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
            color: black;
            font-weight: bold;
        }

        .heading {
            color: black;
            font-size: 30px;
        }

        .gridpadding {
            margin: 0px;
            padding: 0px;
            display: inline-block;
        }

        .nomargin{
            margin: 0px;
        }
        .btnToDo {
            border: none;
            color: white;
            padding-bottom:5px;
            padding-top: 5px;
            padding-left:5px;
            padding-right:5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            border-radius:4px;
            height: 50px;
            width:200px;
        }
        a:hover {color: #00B74A; }

        h1{padding-top:70px; text-align: center;  font-family: 'Josefin Sans', sans-serif; color:darkgreen; font-size: 45px;}
        h2{font-size: 40px; font-family: 'Josefin Sans', sans-serif; margin-top:10px;}

        


    </style>
    <br />
    <br />
    <br />
    <h1 class="text-uppercase main-header">
        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h1>
    <asp:Label ID="lblTest" runat="server" Text=""></asp:Label>
    <br />
    <div class="container">
        <div class="row"></div>
        <div class="col-lg-12 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #fff2cc">
                    <h2>Customer Information</h2>
                </div>
                <div class="card-body shadow" style="background-color: #f1f8f7">
                    <asp:DetailsView
                        ID="dvCustomerInfo" class="quick"
                        runat="server"
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
    <br />
    <section style="background-color: #f1f8f7">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc">
                            <a class="heading" href="" data-toggle="collapse" data-parent="#accordian" data-target="#c3">Auction Services</a>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c3">
                                    <div class="row">
                                        <div class="col-lg-8 nomargin">
                                        <asp:GridView ID="grdvwAuctionService"
                                            runat="server" HorizontalAlign="Left"
                                            DataSourceID="datasrcAuctionService"
                                            AllowSorting="true" class="quick"
                                            AllowPaging="true" AutoGenerateColumns="false"
                                            DataKeyNames="customerID" Width="235px"
                                            BorderWidth="0" RowStyle-Height="50px"
                                            OnRowCommand="grdvwAuctionService_RowCommand"
                                            EmptyDataText="No auction services associated with that customer."
                                            GridLines="Horizontal" 
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#1c593f" HeaderStyle-BackColor="White">
                                            <Columns>
                                                <asp:BoundField HeaderText="customerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="serviceID" DataField="serviceID" SortExpression="serviceID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="serviceName" DataField="serviceName" SortExpression="serviceName" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:ButtonField ButtonType="link" CommandName="view" Text="view" ControlStyle-CssClass="btn btn-success text-white" ControlStyle-Width="70px" ItemStyle-Width="105px" />
                                                <asp:BoundField HeaderText="Date of Service" HeaderStyle-Font-Bold="true" DataField="Auction Date" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="left" />
                                                <asp:BoundField HeaderText="Current Status" DataField="serviceStatus" SortExpression="serviceStatus" ItemStyle-Width="200px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                            </Columns>
                                        </asp:GridView>
                                            </div>
                                        <div class="col-lg-4 nomargin" style="left: 10px;">
                                        <asp:Table ID="tblBarAuction" runat="server" class="quick" Width="225px">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblProgressTitleA" runat="server" Text="Progress" ForeColor="#1c593f" Font-Bold="true" CssClass="quick"></asp:Label>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell ID="tblCellAuction">
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
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc"><a class="heading" href="" data-toggle="collapse" data-parent="#accordian" data-target="#c4">Moving Services</a></div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8 collapse fade" id="c4">
                                     <div class="row">
                                        <div class="col-lg-8">
                                        <asp:GridView ID="grdvwMovingService"
                                            runat="server" HorizontalAlign="Left"
                                            DataSourceID="datasrcMovingService"
                                            AllowSorting="true" class="quick"
                                            BorderWidth="0" EmptyDataText="No moving services associated with that customer."
                                            AllowPaging="true" Width="235px"
                                            AutoGenerateColumns="false"
                                            OnRowCommand="grdvwMovingService_RowCommand"
                                            DataKeyNames="customerID"
                                            GridLines="Horizontal" RowStyle-Height="50px"
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#1c593f" HeaderStyle-BackColor="White">
                                            <Columns>
                                                <asp:BoundField HeaderText="customerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="serviceID" DataField="serviceID" SortExpression="serviceID" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="serviceName" DataField="serviceName" SortExpression="serviceName" ItemStyle-Width="150px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:ButtonField ButtonType="link" CommandName="view" Text="view" ControlStyle-CssClass="btn btn-success text-white" ControlStyle-Width="70px"  ItemStyle-Width="105px" />
                                                <asp:BoundField HeaderText="Date of Service" HeaderStyle-Font-Bold="true" DataField="Moving Date" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="left" />
                                                <asp:BoundField HeaderText="Current Status" DataField="serviceStatus" SortExpression="serviceStatus" ItemStyle-Width="200px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                            </Columns>
                                        </asp:GridView>
                                            </div>
                                        <div class="col-lg-4" style="left: 10px;">
                                        <asp:Table ID="tblBarMoving" runat="server" HorizontalAlign="Left" Width="225px" class="quick">
                                            <asp:TableRow>
                                                <asp:TableCell HorizontalAlign="Left">
                                                    <asp:Label ID="lblProgressTitleM" runat="server" Text="Progress" ForeColor="#1c593f" Font-Bold="true" CssClass="quick"></asp:Label>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell ID="tblCellMove">
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
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc"><a class="heading" href="" data-toggle="collapse" data-parent="#accordian" data-target="#c5">Storage</a></div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-5 collapse fade" id="c5">
                                    <p>
                                        <asp:Table ID="tblStorageForm" runat="server" CssClass="quick" Width="400px">
                                            <asp:TableRow>
                                                <asp:TableCell ColumnSpan="3">
                                                    <h4>
                                                        <asp:Label ID="lblHeader" runat="server" Text="Allocate Storage for Customer" Font-Bold="true"></asp:Label></h4>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblStorageArea" runat="server" Text="Select a Storage Area: "></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:DropDownList
                                                        ID="ddlStorageArea" runat="server" DataSourceID="datasrcStorageArea" AutoPostBack="false" Width="150px"
                                                        DataTextField="storageLocation" DataValueField="storageLocation" AppendDataBoundItems="true" class="form-control select2 quick">
                                                        <asp:ListItem Text="--Select--" Value="" disabled="disabled" Selected="True" />
                                                    </asp:DropDownList>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Button ID="btnSubmitStorage" runat="server" Text="Submit" OnClick="btnSubmitStorage_Click" class="btn btn-success text-white" />
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                        <br />
                                        <asp:GridView ID="grdvwStorage"
                                            runat="server" Width="350px"
                                            DataSourceID="datasrcStorage"
                                            DataKeyNames="storageServiceID"
                                            AllowSorting="true" class="quick"
                                            AllowPaging="true"
                                            AutoGenerateColumns="false"
                                            GridLines="Horizontal"
                                            BorderWidth="0"
                                            EmptyDataText="No items in storage associated with that customer."
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#1c593f" HeaderStyle-BackColor="White">
                                            <Columns>
                                                <asp:BoundField HeaderText="customerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="125px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="storageServiceID" DataField="storageServiceID" SortExpression="storageServiceID" ItemStyle-Width="125px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="Location" DataField="storageLocation" SortExpression="storageLocation" ItemStyle-Width="250px" />
                                            </Columns>
                                        </asp:GridView>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header" style="background-color: #fff2cc"><a class="heading" href="" data-toggle="collapse"  data-parent="#accordian" data-target="#c6">Notes</a></div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-5 collapse fade" id="c6">
                                    <p>

                                        <asp:GridView ID="GridView1"
                                            DataSourceID="dataSrcNote"
                                            runat="server" class="quick"
                                            AllowSorting="true"
                                            AutoGenerateColumns="false"
                                            AutoGenerateEditButton="false"
                                            DataKeyNames="customerNoteID"
                                            BorderWidth="0"
                                            GridLines="Horizontal"
                                            Width="500px"
                                            EmptyDataText="No notes associated with that customer."
                                            AlternatingRowStyle-BackColor="white" RowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#1c593f" HeaderStyle-BackColor="White">
                                            <Columns>
                                                <asp:BoundField HeaderText="customerNoteID" DataField="customerNoteID" SortExpression="customerNoteID" ItemStyle-Width="100px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="customerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="100px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                                <asp:BoundField HeaderText="Name" DataField="FullName" SortExpression="FullName" ItemStyle-Width="130px" ReadOnly="true" HeaderStyle-CssClass="quick" />
                                                <asp:BoundField HeaderText="Note Title" DataField="noteTitle" SortExpression="noteTitle" ItemStyle-Width="100px" ReadOnly="false" ControlStyle-CssClass="btn btn-outline-success" />
                                                <asp:TemplateField HeaderText="Note" SortExpression="noteBody" ItemStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <div class='remark'>
                                                            <%#  Convert.ToString(Eval("noteBody")).Length >0? 
                                                                                        "<span class='btn btn-outline-success' style='width:50px; padding: 2px;'>view</span>" : "" %>
                                                            <div id="divPopup" class="remarkdetail shadow-lg">
                                                                <h3>
                                                                    <asp:Label ID="lblNote" runat="server" Text="Note Body" ForeColor="#1C593F" Font-Size="Large" Font-Underline="true" Font-Bold="true"></asp:Label></h3>
                                                                <%# Convert.ToString(Eval("noteBody")).Replace("\n","<br/>") %>
                                                            </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField HeaderStyle-CssClass="hidden" ShowDeleteButton="true" ButtonType="Image" ControlStyle-Width="70px" ControlStyle-CssClass="btn" DeleteImageUrl="\GVAImages\trash1.svg" ItemStyle-Width="80px" />
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
        ID="datasrcMovingService"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMER.customerID, SERVICE.serviceID, SERVICE.serviceName, CONVERT(varchar, SERVICE.deadlineDate, 107) AS 'Moving Date', 
        SERVICE.serviceStatus FROM dbo.CUSTOMER,dbo.SERVICE, dbo.MOVINGSERVICE WHERE SERVICE.customerID = CUSTOMER.customerID AND MOVINGSERVICE.serviceID = SERVICE.serviceID
        AND CUSTOMER.customerID = @customerID ">
        <SelectParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcAuctionService"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMER.customerID, SERVICE.serviceID, SERVICE.serviceName, CONVERT(varchar, SERVICE.deadlineDate, 107) AS 'Auction Date', SERVICE.serviceStatus 
        FROM dbo.CUSTOMER,dbo.SERVICE, dbo.AUCTIONSERVICE
        WHERE SERVICE.customerID = CUSTOMER.customerID AND AUCTIONSERVICE.serviceID = SERVICE.serviceID
        AND CUSTOMER.customerID = @customerID ">
        <SelectParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcRequest"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMER.customerID, SERVICEREQUEST.requestID, 
        SERVICEREQUEST.serviceType AS 'Service Type',
        CONVERT(varchar, SERVICEREQUEST.requestTimeDate, 107) AS 'Date Requested', 
        SERVICEREQUEST.requestDescription AS 'Description', SERVICEREQUEST.status AS 'Status' 
        FROM SERVICEREQUEST 
        INNER JOIN CUSTOMER ON SERVICEREQUEST.customerID = CUSTOMER.customerID 
        WHERE SERVICEREQUEST.status IS NULL AND CUSTOMER.customerID = @customerID ">
        <SelectParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcStorage"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMER.customerID, STORAGESERVICE.storageServiceID, STORAGE.storageLocation FROM STORAGESERVICE, STORAGE, CUSTOMER
        WHERE CUSTOMER.customerID = STORAGESERVICE.customerID 
		AND STORAGE.storageID = STORAGESERVICE.storageID
		AND CUSTOMER.customerID = @customerID">
        <SelectParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcStorageArea"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT DISTINCT storageLocation FROM STORAGE"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="dataSrcNote"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMERNOTE.customerNoteID, CUSTOMER.customerID, CUSTOMER.firstName + ' ' + CUSTOMER.lastName as FullName, 
                    CUSTOMERNOTE.noteTitle, CUSTOMERNOTE.noteBody FROM dbo.CUSTOMER, dbo.CUSTOMERNOTE
                    WHERE CUSTOMER.customerID = CUSTOMERNOTE.customerID AND CUSTOMER.customerID = @customerID "
        DeleteCommand="DELETE FROM dbo.CUSTOMERNOTE WHERE CUSTOMERNOTE.customerNoteID = @customerNoteID">
        <SelectParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="customerNoteID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <footer class="sticky-bottom"></footer>



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
            <h1>Add to Your To Do List!</h1>
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
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success text-white quick" OnClick="btnSubmit_Click" />
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
                            <asp:Label ID="Label1" runat="server" Text="Note Title: " CssClass="quick"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group md-form mb-0">
                            <asp:TextBox ID="txtTitle2" runat="server" Placeholder="Enter Note Title" CssClass="form-control shadow-sm input-small quick"></asp:TextBox>
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
                    <asp:Button ID="Button1" runat="server" Text="Save Note" OnClick="submitNote_Click" CausesValidation="false" class="btn btn-success text-white quick" />
                </div>
            </div>
        </div>
    </div>

    <script>
        $('.select2').select2();
    </script>

</asp:Content>







