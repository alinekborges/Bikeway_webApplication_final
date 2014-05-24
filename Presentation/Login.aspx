<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentation.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Bikeway</title>
		<meta name="description" content="BikeWay />
		<meta name="author" content="Aline & Lucas" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="stylesheets/default.css" />
		<link rel="stylesheet" type="text/css" href="stylesheets/component.css" />
		<script src="js/modernizr.custom.js"></script>
</head>
<body>

    <div class="container">
            <!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<span class="right"><button class="md-trigger" data-modal="modal-16">Sign in</button></span>
			</div>
			<header>
				<h1> BIKEWAY <span>The best source for shared-bikes information</span></h1>
			<section>
				    <nav class="cl-effect-12">
					    <a href="MemberPages/Profile.aspx" >Profile</a>
                        <a href="Networks.aspx">Networks</a>
					    <a href="https://github.com/alinekborges/Bikeway_webApp" >GitHub</a>
					    <a href="About.aspx" >About</a>					    
					    <a href="Contact.aspx" >Contact</a>
				    </nav>
			    </section>
            </header>
			<div class="main clearfix">
                <div class="column">
                    <p>Log in to save your favorite stations, manage your profile and much more!</p>		
                 </div>	
				<div class="column">
					<div class="column">
				    <form id="form1" runat="server" >
                        <div>    
                            <h1>Login</h1>
                            <p>
                                <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/MemberPages/Profile.aspx">
                                    <LayoutTemplate>                             

                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            <br />
                                            <asp:TextBox CssClass="text-box" ID="UserName" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            <br />
                                            <asp:TextBox class="text-box" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            <br />  
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />                                                    
                                            <br />                                                    
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            <br />    
                                            
                                                  
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" class="button"/>                    
                                            <a href="Register.aspx" class="button">Register</a>
                                            
                                           
                                    </LayoutTemplate>
                                    

                                </asp:Login>
                            </p>
                            <p>
                                &nbsp;</p>    
                        </div>
                    </form>				
				    </div>
				</div>
                	
			</div>
		</div><!-- /container -->
		<div class="md-overlay"></div><!-- the overlay element -->

		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="js/classie.js"></script>
		<script src="js/modalEffects.js"></script>

		<!-- for the blur effect -->
		<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
		<script>
		    // this is important for IEs
		    var polyfilter_scriptpath = '/js/';
		</script>
		<script src="js/cssParser.js"></script>
		<script src="js/css-filters-polyfill.js"></script>
</body>
</html>
