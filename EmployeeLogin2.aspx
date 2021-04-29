<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeLogin2.aspx.cs" Inherits="GreenValleyAuctionsSystem.EmployeeLogin2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Bootstrap v5.0.0-beta1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
    <link href="css/custom.css" rel="stylesheet" type="text/css" />
    <link href="styles.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet" />
    <title>Log In-Green Valley Auctions</title>

</head>
<body>
    <nav class="nav navbar navbar-expand-lg navbar-custom fixed-top shadow-sm" id="mainNav" style="margin-bottom=50px">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="empdashboard.html">
                <img src="images/header-logo.png"></a>
        </div>
    </nav>

    <form class="container form col-xs-4" id="form1" runat="server">

        

        <div class="container">
            <br />
                        <br />
                        <br />
                        <br />
            <h1>Employee Login</h1>

          
                        
                     <!-- <%--<asp:Label
                            ID="lblLogin"
                            runat="server"
                            Text="Employee Login" Font-Bold="true" class="h1"></asp:Label>--%> -->
            <div class="justify-content-center">

            
                
     <div class="container row" style="text-align: center;">  
       
             <div class="col-md-12">
                        <asp:TextBox
                            ID="txtUsername"
                            runat="server"
                            Placeholder="Username" CssClass="txtBox"></asp:TextBox>
                 </div>
             
        </div>     
       
      <div class="container row center" style="text-align: center;">          
          <div class="col-md-12">
                
                        <asp:TextBox
                            ID="txtUserPass"
                            runat="server"
                            TextMode="Password"
                            Placeholder="Password" CssClass="txtBox"></asp:TextBox>
              </div>
       </div> 
        <div class="container row" style="text-align: center;">         
            <div class="col-md-12"> 
     
                        <asp:Button
                            ID="btnSignIn"
                            runat="server"
                            Text="Login"
                            OnClick="btnSignIn_Click" class="btn btn-primary btn-success shadow-sm" />
      
            </div>   
            
        </div>   
        <div style="text-align: center;">      
                        <asp:Label
                            ID="lblStatus"
                            runat="server"
                            Text="" Font-Size="12px"></asp:Label>
            
        </div>      
            



        </div>
            </div>
    </form>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>

