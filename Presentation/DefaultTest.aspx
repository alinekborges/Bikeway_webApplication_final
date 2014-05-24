<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultTest.aspx.cs" Inherits="Presentation.DefaultTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StationId" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:BoundField DataField="StationId" HeaderText="StationId" ReadOnly="True" SortExpression="StationId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude" />
                <asp:BoundField DataField="FreeBikes" HeaderText="FreeBikes" SortExpression="FreeBikes" />
                <asp:BoundField DataField="Slots" HeaderText="Slots" SortExpression="Slots" />
                <asp:BoundField DataField="StationTimeStamp" HeaderText="StationTimeStamp" SortExpression="StationTimeStamp" />
                <asp:BoundField DataField="NetworkId" HeaderText="NetworkId" SortExpression="NetworkId" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectClosestStations" TypeName="Business.DataObjectMethods">
            <SelectParameters>
                <asp:Parameter DefaultValue="0.0" Name="LatLow" Type="Double" />
                <asp:Parameter DefaultValue="0.0" Name="LatHigh" Type="Double" />
                <asp:Parameter DefaultValue="0.0" Name="LongLow" Type="Double" />
                <asp:Parameter DefaultValue="0.0" Name="LongHigh" Type="Double" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
