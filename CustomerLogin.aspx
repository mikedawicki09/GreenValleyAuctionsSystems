<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralMaster.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="GreenValleyAuctionsSystem.CustomerLogin" %>

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
        .jose{
            font-family: 'Josefin Sans', sans-serif;
            font-size:larger;
        }
    </style>
    <br />
    <br />
    <br />
    <br />

   <h1>Customer Login </h1>
    <section style="background-color:#f1f7f8">
        
        <div class="container row center">
            
            <asp:Table ID="tblCustomerLogin" runat="server" CssClass="quick" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:TextBox
                            ID="txtUsername"
                            runat="server" Width="200px"
                            Placeholder="Username" CssClass="txtBox form form-control" ></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:TextBox
                            ID="txtPassword"
                            runat="server" Width="200px"
                            TextMode="Password"
                            Placeholder="Password" CssClass="txtBox  form form-control" ></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Button
                            ID="btnLogin"
                            runat="server" Width="200px"
                            Text="Login"
                            OnClick="btnLogin_Click" class="btn btn-primary btn-success shadow-sm" />
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
             <asp:Table ID="tblStatus" runat="server" CssClass="quick" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Label
                            ID="Label1"
                            runat="server" Width="300"
                            Text="" ></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 </asp:Table>
            <asp:Table ID="tblNewAcct" runat="server" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="lblText" runat="server" Text="Don't have an account? " CssClass="jose" ForeColor="DarkGreen"></asp:Label>
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="Click here." NavigateUrl="CustomerSignUp.aspx"  ForeColor="DarkGreen"></asp:HyperLink>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="Table2" runat="server" HorizontalAlign="Center" CssClass="quick">
        <asp:TableRow>
            <asp:TableCell Wrap="true" CssClass="text-center">
                <asp:Label ID="lblStatus" runat="server" Text="" Width="300px" ></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        </div>
 </section>
</asp:Content>



