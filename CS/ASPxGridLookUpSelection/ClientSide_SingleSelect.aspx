<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientSide_SingleSelect.aspx.cs" Inherits="ASPxGridLookUpSelection.ClientSide_SingleSelect" %>

<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function OnGetSelectionButtonClick(s, e) {
            var grid = gridLookUp.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'ProductName;ProductID', OnGetRowValues);
        }
        function OnGetRowValues(values) {
            if (values[0] == null) return;
            alert('Product: ' + values[0]);
        }
    </script>
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

            <%--Get Selection:--%>
            <dx:ASPxButton ID="GetSelectionButton" runat="server" AutoPostBack="false" Text="Get Selected Product">
                <ClientSideEvents Click="OnGetSelectionButtonClick" />
            </dx:ASPxButton>

            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Products]" />
        </div>
    </form>
</body>
</html>
