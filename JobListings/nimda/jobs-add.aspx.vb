
Partial Class nimda_jobs_add
    Inherits System.Web.UI.Page

    Private rid As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'IS THIS AN EDIT
        If Request("rid") <> "" Then
            If Integer.TryParse(Left(Request("rid"), 7), rid) Then
                btnDelete.Visible = True
                btnAdd.Visible = False
                btnUpdate.Visible = True
                lblTitle.Text = "Edit Job Listing"
                If Not IsPostBack Then populateControls()
            End If
        End If

        Page.Title = lblTitle.Text
    End Sub

    Protected Sub populateControls()
        Dim adpt As JobListingsBLL = New JobListingsBLL
        Dim rstobj As Jobs.JobListingsDataTable = adpt.GetJobListingByRecid(rid)
        If rstobj.Count > 0 Then
            If Not IsDBNull(rstobj.Rows(0).Item("RecID")) Then hfRecID.Value = rstobj.Rows(0).Item("RecID")
            If Not IsDBNull(rstobj.Rows(0).Item("Facility")) Then ddlFacility.SelectedValue = rstobj.Rows(0).Item("Facility")
            If Not IsDBNull(rstobj.Rows(0).Item("Division")) Then txtDivision.Text = rstobj.Rows(0).Item("Division")
            If Not IsDBNull(rstobj.Rows(0).Item("ContactName")) Then txtContactName.Text = rstobj.Rows(0).Item("ContactName")
            If Not IsDBNull(rstobj.Rows(0).Item("ContactNumber")) Then txtContactNumber.Text = rstobj.Rows(0).Item("ContactNumber")
            If Not IsDBNull(rstobj.Rows(0).Item("ContactEmail")) Then txtContactEmail.Text = rstobj.Rows(0).Item("ContactEmail")
            If Not IsDBNull(rstobj.Rows(0).Item("JobTitle")) Then txtJobTitle.Text = rstobj.Rows(0).Item("JobTitle")
            If Not IsDBNull(rstobj.Rows(0).Item("JobDescription")) Then txtJobDescription.Text = rstobj.Rows(0).Item("JobDescription")
            If Not IsDBNull(rstobj.Rows(0).Item("Salary")) Then txtSalary.Text = rstobj.Rows(0).Item("Salary")
            If Not IsDBNull(rstobj.Rows(0).Item("Duites")) Then txtDuities.Text = rstobj.Rows(0).Item("Duites")
            If Not IsDBNull(rstobj.Rows(0).Item("Requirements")) Then txtRequirements.Text = rstobj.Rows(0).Item("Requirements")
            If Not IsDBNull(rstobj.Rows(0).Item("ExpireDate")) Then
                If rstobj.Rows(0).Item("ExpireDate") = "1/1/1900 12:00:00 AM" Or rstobj.Rows(0).Item("ExpireDate") = "12/31/2074 12:00:00 AM" Then
                    txtExpireDate.InitialText = ""
                Else
                    txtExpireDate.InitialText = rstobj.Rows(0).Item("ExpireDate")
                End If
            End If
            If Not IsDBNull(rstobj.Rows(0).Item("Display")) Then chkDisplay.Checked = rstobj.Rows(0).Item("Display")
        End If
        adpt = Nothing
        rstobj = Nothing
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        JLDataSource.Insert()
        Response.Redirect("jobs.aspx", True)
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        JLDataSource.Update()
        Response.Redirect("jobs.aspx", True)
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        JLDataSource.Delete()
        Response.Redirect("jobs.aspx", True)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("jobs.aspx", True)
    End Sub

    Protected Sub JLDataSource_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles JLDataSource.Inserting
        If txtExpireDate.Date.ToShortDateString() = "" Or txtExpireDate.IsNull Then e.InputParameters("ExpireDate") = "1/1/1900"
    End Sub

    Protected Sub JLDataSource_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles JLDataSource.Updating
        If txtExpireDate.Date.ToShortDateString() = "" Or txtExpireDate.IsNull Then e.InputParameters("ExpireDate") = "1/1/1900"
    End Sub
End Class
