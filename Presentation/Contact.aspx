﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Presentation.MemberPages.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
		<title>Bikeway</title>
		<meta name="description" content="BikeWay" />
		<meta name="author" content="Aline & Lucas" />
		<link rel="shortcut icon" href="../images/favicon.ico" />
        <link rel="icon" href="../images/favicon.ico" type="image/ico" />
		<link rel="stylesheet" type="text/css" href="stylesheets/default.css" />
		<link rel="stylesheet" type="text/css" href="stylesheets/component.css" />
		<script src="js/modernizr.custom.js"></script>
</head>
<body>

    <div class="container">
            <!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<form id="login" runat="server">
                    <asp:LoginView ID="LoginView1" runat="server">
                        <AnonymousTemplate>
                            <a href="Login.aspx" class="button">Login</a>
                            <a href="Register.aspx" class="button">Register</a>
                        </AnonymousTemplate>
                        <LoggedInTemplate>
                            <asp:LoginStatus ID="LoginStatus2" runat="server" CssClass="button" />
                        </LoggedInTemplate>
                    </asp:LoginView>
                </form>  
			</div>
			<header>
				<h1> BIKEWAY <span>The best source for shared-bikes information</span></h1>
			    <section>
				    <nav class="cl-effect-12">
					    <a href="Default.aspx" >Home</a>
                        <a href="Networks.aspx">Networks</a>
					    <a href="https://github.com/alinekborges/Bikeway_webApplication_final/" >GitHub</a>
					    <a href="About.aspx" >About</a>					    
					    <a href="Contact.aspx" >Contact</a>
				    </nav>
			    </section>
            </header>
			<div class="main clearfix">
                <div class="column">
                    <p>Aline K Borges
                        <br />
                        alinekborges@gmail.com
                    </p>		
                 </div>	
                <div class="column-left column">
                    <p>
                        Lucas M. Dilts
                        <br />
                        lucasdilts@gmail.com
                    </p>		
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
