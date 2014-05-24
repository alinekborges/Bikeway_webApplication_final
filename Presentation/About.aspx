<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Presentation.About" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
		<title>Bikeway</title>
		<meta name="description" content="BikeWay" />
		<meta name="author" content="Aline & Lucas" />
		<link rel="shortcut icon" href="../favicon.ico" /> 
		<link rel="stylesheet" type="text/css" href="stylesheets/default.css" />
		<link rel="stylesheet" type="text/css" href="stylesheets/component.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/component2.css" />
		<script src="javascript/modernizr-2.6.2.min.js"></script>	
        <script src="javascript/modernizr.custom.js"></script>
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
                    <p> Developed by:
                        <br />
                        @author Aline Borges
                        <br />
                        @author Lucas Dilts
                    </p>		
                 </div>	
                <div class="column-right">
                    <header>
                        With some help from:
                    </header>
                    <p>                        
                        <a href="http://api.citybik.es/v2/" > CityBik API version 2 </a>
                    </p>	
                    <p>                        
                        <a href="http://tympanus.net/codrops" > Codedrops  </a>
                    </p>
                    <p>                        
                        <a href="http://h5bp.github.io/Effeckt.css/" > Css effekts  </a>
                    </p>
                    <p>                        
                        <a href="https://www.qut.edu.au/study/unit-search/unit?unitCode=INB373&idunit=39977" > QUT INB373 Web Application Development  </a>
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
