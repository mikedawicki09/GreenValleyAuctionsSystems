<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="Appraisal.aspx.cs" Inherits="GreenValleyAuctionsSystems.Appraisal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
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

        .btn1 {
            height: 30px;
            width: 100px;
        }

        .quick {
            font-family: 'Quicksand', sans-serif;
            color: black;
        }

        h2 {
            font-size: 40px;
            font-family: 'Josefin Sans', sans-serif;
            margin-top: 10px;
        }

        .needPad {
            float: right;
            margin-right: 20px;
        }

        .floatBtn {
            position: fixed;
            width: 75px;
            height: 75px;
            left: 0px;
            top: 200px;
            background-color: #1c593f;
            border-radius: 10px;
            padding: 10px;
            text-align: center;
            margin-right: 15px;
        }
    </style>
    <br />
    <br />
    <h1>Appraisal Service Order Form</h1>
    <div class="container">
        <div class="row">
            <div class="col-sm">
                <div class="card">
                    <div class="card-header" style="background-color: #fff2cc">
                        <h2>Customer Information</h2>
                        <asp:Button ID="Button1" runat="server" Text="Go Back To Customer File" OnClick="Button1_Click" CausesValidation="false" CssClass="btn btn-success text-white" />
                    </div>
                    <div class="card-body shadow" style="background-color: #f1f8f7">
                        <asp:DetailsView
                            ID="dvCustomerInfo"
                            runat="server"
                            HorizontalAlign="Left"
                            DataSourceID="datasrcCustomerInfo"
                            DataKeyNames="customerID"
                            GridLines="Horizontal"
                            BorderWidth="0"
                            AutoGenerateRows="false"
                            Width="400px">
                            <Fields>
                                <asp:CommandField ShowEditButton="true" ButtonType="Image" ControlStyle-CssClass="btn btn1 btn-success text-white" ControlStyle-Width="70px" EditImageUrl="\GVAImages\edit.svg" UpdateImageUrl="\GVAImages\save.svg" CancelImageUrl="\GVAImages\cancel.svg" />
                                <asp:BoundField HeaderText="customerID" HeaderStyle-Font-Bold="true" DataField="customerID" SortExpression="customerID" HeaderStyle-CssClass="hidden" ReadOnly="true" ItemStyle-CssClass="hidden" />
                                <asp:BoundField HeaderText="First Name: " HeaderStyle-Font-Bold="true" DataField="firstName" SortExpression="firstName" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
                                <asp:BoundField HeaderText="Last Name: " HeaderStyle-Font-Bold="true" DataField="lastName" SortExpression="lastName" ReadOnly="False" ControlStyle-CssClass="form-control shadow-sm input-small" />
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
    </div>
    <br />
    <section style="background-color: #f1f8f7">
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="card-header">
                            <h2>Appraisal Information</h2>
                        </div>
                        <div class="card-body shadow">
                            <asp:Table ID="tbleAuctionPickUpForm" runat="server" CssClass="quick" Font-Bold="true">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblDate" runat="server" Text="Deadline:  "></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="date" runat="server" CssClass="form-control shadow-sm input-small" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="date"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="labSize" runat="server" Text="Size of Appraisal: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="textSize" runat="server" CssClass="form-control shadow-sm input-small"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="textSize"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="labInv" runat="server" Text="Inventory: "></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="textInv" runat="server" CssClass="form-control shadow-sm input-small" TextMode="MultiLine"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="textInv"
                                                    SetFocusOnError="true"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="lblType" runat="server" Text="Select the Type of Appraisal:" CssClass="quick"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList ID="typeList" runat="server" CssClass="form-control shadow-sm input-small custom-select">

                                            <asp:ListItem>Estate</asp:ListItem>
                                            <asp:ListItem>Family</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator4" runat="server" ErrorMessage="ErrorMessage" ControlToValidate="typeList"
                                                    SetFocusOnError="true" Display="Dynamic"
                                                    Text="* Required Field"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success text-white quick" Text="Submit Appraisal" OnClick="btnSubmit_Click" />
                                        
                                   </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblValid" runat="server" Text=""></asp:Label>
                                        </asp:TableCell>
                                </asp:TableRow>
                                <%--<asp:TableRow>
                                    <asp:TableCell>
                                        <h4>Select a file to upload:</h4>
                                        <input id="oFile" type="file" runat="server" name="oFile" />
                                    </asp:TableCell>
                                </asp:TableRow>--%>
                              <%--  <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button ID="btnUpload" type="submit" Text="Upload" runat="server" CssClass="btn btn-success" OnClick="btnUpload_Click"></asp:Button>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                                            <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                                        </asp:Panel>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Image ID="preview" runat="server" ImageUrl="/InventoryImages/Screenshot 1.jpg" Width="276px" Height="153px" />
                                    </asp:TableCell>
                                </asp:TableRow>--%>
                            </asp:Table>

                        </div>




                    </div>

                </div>




                <div>
                </div>
            </div>
        </div>
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
                        <asp:Button ID="btnSubmitNote" runat="server" Text="Save Note" OnClick="btnSubmitNote_Click" CausesValidation="false" class="btn btn-success text-white quick" />
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
                    <asp:Button ID="btnSubmitToDo" runat="server" Text="Submit" class="btn btn-success text-white quick" CausesValidation="false" OnClick="btnSubmitToDo_Click" />
                </div>
            </div>
        </div>

        <asp:SqlDataSource
            ID="datasrcCustomerInfo"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Lab4 %>"
            SelectCommand="SELECT customerID, firstName, lastName, emailAddress, phoneNumber, streetAddress, city, state, zipcode FROM dbo.CUSTOMER WHERE customerID = @customerID"
            UpdateCommand="UPDATE CUSTOMER SET firstName = @firstName, lastName =@lastName, emailAddress=@emailAddress, phoneNumber=@phoneNumber, streetAddress=@streetAddress, city=@city, state=@state, zipcode=@zipcode FROM dbo.CUSTOMER WHERE CUSTOMER.customerID = @customerID">
            <SelectParameters>
                <asp:SessionParameter Name="customerID" SessionField="customerID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="customerID" SessionField="customerID" Type="Int32" />
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="emailAddress" Type="String" />
                <asp:Parameter Name="phoneNumber" Type="String" />
                <asp:Parameter Name="streetAddress" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="zipcode" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </section>
    <footer class="sticky-bottom"></footer>
</asp:Content>


