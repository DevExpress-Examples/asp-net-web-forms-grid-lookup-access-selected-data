<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128531222/24.2.1%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4742)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->

# Grid Lookup for ASP.NET Web Forms - How to access selected data

This example demonstrates how to access selected data on the client and server in single and multiple [selection modes](https://docs.devexpress.com/AspNet/9075/components/grid-view/concepts/aspxgridlookup/selection-modes).

## Access selection on the client in single selection mode

To get the selected row value on the client in single selection mode, call the [ASPxClientGridView.GetRowValues](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.GetRowValues(visibleIndex-fieldNames-onCallback)) method.
  
```js  
function OnGetSelectionButtonClick(s, e) {  
    var grid = gridLookUp.GetGridView();  
    grid.GetRowValues(grid.GetFocusedRowIndex(), 'ProductName;ProductID', OnGetRowValues);  
}  

function OnGetRowValues(values) {  
    if (values[0] == null) return;  
    alert('Product: ' + values[0]);  
}  
```

## Access selection on the client in multiple selection mode

To get selected row values on the client in multiple selection mode, call the [ASPxClientGridView.GetSelectedFieldValues](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.GetSelectedFieldValues(fieldNames-onCallback)) method.
  
```js  
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
```

## Access selection on the server in single selection mode

To get the selected row value on the server in single selection mode, call the [ASPxGridView.GetRowValues](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.GetRowValues(System.Int32-System.String--)) method.
  
```cs  
protected void GetSelectionButton_Click(object sender, EventArgs e) {  
    ASPxGridView grid = ASPxGridLookup1.GridView;  
    object value = grid.GetRowValues(grid.FocusedRowIndex, new string[] { "ProductName" });  
    ASPxListBox1.Items.Clear();  

    if(value != null) {  
        ASPxListBox1.Items.Add(value.ToString());  
    }  
}  
```  
  
```vb  
Protected Sub GetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)  
    Dim grid As ASPxGridView = ASPxGridLookup1.GridView  
    Dim value As Object = grid.GetRowValues(grid.FocusedRowIndex, New String() { "ProductName" })  
    ASPxListBox1.Items.Clear()  

    If value IsNot Nothing Then  
        ASPxListBox1.Items.Add(value.ToString())  
    End If  
End Sub  
```  

To set selected rows on the server, use the [ASPxGridLookup.Value](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridLookup.Value) property.  
    
```cs  
protected void SetSelectionButton_Click(object sender, EventArgs e) {  
    int maxUnitPrice = 0;  
    int maxUnitPriceKey = 0;  

    ASPxGridView grid = ASPxGridLookup1.GridView;  
    for(int i = grid.VisibleStartIndex; i < grid.VisibleRowCount; i++) {  
        int unitPrice = Convert.ToInt32(grid.GetRowValues(i, new string[] { "UnitPrice" }));  
        maxUnitPrice = (unitPrice > maxUnitPrice) ? unitPrice : maxUnitPrice;  
        maxUnitPriceKey = (unitPrice == maxUnitPrice) ? i : maxUnitPriceKey;  
    }  
    ASPxGridLookup1.Value = maxUnitPriceKey;  
}  
```  
  
```vb  
Protected Sub SetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)  
    Dim maxUnitPrice As Integer = 0  
    Dim maxUnitPriceKey As Integer = 0  

    Dim grid As ASPxGridView = ASPxGridLookup1.GridView  
    For i As Integer = grid.VisibleStartIndex To grid.VisibleRowCount - 1  
        Dim unitPrice As Integer = Convert.ToInt32(grid.GetRowValues(i, New String() { "UnitPrice" }))  
        maxUnitPrice = If(unitPrice > maxUnitPrice, unitPrice, maxUnitPrice)  
        maxUnitPriceKey = If(unitPrice = maxUnitPrice, i, maxUnitPriceKey)  
    Next i  
    ASPxGridLookup1.Value = maxUnitPriceKey  
End Sub  
```  


## Access selection on the server in multiple selection mode
 
To get selected row values on the server in multiple selection mode, call the [ASPxGridView.GetSelectedFieldValues](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridBase.GetSelectedFieldValues(System.String--)) method.
  
```cs  
protected void GetSelectionButton_Click(object sender, EventArgs e) {  
    ASPxGridView grid = ASPxGridLookup1.GridView;  
    List<object> fieldValues = grid.GetSelectedFieldValues(new string[] { "ProductName" });  
    ASPxListBox1.Items.Clear();  

    if(fieldValues.Count > 0) {  
        foreach(object item in fieldValues)  
            ASPxListBox1.Items.Add(item.ToString());  
    }  
}  
```  
  
```vb  
Protected Sub GetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)  
    Dim grid As ASPxGridView = ASPxGridLookup1.GridView  
    Dim fieldValues As List(Of Object) = grid.GetSelectedFieldValues(New String() { "ProductName" })  
    ASPxListBox1.Items.Clear()  

    If fieldValues.Count > 0 Then  
        For Each item As Object In fieldValues  
            ASPxListBox1.Items.Add(item.ToString())  
        Next item  
    End If  
End Sub  
```  

To set selected rows on the server, use the [ASPxGridLookup.Value](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridLookup.Value) property.  
  
```cs  
protected void SetSelectionButton_Click(object sender, EventArgs e) {  
    ASPxGridView grid = ASPxGridLookup1.GridView;  
    int minUnitPrice = 25;  

    grid.Selection.UnselectAll();  

    List<int> valuesToSelect = new List<int>();  

    for(int i = grid.VisibleStartIndex; i < grid.VisibleRowCount; i++) {  
        int unitPrice = Convert.ToInt32(grid.GetRowValues(i, new string[] { "UnitPrice" }));  
        if(unitPrice > minUnitPrice) {  
            valuesToSelect.Add((int)grid.GetRowValues(i, ASPxGridLookup1.KeyFieldName));  
        }  
    }  
    ASPxGridLookup1.Value = valuesToSelect;  
}  
```  
  
```vb  
Protected Sub SetSelectionButton_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim grid As ASPxGridView = ASPxGridLookup1.GridView
            Dim minUnitPrice As Integer = 25

            grid.Selection.UnselectAll()

            Dim valuesToSelect As New List(Of Integer)()

            For i As Integer = grid.VisibleStartIndex To grid.VisibleRowCount - 1
                Dim unitPrice As Integer = Convert.ToInt32(grid.GetRowValues(i, New String() { "UnitPrice" }))
                If unitPrice > minUnitPrice Then
                    valuesToSelect.Add(CInt((grid.GetRowValues(i, ASPxGridLookup1.KeyFieldName))))
                End If
            Next i
            ASPxGridLookup1.Value = valuesToSelect
End Sub
```  
  
## Files to Review

* [ClientSide_MultiSelect.aspx](./CS/ASPxGridLookUpSelection/ClientSide_MultiSelect.aspx) (VB: [ClientSide_MultiSelect.aspx](./VB/ASPxGridLookUpSelection/ClientSide_MultiSelect.aspx))
* [ClientSide_SingleSelect.aspx](./CS/ASPxGridLookUpSelection/ClientSide_SingleSelect.aspx) (VB: [ClientSide_SingleSelect.aspx](./VB/ASPxGridLookUpSelection/ClientSide_SingleSelect.aspx))
* [ServerSide_MultiSelect.aspx.cs](./CS/ASPxGridLookUpSelection/ServerSide_MultiSelect.aspx.cs) (VB: [ServerSide_MultiSelect.aspx.vb](./VB/ASPxGridLookUpSelection/ServerSide_MultiSelect.aspx.vb))
* [ServerSide_SingleSelect.aspx.cs](./CS/ASPxGridLookUpSelection/ServerSide_SingleSelect.aspx.cs) (VB: [ServerSide_SingleSelect.aspx.vb](./VB/ASPxGridLookUpSelection/ServerSide_SingleSelect.aspx.vb))

<!-- feedback -->
## Does This Example Address Your Development Requirements/Objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-lookup-access-selected-data&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=asp-net-web-forms-grid-lookup-access-selected-data&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
