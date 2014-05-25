﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Presentation.MemberPages.Profile" %><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head id="Head1" runat="server">		<meta charset="UTF-8" />		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 		<title>Bikeway</title>		<meta name="description" content="BikeWay />		<meta name="author" content="Aline & Lucas" />		<link rel="shortcut icon" href="../favicon.ico"> 		<link rel="stylesheet" type="text/css" href="../stylesheets/default.css" />		<link rel="stylesheet" type="text/css" href="../stylesheets/component.css" />		 <link rel="stylesheet" type="text/css" href="stylesheets/component2.css" />		<script src="javascript/modernizr-2.6.2.min.js"></script>	        <script src="javascript/modernizr.custom.js"></script></head><body>    <form runat="server">    <div class="container-profile container">    <!-- Top Navigation -->	<div class="codrops-top clearfix" >            <a href="../Default.aspx" class="button">Home</a>             					</div>	<header>		<h1> BIKEWAY </h1>	    <section>				    <nav class="cl-effect-12">					    <a href="../Default.aspx" >Home</a>                        <a href="../Networks.aspx">Networks</a>					    <a href="https://github.com/alinekborges/Bikeway_webApp" >GitHub</a>					    <a href="../About.aspx" >About</a>					    					    <a href="../Contact.aspx" >Contact</a>				    </nav>			    </section>    </header>        <div class="main clearfix">            <div class="column" >                <h1>Welcome, <asp:LoginName ID="LoginName1" runat="server" class="welcome"/> </h1>                <br />                <br />                <asp:LoginStatus ID="LoginStatus2" runat="server"  CssClass="button"/>                <br />                <br />                <asp:Label runat="server" Text="What city do you live in?" CssClass="text-large" />                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="ObjectDataSource2">                    <Columns>                        <asp:CommandField ShowEditButton="True" />                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />                    </Columns>                </asp:GridView>                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="" DeleteMethod="deleteUserCity" InsertMethod="insertUserCity" OldValuesParameterFormatString="original_{0}" SelectMethod="selectUserCity" TypeName="Business.DataObjectMethods" UpdateMethod="updateUserCity" OnSelecting="ObjectDataSource2_Selecting" OnUpdating="ObjectDataSource2_Updating">                    <InsertParameters>                        <asp:Parameter DbType="Guid" Name="UserId" />                        <asp:Parameter Name="City" Type="String" />                    </InsertParameters>                    <SelectParameters>                        <asp:Parameter DbType="Guid" Name="UserId" />                    </SelectParameters>                    <UpdateParameters>                        <asp:Parameter Name="City" Type="String" />                        <asp:Parameter DbType="Guid" Name="Original_UserId" />                    </UpdateParameters>                </asp:ObjectDataSource>                <br />                <br />                <asp:TextBox runat="server" CssClass="text-box" />                <asp:Button  runat="server" CssClass="button"  OnClick="Unnamed_Click"/>            </div>            <div class="column" >                <h1>Favorites</h1>                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>                <asp:Label ID="Status"  runat="server"/>                <asp:ListView runat="server" ID="StationsListView" DataKeyNames="StationId"                     DataSourceID="ObjectDataSource1" class="station-list" OnItemCommand="StationsListView_ItemCommand">                    <LayoutTemplate>                    <table  runat="server" id="stations" >                        <tr runat="server" id="itemPlaceholder">                        </tr>                    </table>                    </LayoutTemplate>                    <ItemTemplate>
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
                                  
                                <td >                                          
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="/images/appbar.star.delete.png" CssClass="button-fav" commandname="Favorite" />
                                </td>           
                                </tr>
                            </ItemTemplate>                </asp:ListView>                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" OnSelecting="ObjectDataSource1_Selecting" SelectMethod="getSingleUserFavouriteStations" TypeName="Business.DataObjectMethods" DeleteMethod="deleteFavourite">                    <DeleteParameters>                        <asp:Parameter DbType="Guid" Name="Original_UserId" />                        <asp:Parameter Name="Original_StationID" Type="String" />                    </DeleteParameters>                    <SelectParameters>                        <asp:Parameter DbType="Guid" Name="UserId" />                    </SelectParameters>                </asp:ObjectDataSource>                <br />                        </div>        </div>    </div><%--    <form id="form1" runat="server">        <asp:LoginView ID="LoginView1" runat="server" >            <LoggedInTemplate>                Welcome,                <asp:LoginName ID="LoginName1" runat="server" />                .<br />                <asp:LoginStatus ID="LoginStatus2" runat="server" />                <br />            </LoggedInTemplate>        </asp:LoginView>        <br />        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>        <br />        </form>--%>        <%--<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">            <Columns>                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude" />                <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />                <asp:BoundField DataField="FreeBikes" HeaderText="FreeBikes" SortExpression="FreeBikes" />                <asp:BoundField DataField="Slots" HeaderText="Slots" SortExpression="Slots" />                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />            </Columns>        </asp:GridView>--%>                </form>    <script src="javascript/cssParser.js"></script>	<script src="javascript/css-filters-polyfill.js"></script>    <script src="js/polyfills.js"></script></body></html>