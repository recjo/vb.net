
Partial Class nimda_webcontent_upd
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.Redirect("webcontent.aspx")
    End Sub

    Protected Sub FormView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Response.Redirect("webcontent.aspx")
    End Sub
End Class
