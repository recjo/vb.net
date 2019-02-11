
Partial Class careers_job_details
    Inherits System.Web.UI.Page

    Private rid As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'load javascript
        Dim jsLink As New HtmlGenericControl()
        jsLink.TagName = "script"
        jsLink.Attributes.Add("src", ResolveClientUrl("~/scripts/tabs.js"))
        jsLink.Attributes.Add("type", "text/javascript")
        Page.Header.Controls.Add(jsLink)

        If Integer.TryParse(Left(Request("rid"), 7), rid) Then
            If Not IsPostBack Then populateControls()
        End If
    End Sub

    Protected Sub populateControls()
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
                lblFacility2.Text = rstobj.Rows(0).Item("Facility")
            Else
                dFacility.Visible = False
            End If

            'Division
            If Not IsDBNull(rstobj.Rows(0).Item("Division")) Then
                lblDivision1.Text = rstobj.Rows(0).Item("Division")
                lblDivision2.Text = rstobj.Rows(0).Item("Division")
            Else
                dDivision.Visible = False
            End If

            'Job Title
            If Not IsDBNull(rstobj.Rows(0).Item("JobTitle")) Then
                lblJobTitle1.Text = rstobj.Rows(0).Item("JobTitle")
                lblJobTitle2.Text = rstobj.Rows(0).Item("JobTitle")
            Else
                dJobTitle.Visible = False
            End If

            'Job Description
            If Not IsDBNull(rstobj.Rows(0).Item("JobDescription")) Then lblJobDescription.Text = rstobj.Rows(0).Item("JobDescription")

            'Salary
            If Not IsDBNull(rstobj.Rows(0).Item("Salary")) Then
                lblSalary.Text = rstobj.Rows(0).Item("Salary")
            Else
                dSalary.Visible = False
            End If

            'Job Duties
            If Not IsDBNull(rstobj.Rows(0).Item("Duites")) Then
                lblJobDuties.Text = rstobj.Rows(0).Item("Duites")
            Else
                fsJobDuties.Visible = False
            End If

            'Job Requirements
            If Not IsDBNull(rstobj.Rows(0).Item("Requirements")) Then
                lblJobRequirements.Text = rstobj.Rows(0).Item("Requirements")
            Else
                fsJobRequirements.Visible = False
            End If

            'ExpireDate
            If Not IsDBNull(rstobj.Rows(0).Item("ExpireDate")) Then
                If rstobj.Rows(0).Item("ExpireDate") = "1/1/1900 12:00:00 AM" Or rstobj.Rows(0).Item("ExpireDate") = "12/31/2074 12:00:00 AM" Then
                    dApplyby.Visible = False
                Else
                    lblExpDate.Text = Date.Parse(rstobj.Rows(0).Item("ExpireDate")).ToShortDateString()
                End If
            Else
                dApplyby.Visible = False
            End If

            'Contact Name
            If Not IsDBNull(rstobj.Rows(0).Item("ContactName")) Then
                lblContactName.Text = rstobj.Rows(0).Item("ContactName")
            Else
                dContactName.Visible = False
            End If

            'Contact Email
            If Not IsDBNull(rstobj.Rows(0).Item("ContactEmail")) Then
                lnkContactEmail.Text = rstobj.Rows(0).Item("ContactEmail")
                lnkContactEmail.NavigateUrl = "mailto:" & rstobj.Rows(0).Item("ContactEmail") & "?subject=Job Application: " & lblJobTitle2.Text
            Else
                dContactEmail.Visible = False
            End If

            'Contact Number
            If Not IsDBNull(rstobj.Rows(0).Item("ContactNumber")) Then
                lblContactNumber.Text = rstobj.Rows(0).Item("ContactNumber")
            Else
                dContactNumber.Visible = False
            End If

            'Contact Frame
            If dContactName.Visible = False AndAlso dContactNumber.Visible = False AndAlso dContactEmail.Visible = False Then
                fsContact.Visible = False
            End If

        End If
        adpt = Nothing
        rstobj = Nothing
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        JAObjectDataSource.Insert()
        sendemail()
        Response.Redirect("thankyou.aspx", True)
    End Sub

    Protected Sub JAObjectDataSource_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles JAObjectDataSource.Inserting
        e.InputParameters("Phone") = txtPhoneareacode.Text & "-" & txtPhoneprefix.Text & "-" & txtPhonenum.Text
    End Sub

    Protected Sub sendemail()
        Dim subStr As String = "Someone Submitted A Job Application"

        Dim emailTo As String = String.Empty
        If lnkContactEmail.Text = "" Then
            emailTo = ConfigurationManager.AppSettings("BizEmail")
        Else
            emailTo = lnkContactEmail.Text
        End If

        'compose message
        Dim body As String = Date.Now.ToString & " PST" & vbTab & vbCrLf & vbCrLf
        body &= "JOB DETAILS" & vbTab & vbCrLf
        body &= "Facility:    " & lblFacility2.Text & vbTab & vbCrLf
        body &= "Job Title:   " & lblJobTitle2.Text & vbTab & vbCrLf
        body &= "Division:    " & lblDivision2.Text & vbTab & vbCrLf & vbCrLf

        body &= "APPLICANT DETAILS" & vbTab & vbCrLf
        body &= "Name:        " & txtFirstname.Text & " " & txtLastname.Text & vbTab & vbCrLf
        body &= "Address:     " & txtAddress.Text & vbTab & vbCrLf
        body &= "City:        " & txtCity.Text & vbTab & vbCrLf
        body &= "State:       " & ddlState.SelectedValue & vbTab & vbCrLf
        body &= "Zip:         " & txtZip.Text & vbTab & vbCrLf
        body &= "Phone:       " & txtPhoneareacode.Text & "-" & txtPhoneprefix.Text & "-" & txtPhonenum.Text & vbTab & vbCrLf
        body &= "Email:       " & txtEmail.Text & vbTab & vbCrLf & vbCrLf

        body &= "COVER LETTER" & vbTab & vbCrLf
        body &= txtCoverLetter.Text & vbTab & vbCrLf & vbCrLf

        body &= "RESUME" & vbTab & vbCrLf
        body &= txtResume.Text & vbTab & vbCrLf & vbCrLf

        Dim MailObj As New System.Net.Mail.SmtpClient
        Dim Msg As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
        MailObj.Host = ConfigurationManager.AppSettings("MailHost")
        Msg.From = New System.Net.Mail.MailAddress(ConfigurationManager.AppSettings("BizEmail"), ConfigurationManager.AppSettings("BizName") & " Website")
        Msg.To.Add(New System.Net.Mail.MailAddress(emailTo, ""))
        Msg.IsBodyHtml = "False"
        Msg.Body = body
        Msg.Subject = subStr

        Try
            MailObj.Send(Msg)
        Catch ex As Exception
            '
        End Try
    End Sub
End Class
