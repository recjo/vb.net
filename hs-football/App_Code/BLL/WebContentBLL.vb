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
Public Class WebContentBLL
    Private _webcontentAdapter As WebContentTableAdapter = Nothing
    Protected ReadOnly Property Adapter() As WebContentTableAdapter
        Get
            If _webcontentAdapter Is Nothing Then
                _webcontentAdapter = New WebContentTableAdapter()
            End If

            Return _webcontentAdapter
        End Get
    End Property

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAllWebContent() As iWayDAL.WebContentDataTable
        Return Adapter.GetAllWebContent()
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetWebContentByRecID(ByVal RecID As Integer) As iWayDAL.WebContentDataTable
        Return Adapter.GetWebContentByRecID(RecID)
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetWebContentByPageName(ByVal PageName As String) As iWayDAL.WebContentDataTable
        Return Adapter.GetWebContentByPageName(PageName)
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function InsertWebContent(ByVal PageName As String, ByVal LinkName As String, ByVal PageTitle As String, ByVal PageText As String)

        '-----------------  cap field length ------------------
        PageName = Left(Trim(PageName), 40)
        LinkName = Left(Trim(LinkName), 30)
        PageTitle = Left(Trim(PageTitle), 50)

        Dim rowsAffected As Integer = Adapter.InsertWebContent(PageName, LinkName, PageTitle, PageText)
        ' Return true if precisely one row was inserted, otherwise false
        Return rowsAffected = 1
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateWebContent(ByVal PageName As String, ByVal LinkName As String, ByVal PageTitle As String, ByVal PageText As String, ByVal original_RecID As Integer) As Boolean

        '-----------------  cap field length ------------------
        PageName = Left(Trim(PageName), 40)
        LinkName = Left(Trim(LinkName), 30)
        PageTitle = Left(Trim(PageTitle), 50)

        Dim rowsAffected As Integer = Adapter.UpdateWebContent(PageName, LinkName, PageTitle, PageText, original_RecID)
        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteWebContent(ByVal original_RecID As Integer) As Boolean
        Dim rowsAffected As Integer = Adapter.DeleteWebContent(original_RecID)
        ' Return true if precisely one row was deleted, otherwise false
        Return rowsAffected = 1
    End Function

End Class
