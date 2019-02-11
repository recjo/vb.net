Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports iWayDALTableAdapters

<System.ComponentModel.DataObject()> _
Public Class NewsletterBLL
    Private _newsletterAdapter As NewsletterTableAdapter = Nothing
    Protected ReadOnly Property Adapter() As NewsletterTableAdapter
        Get
            If _newsletterAdapter Is Nothing Then
                _newsletterAdapter = New NewsletterTableAdapter()
            End If

            Return _newsletterAdapter
        End Get
    End Property

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetAllSubs() As iWayDAL.NewsletterDataTable
        Return Adapter.GetAllSubs
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetSubsByLeague(ByVal league As String) As iWayDAL.NewsletterDataTable
        Return Adapter.GetSubsByLeague(league)
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetSubByRecid(ByVal recid As Integer) As iWayDAL.NewsletterDataTable
        Return Adapter.GetSubByRecid(recid)
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function InsertSubscriber(ByVal league As String, ByVal parentname As String, ByVal childname As String, ByVal email As String)

        '-----------------  cap field length ------------------
        league = Left(Trim(league), 30)
        parentname = Left(Trim(parentname), 75)
        childname = Left(Trim(childname), 75)
        email = Left(Trim(email), 60)

        Dim rowsAffected As Integer = Adapter.InsertSubscriber(league, parentname, childname, email)
        Return rowsAffected = 1
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateSubscriber(ByVal league As String, ByVal parentname As String, ByVal childname As String, ByVal email As String, ByVal recid As Integer) As Boolean

        '-----------------  cap field length ------------------
        league = Left(Trim(league), 30)
        parentname = Left(Trim(parentname), 75)
        childname = Left(Trim(childname), 75)
        email = Left(Trim(email), 60)

        Dim rowsAffected As Integer = Adapter.UpdateSubscriber(league, parentname, childname, email, recid)
        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteSubscriber(ByVal RecID As Integer) As Boolean
        Dim rowsAffected As Integer = Adapter.DeleteSubscriber(RecID)
        ' Return true if precisely one row was deleted, otherwise false
        Return rowsAffected = 1
    End Function

End Class
