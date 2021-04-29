    <%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="UploadFiles.aspx.cs" Inherits="GreenValleyAuctionsSystem.UploadFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />

    <h1>Select a File to Upload:</h1>
    
    <section style="background-color:#f1f8f7">
    <div class="container">
        <h2>Choose File Type:</h2>
        <asp:RadioButtonList ID="rbfiletype" runat="server">
            <asp:ListItem>Image</asp:ListItem>
            <asp:ListItem>Video</asp:ListItem>
            <asp:ListItem>Contract</asp:ListItem>
            <asp:ListItem>Information File</asp:ListItem>
        </asp:RadioButtonList>
        <input id="oFile" type="file" runat="server" name="oFile" class="btn btn-success text-white" />
        <asp:Button ID="btnUpload" type="submit" Text="Upload" runat="server" CssClass="btn btn-success text-white" OnClick="btnUpload_Click" ></asp:Button>
        <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
            <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
        </asp:Panel>
    </div>
    <br />
    <br />
    <br />
   <div class="container">
       
       <div class="col-lg-6" style="margin-left:30px">
           <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btsearch" runat="server" Text="Search" CssClass="btn btn-success text-white" OnClick="btsearch_Click"/>
                    <asp:Label ID="lblfilter" runat="server" Text="Filter By:"></asp:Label>
                    <asp:DropDownList ID="ddlfilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlfilter_SelectedIndexChanged" CssClass="btn btn-success text-white">
                        <asp:ListItem>No Filter</asp:ListItem>
                        <asp:ListItem>Contract</asp:ListItem>
                        <asp:ListItem>Image</asp:ListItem>
                        <asp:ListItem>Video</asp:ListItem>
                        <asp:ListItem>Information File</asp:ListItem>
                    </asp:DropDownList>
       <div class="card shadow">
           <div class="card-header" style="background-color:#fff2cc"><h2>Associated Files</h2></div>
           <div class="card-body" style="height:300">
    <asp:GridView ID="grdvwFileTable"
        runat="server"
        DataSourceID="datasrcFileTable"
        AllowSorting="true"
        AllowPaging="true"
        AutoGenerateColumns="false"
        OnRowCommand="grdvwFileTable_RowCommand"
        DataKeyNames="fileID"
        GridLines="Horizontal"
         BorderWidth="0"
        EmptyDataText="No files in database associated with this service."
        AlternatingRowStyle-BackColor="#f1f8f7" CellPadding="5" HeaderStyle-HorizontalAlign="Left" HeaderStyle-BackColor="white"
        HeaderStyle-ForeColor="#1c593f">
        <Columns>
            <asp:BoundField DataField="fileID" HeaderText="File ID" SortExpression="fileID"  HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" ReadOnly="true" Visible="false"/>
            <asp:BoundField DataField="fileName" HeaderText="File Name" SortExpression="fileName" ItemStyle-Width="150px" />
            <asp:BoundField DataField="fileType" HeaderText="File Type" SortExpression="fileType" ItemStyle-Width="150px"/>
            <asp:BoundField DataField="serviceID" HeaderText="Service ID" SortExpression="serviceID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" ReadOnly="true" Visible="false"/>
            <asp:ButtonField ButtonType="Link" CommandName="View" Text="View" />
        </Columns>
    </asp:GridView>
               </div>
           </div>
           </div>
       
       </div>
    <asp:SqlDataSource ID="datasrcFileTable" runat="server" ConnectionString="<%$ ConnectionStrings:Lab4 %>"></asp:SqlDataSource>
        </section>
    <footer class="sticky-bottom"></footer>
</asp:Content>


