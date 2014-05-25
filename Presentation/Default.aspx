<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentation.Default" %>

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
		<link rel="stylesheet" type="text/css" href="stylesheets/default.css" />
		<link rel="stylesheet" type="text/css" href="stylesheets/component.css" />
		<script src="javascript/modernizr-2.6.2.min.js"></script>	
        <script src="javascript/modernizr.custom.js"></script>
        <script src="javascript/modernizr.custom.buttons.js"></script>
    
        
</head>
	<body>
        
        <%--<button id="Button1" runat="server" class="btn btn-7 btn-7f btn-icon-only icon-star" onClick="autofill();return false;">Fav</button>--%>
         <form id="form2" runat="server"  >

        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
            <div class="container container-profile">
            <!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<a href="Login.aspx" class="button">Login</a>
                <a href="Register.aspx" class="button">Register</a>
			</div>
			<header>
				<h1> BIKEWAY <span>The best source for shared-bike information</span></h1>
			     <section>
				    <nav class="cl-effect-12 nav-link" >
					    <a href="Login.aspx" >Sign in</a>
                        <a href="Networks.aspx">Networks</a>
					    <a href="https://github.com/alinekborges/Bikeway_webApp" >GitHub</a>
					    <a href="About.aspx" >About</a>					    
					    <a href="Contact.aspx" >the app</a>
				    </nav>
			    </section>
            </header>            
			<div class="main-page">
               
                    <asp:Label ID="Label1" runat="server" Text="Search a station name, city or country" class="text-large"/>        
                    <br />
                    <div>
                        <asp:TextBox ID="cityInput" runat="server" CssClass="text-box-large" />
                        <br />
                        
                        <asp:Button id="demo1" CssClass="button" runat="server"  Text="search"/>
                        <%--<asp:button id="demo" class="button" onclick="onButtonClick()"  runat="server">get my location</asp:button>--%>
                        <%--<asp:ImageButton ID="searchButton" runat="server" ImageUrl="/images/appbar.magnify.png"  CssClass="button search-button"   />--%>
                        <br />
	
                       
                        <br />
                        <%--<a href="#set-8" class="hi-icon hi-icon-contract">Contact</a>--%>
                        <br />

                        <asp:ListView runat="server" ID="StationsListView" 
                            class="station-list" DataSourceID="ObjectDataSource1"  DataKeyNames="StationId"
                            >
                            <LayoutTemplate>
                            <table cellpadding="2" runat="server" id="stations" 
                                 class="station-list" >
                                <tr runat="server" id="itemPlaceholder">
                                </tr>
                            </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr id="tr1" runat="server" class="station-list"   >
                                <td class="StationName station-list-container station-list-main">

                                    <asp:Label  ID="FirstNameLabel" runat="server" 
                                        Text='<%#Eval("Name") %>' class="station-name"/> 
                        
                                     <br />
                       
                                    <asp:Label ID="Label2" runat="server" Text="Bikes:" CssClass="station-list-label" />
                                    <asp:Label  ID="Label5" runat="server" 
                                    Text='<%#Eval("FreeBikes") %>' class="station-name"/>
                       
                       
                                    <asp:Label ID="Label3" runat="server" Text="Slots:" CssClass="station-list-label" />
                                    <asp:Label  ID="Label4" runat="server" 
                                    Text='<%#Eval("Slots") %>' class="station-name"/>
                                </td>
                                <td class="StationName station-list-container station-list-city">

                                    <asp:Label  ID="Label6" runat="server" 
                                        Text='<%#Eval("City") %>' class="station-name"/>
                                     <br />
                                    <asp:Label  ID="Label8" runat="server" 
                                    Text='<%#Eval("Country") %>' class="station-name"/>

                                </td>                                       
       
                                </tr>
                            </ItemTemplate>
                 </asp:ListView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="searchAllInCity" TypeName="Business.DataObjectMethods">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cityInput" Name="Name" PropertyName="Text" Type="String" ConvertEmptyStringToNull="False" DefaultValue="" />
                                <asp:Parameter DbType="Guid" Name="UserId" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        
                    </div>
                
               
                </div>
		    
        
		    </div><!-- /container -->
            </AnonymousTemplate>
            <LoggedInTemplate>

            <div class="container container-profile">
            <!-- Top Navigation -->
			<div class="codrops-top clearfix">

                <asp:LoginStatus ID="LoginStatus2" runat="server" CssClass="button" />
		    
			</div>
			<header>
				<h1> BIKEWAY <span>The best source for shared-bike information</span></h1>
			     <section>
				    <nav class="cl-effect-12 nav-link" >
					    <a href="MemberPages/Profile.aspx" >Profile</a>
                        <a href="Networks.aspx">Networks</a>
					    <a href="https://github.com/alinekborges/Bikeway_webApplication_final/" >GitHub</a>
					    <a href="About.aspx" >About</a>					    
					    <a href="Contact.aspx" >the app</a>
				    </nav>
			    </section>
            </header>
            
			<div class="main-page">

               
                    <asp:Label ID="Label1" runat="server" Text="Search for a station, city or country" class="text-large"/>        
                    <br />
                    <div>
                        <asp:TextBox ID="cityInput" runat="server" CssClass="text-box-large" />
                        <br />
                        <asp:CheckBox ID="CheckBox1" runat="server"  Text="Search my city only" />
                        <br />
                     <asp:Button id="demo1" CssClass="button" runat="server"  Text="search"/>
                        <br />
                        <asp:Label ID="StatusLabel" runat="server" Text="" ></asp:Label>
                         <br />
	
                       
                        <br />
                       
                        <br />

                        <asp:ListView runat="server" ID="StationsListView" 
                            class="station-list" DataSourceID="ObjectDataSource1"  DataKeyNames="StationId" OnItemCommand="StationsListView_ItemCommand"
                            >
                            <LayoutTemplate>
                                <table cellpadding="3" runat="server" id="stations" class="station-list">
                                    <tr runat="server" id="itemPlaceholder">
                                    </tr>
                            </table>                        
                            
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr id="tr1" runat="server" class="station-list"   >
                                <td class="StationName station-list-container station-list-main">

                                    <asp:Label  ID="FirstNameLabel" runat="server" 
                                        Text='<%#Eval("Name") %>' class="station-name"/> 
                        
                                     <br />
                       
                                    <asp:Label ID="Label2" runat="server" Text="Bikes:" CssClass="station-list-label" />
                                    <asp:Label  ID="Label5" runat="server" 
                                    Text='<%#Eval("FreeBikes") %>' class="station-name"/>
                       
                       
                                    <asp:Label ID="Label3" runat="server" Text="Slots:" CssClass="station-list-label" />
                                    <asp:Label  ID="Label4" runat="server" 
                                    Text='<%#Eval("Slots") %>' class="station-name"/>
                                </td>
                                <td class="StationName station-list-container station-list-city">

                                    <asp:Label  ID="Label6" runat="server" 
                                        Text='<%#Eval("City") %>' class="station-name"/>
                                     <br />
                                    <asp:Label  ID="Label8" runat="server" 
                                    Text='<%#Eval("Country") %>' class="station-name"/>

                                </td>                                       
                                <td >                                          
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="/images/appbar.star.png" CssClass="button-fav" commandname="Favorite" />
                                </td>           
                                </tr>
                            </ItemTemplate>
                 </asp:ListView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="searchAllInCity" TypeName="Business.DataObjectMethods" OnSelecting="ObjectDataSource1_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cityInput" Name="Name" PropertyName="Text" Type="String" ConvertEmptyStringToNull="False" DefaultValue="" />
                                <asp:Parameter DbType="Guid" Name="UserId" />
                            </SelectParameters>
                        </asp:ObjectDataSource>

                        
                    </div>
                
               
                </div>
		    
        
		</div><!-- /container -->
             </LoggedInTemplate>
        </asp:LoginView> 


		<%--<!-- All modals added here for the demo. You would of course just have one, dynamically created -->
		<div class="md-modal md-effect-16" id="modal-16">
			<div class="md-content">
				<h3>Bikeway</h3>
				<div>
                    
					<p>Welcome to bikeway! Please login or press continue</p>
					<ul>
						
					</ul>
                    
					<button class="md-close">Close me!</button>
				</div>
			</div>
		</div>--%>


          </form>

		<div class="md-overlay"></div><!-- the overlay element -->

		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="javascript/classie.js"></script>
		<script src="javascript/modalEffects.js"></script>
        <script src="javascript/polyfills.js"></script>

		<!-- for the blur effect -->
		<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
		<script>
		    // this is important for IEs
		    var polyfilter_scriptpath = '/javascript/';
		</script>
		<script src="javascript/cssParser.js"></script>
		<script src="javascript/css-filters-polyfill.js"></script>

        </body>
</html>