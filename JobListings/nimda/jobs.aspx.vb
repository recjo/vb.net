
Partial Class nimda_jobs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Title = lblTitle.Text
    End Sub

    Protected Overrides Sub Render(ByVal writer As HtmlTextWriter)
        Dim sortColumnIndex As Integer = 5
        'Dim sortColumnHeaderText As String = "Price"

        ' Reference the Table the GridView has been rendered into
        Dim gridTable As Table = CType(GridView1.Controls(0), Table)

        ' Enumerate each TableRow, adding a sorting UI header if
        ' the sorted value has changed
        Dim lastValue As String = "booya"
        Dim currentValue As String = String.Empty
        For Each gvr As GridViewRow In GridView1.Rows
            'if sorted field is a TEMPLATE FIELD, use this code
            If gvr.Cells(sortColumnIndex).Controls.Count > 0 Then
                'in my template field, column 3, control #1 is the hidden field (control 0 is idunno)
                If TypeOf gvr.Cells(sortColumnIndex).Controls(1) Is HiddenField Then
                    Dim hfFacility As HiddenField = CType(gvr.Cells(sortColumnIndex).Controls(1), HiddenField)
                    currentValue = hfFacility.Value
                End If
            End If
            'if sorted field is a BOUND FIELD, use this code
            'Dim currentValue As String = gvr.Cells(sortColumnIndex).Text

            If lastValue.CompareTo(currentValue) <> 0 Then
                ' there's been a change in value in the sorted column
                Dim rowIndex As Integer = gridTable.Rows.GetRowIndex(gvr)

                ' Add a new sort header row
                Dim sortRow As New GridViewRow(rowIndex, rowIndex, DataControlRowType.DataRow, DataControlRowState.Normal)
                Dim sortCell As New TableCell()
                sortCell.ColumnSpan = GridView1.Columns.Count
                sortRow.CssClass = "" 'clear out the default class formatting
                'sortCell.Text = String.Format("{0}: {1}", sortColumnHeaderText, currentValue)
                sortCell.Text = String.Format("{0}", currentValue)
                sortCell.CssClass = "MajorHeaderTDStyle"

                ' Add sortCell to sortRow, and sortRow to gridTable
                sortRow.Cells.Add(sortCell)
                gridTable.Controls.AddAt(rowIndex, sortRow)

                'add header row for each new category
                Dim headRow As New GridViewRow(rowIndex, rowIndex, DataControlRowType.DataRow, DataControlRowState.Normal)
                Dim headCell1 As New TableHeaderCell()
                Dim headCell2 As New TableHeaderCell()
                Dim headCell3 As New TableHeaderCell()
                Dim headCell4 As New TableHeaderCell()
                Dim headCell5 As New TableHeaderCell()
                Dim headCell6 As New TableHeaderCell()
                headRow.CssClass = "HeaderStyle"
                headCell1.Text = "Posted"
                headCell2.Text = "Job Title"
                headCell3.Text = "Division"
                headCell4.Text = "Display"
                headCell4.HorizontalAlign = HorizontalAlign.Center
                headCell5.Text = "Applied"
                headCell5.HorizontalAlign = HorizontalAlign.Center
                headCell6.Text = "Action"
                headCell6.HorizontalAlign = HorizontalAlign.Center
                headRow.Cells.Add(headCell1)
                headRow.Cells.Add(headCell2)
                headRow.Cells.Add(headCell3)
                headRow.Cells.Add(headCell4)
                headRow.Cells.Add(headCell5)
                headRow.Cells.Add(headCell6)
                gridTable.Controls.AddAt(rowIndex + 1, headRow)
                'gridTable.Controls.AddAt(rowIndex, headRow)

                ' Update lastValue
                lastValue = currentValue
            End If
        Next


        'End If
        MyBase.Render(writer)
    End Sub

    Protected Function displayYN(ByVal state As Boolean) As String
        If state Then
            displayYN = "Yes"
        Else
            displayYN = ""
        End If
    End Function

    Protected Sub CheckAppCount_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(4).Text <> "" Then
                Dim apps As Integer = Integer.Parse(e.Row.Cells(4).Text)
                If apps > 0 Then
                    e.Row.Cells(4).Text = "<a href=""jobs-applications.aspx?rid=" & e.Row.DataItem("RecID") & """>(" & e.Row.Cells(4).Text & ")</a>"
                End If
            End If
        End If
    End Sub
End Class
