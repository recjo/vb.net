
Partial Class teammom_default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If HttpContext.Current.User.Identity.Name = "" Then Response.Redirect("~/login.aspx", False)

        Page.Title = "Team Mom - " & HttpContext.Current.User.Identity.Name.ToString
        If Not IsPostBack Then populateControls()
    End Sub

    Protected Sub NewsletterSource_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles NewsletterSource.Selecting
        e.InputParameters("league") = HttpContext.Current.User.Identity.Name
    End Sub

    Protected Sub NewsletterSource_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles NewsletterSource.Updating
        e.InputParameters("league") = HttpContext.Current.User.Identity.Name
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            'Del link is in THIRD CELL (modify below if columns change)
            'Del link (with edit link) is actually control 2 since "edit" is 0 and "invisible ctrl" between links is 1
            Dim delButt As LinkButton = CType(e.Row.Cells(3).Controls(2), LinkButton)
            If delButt.Text = "Delete" Then
                delButt.OnClientClick = "return confirm('Do you really want to delete this item?')"
            End If
        End If
    End Sub

    Protected Sub populateControls()
        Dim adpt As New iWayDALTableAdapters.WebContentTableAdapter()
        Dim rsob As iWayDAL.WebContentDataTable
        rsob = adpt.GetWebContentByPageName("Team News - " & HttpContext.Current.User.Identity.Name.ToString)
        If rsob.Count > 0 Then
            txtMessage.Text = rsob.Rows(0).Item("PageText")
            hfRecID.Value = rsob.Rows(0).Item("RecID")
            lblPageTitle.Text = rsob.Rows(0).Item("PageTitle")
            txtReplyTo.Text = rsob.Rows(0).Item("Linkname")
        End If
        rsob = Nothing
        adpt = Nothing
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        updateWebContent()
        hideControls()
        If chkMailer.Checked = True Then emailSubscribers()
    End Sub

    Protected Sub updateWebContent()
        Dim adpt As New iWayDALTableAdapters.WebContentTableAdapter()
        Dim ret As Integer = adpt.UpdateWebContent("Team News - " & HttpContext.Current.User.Identity.Name.ToString, txtReplyTo.Text, lblPageTitle.Text, txtMessage.Text, hfRecID.Value)
        adpt = Nothing
    End Sub

    Protected Sub emailSubscribers()
        'get subscriber emails
        Dim emailStr As String = String.Empty
        Dim adpt As New iWayDALTableAdapters.NewsletterTableAdapter()
        Dim rsob As iWayDAL.NewsletterDataTable
        rsob = adpt.GetSubsByLeague(HttpContext.Current.User.Identity.Name.ToString)
        If rsob.Count > 0 Then
            For Each rsRow As iWayDAL.NewsletterRow In rsob
                If Not IsDBNull(rsRow.Email) AndAlso rsRow.Email <> "" Then
                    emailStr &= rsRow.Email & ","
                End If
            Next
            'erase last comma
            emailStr = Left(emailStr, Len(emailStr) - 1)
        End If
        rsob = Nothing
        adpt = Nothing


        Dim oMail As System.Web.Mail.MailMessage = New System.Web.Mail.MailMessage
        oMail.From = "mailers@losalgriffins.com"
        'oMail.To = "mailers@losalgriffins.com"
        'oMail.Bcc = emailStr
        oMail.To = "joelrec@yahoo.com"
        If txtReplyTo.Text <> "" Then
            oMail.Headers.Add("Reply-To", txtReplyTo.Text)
        End If
        oMail.Subject = lblPageTitle.Text
        oMail.BodyFormat = System.Web.Mail.MailFormat.Html
        oMail.Body = txtMessage.Text
        System.Web.Mail.SmtpMail.SmtpServer = "relay-hosting.secureserver.net"
        System.Web.Mail.SmtpMail.Send(oMail)
        oMail = Nothing

        'smtpout.secureserver.net
        lblMsg.Text &= "<br /><br />ALL SUBSCRIBERS HAVE BEEN EMAILED!"
    End Sub

    Protected Sub hideControls()
        lblInstructions.Visible = False
        lblPageTitle.Visible = False
        lblInstructions2.Visible = False
        txtMessage.Visible = False
        chkMailer.Visible = False
        lblEmail.Visible = False
        txtReplyTo.Visible = False
        REV1.Visible = False
        VS1.Visible = False
        btnUpdate.Visible = False
        hr1.Visible = False
        lblGridView.Visible = False
        GridView1.Visible = False

        hyp1.Visible = True
        lblMsg.Text = "Team News page has been updated."
    End Sub

    Sub dd()

    End Sub
End Class
