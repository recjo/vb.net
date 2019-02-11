
Partial Class teamnews_signupform
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim hfLeague As HiddenField = CType(Parent.FindControl("hfLeague"), HiddenField)
        lblLeague.Text = hfLeague.Value
    End Sub

    Protected Sub NewsletterDataSource_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles NewsletterDataSource.Inserting
        Dim hfLeague As HiddenField = CType(Parent.FindControl("hfLeague"), HiddenField)
        e.InputParameters("League") = hfLeague.Value
        e.InputParameters("ParentName") = txtparentname.Text
        e.InputParameters("ChildName") = txtchildname.Text
        e.InputParameters("Email") = txtemail.Text

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        NewsletterDataSource.Insert()
        emailParent()
    End Sub

    Protected Sub NewsletterDataSource_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles NewsletterDataSource.Inserted
        lblResults.Text = Replace(lblResults.Text, "[zmail]", txtemail.Text)
        txtparentname.Text = ""
        txtchildname.Text = ""
        tbl.Visible = False
        Dim FormView1 As FormView = CType(Parent.FindControl("FormView1"), FormView)
        FormView1.Visible = False
        lblResults.Visible = True
    End Sub

    Sub emailParent()
        Dim oMail As System.Web.Mail.MailMessage = New System.Web.Mail.MailMessage
        oMail.From = "mailers@losalgriffins.com"
        oMail.To = txtemail.Text
        oMail.Subject = "Test Email from Los Alamitos Football"
        oMail.BodyFormat = System.Web.Mail.MailFormat.Html
        oMail.Body = "This is to confirm that you, or somebody that you know, has subscribed you to team news from Los Alamitos Football. Your email address will not be sold or given to a third party."
        System.Web.Mail.SmtpMail.SmtpServer = "relay-hosting.secureserver.net"
        System.Web.Mail.SmtpMail.Send(oMail)
        oMail = Nothing
        txtemail.Text = ""
    End Sub
End Class
