<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeFacingMaster.Master" AutoEventWireup="true" CodeBehind="AuctionPickUpForm.aspx.cs" Inherits="GreenValleyAuctionsSystem.AuctionPickUpForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
     <h1 class="text-uppercase">Auction Pick Up Form</h1>
     <br />
    <div class="row">
        <div class="col-sm">
            <div class="card shadow ">
                <fieldset style="padding:10px;">
                <div style="display: flex; justify-content: center;">
        <asp:Calendar  ID="calTraining" runat="server" BackColor="White" BorderColor="#999999" 
      CellPadding="4" DayNameFormat="short" style="padding:10px;"
      ForeColor="Black" Height="400px" Width="75%" ShowGridLines="true" ShowNextPrevMonth="true">
    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
    <SelectorStyle BackColor="#CCCCCC" />
    <WeekendDayStyle BackColor="#FBFBF6"  Font-Size="Smaller"/>
    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
    <NextPrevStyle VerticalAlign="Bottom" />
    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
    <TitleStyle Font-Names="Joesphine Sans,sans-serif" ForeColor="#1C593F" Font-Size="25px" BackColor="#FFF2CC"/>
    </asp:Calendar>
               
                    </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
    <div class="row">
    <div class="col-sm">
    <div class="card shadow">
            <fieldset ID="dates" style="padding:10px;" >
                <asp:Table ID="tble" runat="server" CellSpacing="7">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblDate" runat="server" Text="" ></asp:Label>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblBringIn" runat="server" Text="Bring in Date: "></asp:Label>                       
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtBringIn" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPickUp" runat="server" Text="Pick up Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPickUp" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblLookAt" runat="server" Text="Look at Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLookAt" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblAppraisal" runat="server" Text="Appraisal Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAppraisal" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblStorage" runat="server" Text="Storage Location: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStorage" runat="server"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                       <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label  ID="lblSales" runat="server" Text="Sales Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtSales" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnPossibleSubmit" runat="server" Text="Submit" OnClick="btnPossibleSubmit_Click" />
                        </asp:TableCell>
                        <asp:TableCell>
                    <asp:Label ID="lblSuccess" runat="server" Text="" Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>  
        </div>
        </div>
        <div class="col-sm">
    <div class="card shadow">
            <fieldset  style="padding:10px;">
                <asp:Table ID="tblePossibleDates" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossibleDates" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                   </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossBring" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossPick" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossLook" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossAppraisal" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossStorage" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPossSales" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>                          
                </asp:Table>
            </fieldset>
        </div>
        </div>
        </div>
        </div>
</asp:Content>
