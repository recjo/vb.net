
Partial Class nimda_jobs_applications_details
    Inherits System.Web.UI.Page

    Private rid As Integer = 0
    Private aid As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Integer.TryParse(Left(Request("rid"), 7), rid) Then
            lnkBack.NavigateUrl = "jobs-applications.aspx?rid=" & Request("rid")
            If Not IsPostBack Then getJobDetails()
        End If

        If Integer.TryParse(Left(Request("aid"), 7), aid) Then
            If Not IsPostBack Then getApplicantDetails()
        End If
    End Sub

    Protected Sub getJobDetails()
        Dim adpt As JobListingsBLL = New JobListingsBLL
        Dim rstobj As Jobs.JobListingsDataTable = adpt.GetJobListingByRecid(rid)
        If rstobj.Count > 0 Then
            'PostDate
            If Not IsDBNull(rstobj.Rows(0).Item("PostDate")) Then
                lblPosted.Text = Date.Parse(rstobj.Rows(0).Item("PostDate")).ToShortDateString()
            Else
                dPosted.Visible = False
            End If

            'Facility
            If Not IsDBNull(rstobj.Rows(0).Item("Facility")) Then
                lblFacility1.Text = rstobj.Rows(0).Item("Facility")
            Else
                dFacility.Visible = False
            End If

            'Division
            If Not IsDBNull(rstobj.Rows(0).Item("Division")) Then
                lblDivision1.Text = rstobj.Rows(0).Item("Division")
            Else
                dDivision.Visible = False
            End If

            'Job Title
            If Not IsDBNull(rstobj.Rows(0).Item("JobTitle")) Then
                lblJobTitle1.Text = rstobj.Rows(0).Item("JobTitle")
            Else
                dJobTitle.Visible = False
            End If
        End If
        adpt = Nothing
        rstobj = Nothing
    End Sub

    Protected Sub getApplicantDetails()
        Dim adpt As JobApplicationsBLL = New JobApplicationsBLL
        Dim rstobj As Jobs.JobApplicationsDataTable = adpt.GetApplicationByRecid(aid)
        If rstobj.Count > 0 Then
            'Name
            If IsDBNull(rstobj.Rows(0).Item("FirstName")) = False And IsDBNull(rstobj.Rows(0).Item("LastName")) = False Then
                lblName.Text = rstobj.Rows(0).Item("FirstName") & " " & rstobj.Rows(0).Item("LastName")
            Else
                dName.Visible = False
            End If

            'Address
            If Not IsDBNull(rstobj.Rows(0).Item("Address")) Then
                lblAddress.Text = rstobj.Rows(0).Item("Address")
            End If

            'City
            If Not IsDBNull(rstobj.Rows(0).Item("City")) Then
                If lblAddress.Text <> "" Then lblAddress.Text &= ", "
                lblAddress.Text &= rstobj.Rows(0).Item("City")
            End If

            'State
            If Not IsDBNull(rstobj.Rows(0).Item("State")) Then
                If lblAddress.Text <> "" Then lblAddress.Text &= ", "
                lblAddress.Text &= rstobj.Rows(0).Item("State")
            End If

            'Zip
            If Not IsDBNull(rstobj.Rows(0).Item("Zip")) Then
                lblAddress.Text &= " " & rstobj.Rows(0).Item("Zip")
            End If

            'Phone
            If Not IsDBNull(rstobj.Rows(0).Item("Phone")) Then
                lblPhone.Text = rstobj.Rows(0).Item("Phone")
            Else
                dPhone.Visible = False
            End If

            'Email
            If Not IsDBNull(rstobj.Rows(0).Item("Email")) Then
                lnkEmail.Text = rstobj.Rows(0).Item("Email")
                lnkEmail.NavigateUrl = "mailto:" & rstobj.Rows(0).Item("Email")
            Else
                dEmail.Visible = False
            End If

            'Cover Letter
            If Not IsDBNull(rstobj.Rows(0).Item("CoverLetter")) Then
                lblCoverLetter.Text = Replace(rstobj.Rows(0).Item("CoverLetter"), vbCrLf, "<br />")
            Else
                fsCoverLetter.Visible = False
            End If

            'Resume
            If Not IsDBNull(rstobj.Rows(0).Item("Resume")) Then
                lblResume.Text = Replace(rstobj.Rows(0).Item("Resume"), vbCrLf, "<br />")
            Else
                fsResume.Visible = False
            End If
        End If
        adpt = Nothing
        rstobj = Nothing
    End Sub
End Class
