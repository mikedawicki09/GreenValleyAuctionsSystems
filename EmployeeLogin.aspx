<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeLogin.aspx.cs" Inherits="GreenValleyAuctionsSystem.EmployeeLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
    <style type="text/css">
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


    <h1>Employee Login</h1>


    <section style="background-color: #f1f7f8">
        <div class="container row center">

            <div>

                <asp:Table ID="tbleUserLogin" runat="server" CssClass="center" class="quick">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox
                                ID="txtUsername"
                                runat="server"
                                Placeholder="Username" CssClass="txtBox form form-control"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox
                                ID="txtUserPass"
                                runat="server"
                                TextMode="Password"
                                Placeholder="Password" CssClass="txtBox  form form-control"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <asp:Button
                                ID="btnSignIn"
                                runat="server"
                                Text="Login" Width="200px"
                                OnClick="btnSignIn_Click" class="btn btn-primary btn-success shadow-sm" />
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                <br />
                <asp:Table ID="tblStatus" runat="server" CssClass="center" class="quick">
                    <asp:TableRow>
                        <asp:TableCell Wrap="true">
                            <asp:Label
                                ID="lblStatus" Visible="false"
                                runat="server" CssClass="alert alert-success arrow-left quick"
                                Text="" Width="300px"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </section>
</asp:Content>


