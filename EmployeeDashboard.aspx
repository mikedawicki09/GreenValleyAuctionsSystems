<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="GreenValleyAuctionsSystem.EmployeeDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <style type="text/css">
        .hidden {
            display: none;
        }

        .hiddenfalse {
            display: block;
        }

        #float5 {
            position: fixed;
            width: 430px;
            height: 700px;
            bottom: 40px;
            top: 150px;
            left: -40px;
            background-color: #f1f8f7;
            border-radius: 30px;
            text-align: center;
            margin-right: 15px;
            box-shadow: #1c593f;
        }

        #grdvwToDoVeryUrgent {
            left: 10px;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
            color: black;
            font-weight: bold;
        }

        .extra-bold {
            font-family: 'Quicksand', sans-serif;
            color: black;
            font-weight: bolder;
        }

        .backcolor {
            background-color: rgba(255, 99, 71, 0.6);
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
            width: 200px;
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

        .btn-img {
            background-image: url(\GVAImages\clock.svg);
            width: 20px;
            height: 20px;
        }

        #tooltip1 {
            position: relative;
        }

            #tooltip1 a span {
                display: none;
                color: #FFFFFF;
            }

            #tooltip1 a:hover span {
                display: block;
                position: absolute;
                width: 200px;
                height: 50px;
                left: 100px;
                top: -10px;
                color: #FFFFFF;
                padding: 0 5px;
            }

        .urgent{
            width:20px;
        }
        .jose{
            font-family: 'Josefin Sans', sans-serif;
            font-size:25px;
            color: #1c593f;
        }

        .grid{
            border-collapse:collapse;
        }
        .grid tr{
            border:5px solid #F1f8f7;
            border-width:8px 0;

        }

    </style>

    <header>

        <div class="starter-template text-center py-5 px-3">
            <h1 class="text-uppercase">Employee Dashboard</h1>
            <asp:Label ID="lblWelcome" runat="server" Text="" Class="quick" Font-Size="20"></asp:Label>
        </div>
    </header>

    <section style="background-color: #f1f8f7;">
        <div class="container shadow bg-white">
            <div class="container text-center overflow-auto">
                <asp:Table ID="table2" runat="server" CellPadding="15" CssClass="quick">
                    <asp:TableRow>
                        <asp:TableCell>
                            <h2>
                                <asp:Label ID="lblSearchCustomer" runat="server" Text="Search Customer:"></asp:Label></h2>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtbxSearch" runat="server" Font-Bold="true" CssClass="form form-control input-lg" placeholder="Search by Name or City" Width="350px"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnSearchCustomer" runat="server" Text="Search" class=" btn btn-success text-white" OnClick="btnSearchCustomer_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div class="container" style="padding-bottom: 15px;">
                <asp:GridView ID="grdvwCustomerTable"
                    runat="server"
                    DataSourceID="datasrcCustomerTable"
                    AllowSorting="true" class="quick hidden"
                    AllowPaging="true"
                    AutoGenerateColumns="false"
                    OnRowCommand="grdvwCustomerTable_RowCommand"
                    DataKeyNames="customerID"
                    GridLines="Horizontal"
                    BorderWidth="0"
                    EmptyDataText="No services in database associated with that customer."
                    AlternatingRowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-BackColor="white"
                    HeaderStyle-ForeColor="#1c593f">
                    <Columns>
                        <asp:BoundField HeaderText="CustomerID" DataField="customerID" SortExpression="customerID" ItemStyle-Width="300px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                        <asp:BoundField HeaderText="First Name" DataField="firstName" SortExpression="firstName" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField HeaderText="Last Name" DataField="lastName" SortExpression="lastName" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField HeaderText="Phone Number" DataField="phoneNumber" SortExpression="phoneNumber" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField HeaderText="Email" DataField="emailAddress" SortExpression="emailAddress" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:ButtonField ButtonType="Link" CommandName="view" Text="view" ControlStyle-CssClass="btn btn-success text-white" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>
    <section style="background-color: white">
        <div class="container">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header" style="background-color: #fff2cc">
                        <h2 class="black"><strong>To Do</strong>
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="black" class="bi bi-list-task" viewBox="0 0 16 16" style="margin-bottom: 5px">
                                <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z" />
                                <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z" />
                                <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z" />
                        </h2>

                    </div>
                    <div class="card-body shadow overflow-auto" style="height: 350px; background:#F1f8f7;">
                        <div>
                            <div class="row">
                                <div class="col">
                                    <asp:GridView
                                        ID="grdvwToDoVeryUrgent" HeaderStyle-CssClass="jose"
                                        runat="server" class="quick grid"
                                        DataSourceID="datasrcVeryUrgentToDoList" AutoGenerateColumns="false"
                                        DataKeyNames="toDoID" OnRowDataBound="grdvwToDoVeryUrgent_RowDataBound"
                                        EmptyDataText="No Items To Do Right Now" CellPadding="5" CellSpacing="5" HeaderStyle-HorizontalAlign="Left"
                                        BackColor="white" BorderWidth="0" HeaderStyle-BackColor="#f1f8f7">
                                        <Columns>
                                            <asp:BoundField HeaderText="toDoID"  DataField="toDoID" SortExpression="toDoID" ItemStyle-Width="300px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                            <asp:BoundField HeaderText="urgency"  DataField="urgency" SortExpression="urgency" ItemStyle-Width="300px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                            <asp:BoundField HeaderText="Title" DataField="taskTitle" SortExpression="taskTitle" ItemStyle-Width="300px" ItemStyle-Font-Bold="true"/>
                                            <asp:BoundField HeaderText="Item" ItemStyle-CssClass="text-start" DataField="taskBody" SortExpression="taskBody" ItemStyle-Width="350px" />
                                            <asp:BoundField HeaderText="Due Date" ItemStyle-CssClass="text-start" DataField="endDate" SortExpression="endDate" ItemStyle-Width="250px" />
                                            <asp:TemplateField HeaderText="Priority" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="left" ItemStyle-Width="150px" >
                                                <ItemTemplate>
                                                   <asp:Label ID="lblPriority" runat="server" Text="" CssClass="btn shadow-sm" Width="130px" Font-Bold="true"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Complete?" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkbxComplete" runat="server" OnCheckedChanged="chkbxComplete_CheckedChanged" AutoPostBack="true" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                               <%--   <div class="col">
                                    <h3 class="text-black" style="width: 390px"><strong>URGENT (!):</strong></h3>
                                  <asp:GridView ID="GridView1" runat="server" DataSourceID="datasrcUrgentToDoList" AutoGenerateColumns="false"
                                        DataKeyNames="toDoID" Font-Bold="true" HeaderStyle-BackColor="#f2a248"
                                        EmptyDataText="No Items To Do Right Now" CellPadding="5" CellSpacing="5" HeaderStyle-HorizontalAlign="Left"
                                        BorderWidth="0" BackColor="#f7dfc5" CssClass="quick">
                                        <Columns>
                                            <asp:BoundField HeaderText="toDoID" DataField="toDoID" SortExpression="toDoID" ItemStyle-Width="300px" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                            <asp:BoundField HeaderText="Title" DataField="taskTitle" SortExpression="taskTitle" ItemStyle-Width="300px" ItemStyle-Font-Bold="false" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                            <asp:BoundField HeaderText="Item" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="text-start" DataField="taskBody" SortExpression="taskBody" ItemStyle-Width="350px" />
                                            <asp:BoundField HeaderText="Due Date" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="text-start" DataField="endDate" SortExpression="endDate" ItemStyle-Width="300px" />
                                            <asp:TemplateField HeaderText="Complete?" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkbxComplete2" runat="server" OnCheckedChanged="chkbxComplete2_CheckedChanged" AutoPostBack="true" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <%-- <asp:TemplateField ItemStyle-Width="30px" ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="middle">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtnClock" runat="server" ImageUrl="\GVAImages\clock.svg" Width="20px" ToolTip="" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remaining" SortExpression="daysRemaining" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <div class='remark'>
                                                        <%#  Convert.ToString(Eval("daysRemaining")).Length >0? 
                                                                                        "<span class:'btn-img;' style='width:50px; padding: 2px;'></span>" : "" %>
                                                        <div id="divPopup" class="remarkdetail shadow-lg">
                                                            <h3>
                                                                <asp:Label ID="lblDaysRemaining" runat="server" Text="Days Remaining" ForeColor="#1C593F" Font-Size="Large" Font-Underline="true" Font-Bold="true"></asp:Label></h3>
                                                            <%# Convert.ToString(Eval("daysRemaining")).Replace("\n","<br/>") %>
                                                        </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>

    <div class="container">
        <div class="row">
            <div class="col-sm">
                <div class="card" style="">
                    <div class="card-header" style="background-color: #fff2cc">
                        <h2 class="card-title">Service Requests
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-patch-exclamation-fill" viewBox="0 0 16 16" style="margin-bottom: 10px;">
                                    <path d="M10.067.87a2.89 2.89 0 0 0-4.134 0l-.622.638-.89-.011a2.89 2.89 0 0 0-2.924 2.924l.01.89-.636.622a2.89 2.89 0 0 0 0 4.134l.637.622-.011.89a2.89 2.89 0 0 0 2.924 2.924l.89-.01.622.636a2.89 2.89 0 0 0 4.134 0l.622-.637.89.011a2.89 2.89 0 0 0 2.924-2.924l-.01-.89.636-.622a2.89 2.89 0 0 0 0-4.134l-.637-.622.011-.89a2.89 2.89 0 0 0-2.924-2.924l-.89.01-.622-.636zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                        </h2>

                    </div>
                    <div class="card-body shadow overflow-auto" style="height: 200px; background-color: #F1F8F7;">
                        <asp:GridView ID="grdvwServiceRequestNew"
                            runat="server" HeaderStyle-Font-Size="25px"
                            DataSourceID="datasrcServiceRequestNew"
                            AllowSorting="true" CssClass="quick"
                            AllowPaging="true" OnRowCommand="grdvwServiceRequestNew_RowCommand"
                            AutoGenerateColumns="false"
                            DataKeyNames="serviceID"
                            OnRowDataBound="grdvwServiceRequestNew_RowDataBound"
                            GridLines="Horizontal" EmptyDataText="No Customer Service Requests Available"
                            BorderWidth="0"
                            AlternatingRowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="#1c593f">
                            <Columns>
                                <asp:BoundField ReadOnly="true" HeaderText="customerID" DataField="customerID" SortExpression="customerID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                <asp:BoundField ReadOnly="true" HeaderText="serviceID" DataField="serviceID" SortExpression="serviceID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                <asp:BoundField HeaderText="Customer Name" DataField="customerName" SortExpression="customerName" ItemStyle-Width="300px" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Service Type" DataField="serviceName" SortExpression="serviceName" ItemStyle-Width="300px" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Date Added" DataField="dateAdded" SortExpression="dateAdded" ItemStyle-Width="300px" HeaderStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="Days Since Request" SortExpression="daysSinceRequest" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="300px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDaysSince" runat="server" Text='<%#Eval("timeBetween")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Link" CommandName="view" Text="view" ControlStyle-CssClass="btn btn-success text-white" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>





    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="Select CUSTOMER.firstName, CUSTOMER.lastName, SERVICEREQUEST.requestID, SERVICEREQUEST.serviceType, 
        SERVICEREQUEST.requestTimeDate, DATEDIFF(dd, SERVICEREQUEST.requestTimeDate, GETDATE()) 
        AS 'timebetween', SERVICEREQUEST.requestDescription, SERVICEREQUEST.requestSeen FROM SERVICEREQUEST 
        inner join CUSTOMER on SERVICEREQUEST.customerID = CUSTOMER.customerID;"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="SqlDataSource2"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMER.customerID, SERVICE.serviceID,
            CUSTOMER.firstName + ' ' + CUSTOMER.lastName AS 'customerName',
            SERVICE.serviceName, CONVERT(varchar, SERVICE.dateAdded, 107) AS 'dateAdded', DATEDIFF(dd, SERVICE.dateAdded, GETDATE()) AS 'timeBetween'
            FROM SERVICE, CUSTOMER 
            WHERE SERVICE.serviceStatus = 'Requested' AND SERVICE.customerID = CUSTOMER.customerID;"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="SqlDataSource3"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT DISTINCT CUSTOMER.customerID,CUSTOMER.firstName, CUSTOMER.lastName,SERVICE.serviceID, SERVICE.serviceName, SERVICE.timeDate, WORKFLOW.ticketProgress FROM dbo.CUSTOMER, dbo.WORKFLOW, dbo.SERVICE, dbo.SERVICETICKET
                        WHERE CUSTOMER.customerID = SERVICETICKET.customerID AND SERVICETICKET.serviceID = SERVICE.serviceID AND dbo.SERVICE.serviceID = dbo.WORKFLOW.serviceID AND WORKFLOW.ticketStatus = 'Active' AND WORKFLOW.ticketChangeDate IN
                        (SELECT MAX(WORKFLOW.ticketChangeDate)
                        FROM dbo.WORKFLOW, dbo.SERVICE
                        WHERE WORKFLOW.serviceID = SERVICE.serviceID
                        GROUP BY SERVICE.serviceID)"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
        ID="SqlDataSource4"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT DISTINCT CUSTOMER.customerID,CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.phoneNumber, CUSTOMER.emailAddress FROM dbo.CUSTOMER"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        runat="server"
        ID="SqlDataSource5"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select [employeeID], [firstName] + ' ' + [lastName]  AS EmployeeName from dbo.EMPLOYEE"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="SqlDataSource6"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select toDoID, taskTitle, taskBody, CONVERT(varchar, endDate, 107) AS 'endDate' from dbo.TODO WHERE urgency=0 AND complete = 0"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="SqlDataSource7"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select toDoID, taskTitle, taskBody, CONVERT(varchar, endDate, 107) AS 'endDate' from dbo.TODO WHERE urgency=1 AND complete = 0"></asp:SqlDataSource>



    <asp:SqlDataSource
        ID="datasrcServiceRequest"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="Select CUSTOMER.firstName, CUSTOMER.lastName, SERVICEREQUEST.requestID, SERVICEREQUEST.serviceType, 
        SERVICEREQUEST.requestTimeDate, DATEDIFF(dd, SERVICEREQUEST.requestTimeDate, GETDATE()) 
        AS 'timebetween', SERVICEREQUEST.requestDescription, SERVICEREQUEST.requestSeen FROM SERVICEREQUEST 
        inner join CUSTOMER on SERVICEREQUEST.customerID = CUSTOMER.customerID;"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcServiceRequestNew"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT CUSTOMER.customerID, SERVICE.serviceID,
            CUSTOMER.firstName + ' ' + CUSTOMER.lastName AS 'customerName',
            SERVICE.serviceName, CONVERT(varchar, SERVICE.dateAdded, 107) AS 'dateAdded', DATEDIFF(dd, SERVICE.dateAdded, GETDATE()) AS 'timeBetween'
            FROM SERVICE, CUSTOMER 
            WHERE SERVICE.serviceStatus = 'New Service' AND SERVICE.customerID = CUSTOMER.customerID;"></asp:SqlDataSource>

    <asp:SqlDataSource
        ID="datasrcServiceTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT DISTINCT CUSTOMER.customerID,CUSTOMER.firstName, CUSTOMER.lastName,SERVICE.serviceID, SERVICE.serviceName, SERVICE.timeDate, WORKFLOW.ticketProgress FROM dbo.CUSTOMER, dbo.WORKFLOW, dbo.SERVICE, dbo.SERVICETICKET
                        WHERE CUSTOMER.customerID = SERVICETICKET.customerID AND SERVICETICKET.serviceID = SERVICE.serviceID AND dbo.SERVICE.serviceID = dbo.WORKFLOW.serviceID AND WORKFLOW.ticketStatus = 'Active' AND WORKFLOW.ticketChangeDate IN
                        (SELECT MAX(WORKFLOW.ticketChangeDate)
                        FROM dbo.WORKFLOW, dbo.SERVICE
                        WHERE WORKFLOW.serviceID = SERVICE.serviceID
                        GROUP BY SERVICE.serviceID)"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
        ID="datasrcCustomerTable"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="SELECT DISTINCT CUSTOMER.customerID,CUSTOMER.firstName, CUSTOMER.lastName, CUSTOMER.phoneNumber, CUSTOMER.emailAddress, CUSTOMER.city FROM dbo.CUSTOMER"
        FilterExpression="firstName LIKE '%{0}%' OR lastName LIKE '%{0}%' OR firstName + ' ' + lastName LIKE '%{0}%' OR city LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtbxSearch" Name="CustomerName"
                PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
        </FilterParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource
        runat="server"
        ID="dataSourceEmpList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select [employeeID], [firstName] + ' ' + [lastName]  AS EmployeeName from dbo.EMPLOYEE"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="datasrcUrgentToDoList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select toDoID, taskTitle, taskBody, CONVERT(varchar, endDate, 107) AS 'endDate' from dbo.TODO WHERE urgency=0 AND complete=0"></asp:SqlDataSource>
    <asp:SqlDataSource
        runat="server"
        ID="datasrcVeryUrgentToDoList"
        ConnectionString="<%$ ConnectionStrings:Lab4 %>"
        SelectCommand="select toDoID, urgency, taskTitle, taskBody, CONVERT(varchar, endDate, 107) AS 'endDate', DATEDIFF(dd, GETDATE(), endDate) AS 'daysRemaining' 
        from dbo.TODO WHERE complete=0 ORDER BY endDate"></asp:SqlDataSource>




    <br />
    <br />

    <div class="container">
        <div class="col-lg-12 col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #fff2cc">
                    <h2 class="card-title">Calendar</h2> </div>
                    <div class="card-body text-center overflow-auto" style="margin-left: 0px; padding-right: 10px; justify-content: center; background-color:#f1f8f7">
                        <iframe src="https://outlook.live.com/owa/calendar/00000000-0000-0000-0000-000000000000/9ee032ab-06a7-4190-b9b4-e38471de9f74/cid-754B3E0F0B7A282A/index.html" width="1010" height="700" style="left:5px; justify-content:center; margin-left:-10px;" class="text-center"></iframe>
                    </div>
               
            </div>
        </div>
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
                            <label>Deadline Date:</label>
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
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-success text-white quick" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>

    </section>
    <footer class="sticky-bottom container">
    </footer>
</asp:Content>


