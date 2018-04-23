<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to display master-detail data using two ASPxCardView controls.</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>


<dx:ASPxCardView ID="ASPxCardView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsCategories" KeyFieldName="CategoryID">
    <ClientSideEvents FocusedCardChanged="function(s, e) {
        cardView2.PerformCallback(s.GetFocusedCardIndex());    
    }" />
    <Settings ShowTitlePanel="True" />
    <SettingsBehavior AllowFocusedCard="True" />
    <SettingsText Title="Categories" />
    <SettingsPager>
        <SettingsTableLayout RowsPerPage="2" />
    </SettingsPager>
    <Columns>
        <dx:CardViewTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0" Visible="false">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="CategoryName" VisibleIndex="1">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="Description" VisibleIndex="2">
        </dx:CardViewTextColumn>
    </Columns>
</dx:ASPxCardView>  
<br />
<dx:ASPxCardView ID="ASPxCardView2" KeyFieldName="ProductID" OnCustomCallback="ASPxCardView2_CustomCallback" ClientInstanceName="cardView2" runat="server" AutoGenerateColumns="False">
    <SettingsText Title="Products" />
    <SettingsPager>
        <SettingsTableLayout RowsPerPage="2" />
    </SettingsPager>
    <Settings ShowTitlePanel="True" />
    <Columns>
        <dx:CardViewTextColumn FieldName="ProductID" ReadOnly="True" Visible="False" VisibleIndex="0">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="ProductName" VisibleIndex="1">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="UnitPrice" VisibleIndex="2">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="UnitsInStock" VisibleIndex="3">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="QuantityPerUnit" VisibleIndex="4">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="CategoryID" Visible="False" VisibleIndex="5">
        </dx:CardViewTextColumn>
    </Columns>
</dx:ASPxCardView>  
<br />
<asp:AccessDataSource ID="dsCategories" runat="server" DataFile="~/App_Data/nwind.mdb"
    SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
</asp:AccessDataSource>
<asp:AccessDataSource ID="dsProducts" runat="server" DataFile="~/App_Data/nwind.mdb"
    SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], 
    [QuantityPerUnit] FROM [Products] WHERE ([CategoryID] = ?)">
    <SelectParameters>
        <asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
    </SelectParameters>
</asp:AccessDataSource>

    </div>
    </form>
</body>
</html>