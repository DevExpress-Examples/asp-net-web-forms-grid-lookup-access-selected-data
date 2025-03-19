<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="ClientSide_MultiSelect.aspx.vb" Inherits="ASPxGridLookUpSelection.ClientSide_MultiSelect" %>

<%@ Register Assembly="DevExpress.Web.v24.2, Version=24.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function OnGetSelectionButtonClick(s, e) {
            var grid = gridLookUp.GetGridView();
            grid.GetSelectedFieldValues('ProductName', OnGetSelectedFieldValues);
        }
        function OnGetSelectedFieldValues(selectedValues) {
            if (selectedValues.length == 0) return;
            s = "";
            for (i = 0; i < selectedValues.length; i++) {
                for (j = 0; j < selectedValues[i].length; j++) {
                    s = s + selectedValues[i][j];
                }
                s += "\n";
            }
            alert("Selected Products:\n" + s);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Go to the Default Page" NavigateUrl="~/Default.aspx">
            </dx:ASPxHyperLink>

            <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" TextFormatString="{0}" ClientInstanceName="gridLookUp" AutoGenerateColumns="False"
                SelectionMode="Multiple" DataSourceID="AccessDataSource1" Width="300px" KeyFieldName="ProductID">
                <GridViewProperties>
                    <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
                </GridViewProperties>
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" ShowSelectCheckbox="true">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridLookup>

            <%--Get Selection:--%>
            <dx:ASPxButton ID="GetSelectionButton" runat="server" AutoPostBack="false" Text="Get Selected Product">
                <ClientSideEvents Click="OnGetSelectionButtonClick" />
            </dx:ASPxButton>

            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Products]"></asp:AccessDataSource>
        </div>
    </form>
</body>
</html>