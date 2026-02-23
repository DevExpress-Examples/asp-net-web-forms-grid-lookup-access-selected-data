<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServerSide_SingleSelect.aspx.cs" Inherits="ASPxGridLookUpSelection.ServerSide_SingleSelect" %>

<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Go to the Default Page" NavigateUrl="~/Default.aspx" />

            <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" ClientInstanceName="gridLookUp" TextFormatString="{0}" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" Width="300px" KeyFieldName="ProductID">
                <GridViewProperties>
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                </GridViewProperties>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" />
                    <dx:GridViewDataTextColumn FieldName="ProductName" />
                    <dx:GridViewDataTextColumn FieldName="CategoryID" />
                    <dx:GridViewDataTextColumn FieldName="UnitPrice" />
                </Columns>
            </dx:ASPxGridLookup>

            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Selected Products" PopupElementID="GetSelectionButton">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxListBox ID="ASPxListBox1" runat="server" ValueType="System.String" Width="100%" />
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <%--Get Selection:--%>
            <dx:ASPxButton ID="GetSelectionButton" runat="server" OnClick="GetSelectionButton_Click" Text="Get Selected Product" />
            <%--Set Selection:--%>
            <dx:ASPxButton ID="SetSelectionButton" runat="server" OnClick="SetSelectionButton_Click" Text="Set Selected Product" />

            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Products]" />
        </div>
    </form>
</body>
</html>
