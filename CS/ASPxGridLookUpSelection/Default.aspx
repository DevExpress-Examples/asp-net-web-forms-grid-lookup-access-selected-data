<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPxGridLookUpSelection.Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxMenu ID="ASPxMenu1" runat="server" RenderMode="Lightweight" Orientation="Vertical" Width="300px">
                <Items>
                    <dx:MenuItem NavigateUrl="~/ServerSide_SingleSelect.aspx" Text="Server Side - Single Selection">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/ServerSide_MultiSelect.aspx" Text="Server Side - Multi Selection">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/ClientSide_SingleSelect.aspx" Text="Client-Side - Single Selection">
                    </dx:MenuItem>
                    <dx:MenuItem NavigateUrl="~/ClientSide_MultiSelect.aspx" Text="Client-Side - Multi Selection">
                    </dx:MenuItem>
                </Items>
            </dx:ASPxMenu>
        </div>
    </form>
</body>
</html>
