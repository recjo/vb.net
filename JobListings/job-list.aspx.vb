
Partial Class careers_job_list
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Title = lblTitle.Text

        'McMenu search values can come from Job-list.aspx or be crossposted, so define vars 
        'that can be used by both
        Dim keyStr As String = String.Empty
        Dim facStr As String = String.Empty
        Dim divStr As String = String.Empty


        'if crossposted from overview.aspx or job-details.aspx, use Previous page to get McMenu
        If PreviousPage IsNot Nothing Then
            'get reference to ContentPlaceHolder
            Dim ph As ContentPlaceHolder = CType(PreviousPage.Master.FindControl("MenuContent"), ContentPlaceHolder)
            'now, get reference to user control
            Dim PrevMcMenu As Object = CType(ph.FindControl("McMenu"), Object)
            keyStr = PrevMcMenu.getKeywords()
            facStr = PrevMcMenu.getFacility()
            divStr = PrevMcMenu.getDivision()
        Else
            'get vars from McMenu on this page (job-list.aspx)
            keyStr = McMenu.getKeywords()
            facStr = McMenu.getFacility()
            divStr = McMenu.getDivision()
        End If


        'if all vars are empty, get all jobs for display
        If keyStr = "" And facStr = "" And divStr = "" Then
            getJobs()
        Else
            'display search terms on results page
            If keyStr <> "" Then lblKeywords.Text = "Keywords: " & keyStr
            If lblKeywords.Text <> "" Then lblKeywords.Text &= " &nbsp; &nbsp; &nbsp; "
            If facStr <> "" Then lblKeywords.Text &= "Facility: " & facStr
            If lblKeywords.Text <> "" Then lblKeywords.Text &= " &nbsp; &nbsp; &nbsp; "
            If divStr <> "" Then lblKeywords.Text &= "Division: " & divStr
            'send search terms to job search routines
            searchJobs(keyStr, facStr, divStr)
        End If
    End Sub

    Protected Overrides Sub Render(ByVal writer As HtmlTextWriter)
        Dim sortColumnIndex As Integer = 3
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
                If TypeOf gvr.Cells(sortColumnIndex).Controls(1) Is Label Then
                    Dim lblFacility As Label = CType(gvr.Cells(sortColumnIndex).Controls(1), Label)
                    currentValue = lblFacility.Text
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
                headRow.CssClass = "HeaderStyle"
                headCell1.Text = "Posted"
                headCell2.Text = "Job Title"
                headCell3.Text = "Division"
                headCell4.Text = "Details"
                headCell4.HorizontalAlign = HorizontalAlign.Center
                headRow.Cells.Add(headCell1)
                headRow.Cells.Add(headCell2)
                headRow.Cells.Add(headCell3)
                headRow.Cells.Add(headCell4)
                gridTable.Controls.AddAt(rowIndex + 1, headRow)

                ' Update lastValue
                lastValue = currentValue
            End If
        Next


        'End If
        MyBase.Render(writer)
    End Sub

    Protected Sub getJobs()
        Dim adpt As JobListingsBLL = New JobListingsBLL
        Dim rstobj As Jobs.JobListingsDataTable = adpt.GetApprovedJobListings()
        If rstobj.Count > 0 Then
            GridView1.DataSource = rstobj
            GridView1.DataBind()
        End If
        adpt = Nothing
        rstobj = Nothing
    End Sub

    Protected Sub searchJobs(ByVal keywords As String, ByVal facilities As String, ByVal divisions As String)
        Dim adpt As JobListingsBLL = New JobListingsBLL
        Dim rstobj As Data.DataSet = adpt.SearchJobs(keywords, facilities, divisions)
        GridView1.DataSource = rstobj
        GridView1.DataBind()
        adpt = Nothing
        rstobj = Nothing
    End Sub
End Class
