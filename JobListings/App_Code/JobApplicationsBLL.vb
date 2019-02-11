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
Imports JobsTableAdapters

<System.ComponentModel.DataObject()> _
Public Class JobApplicationsBLL
    Private _thisAdapter As JobApplicationsTableAdapter = Nothing
    Protected ReadOnly Property Adapter() As JobApplicationsTableAdapter
        Get
            If _thisAdapter Is Nothing Then
                _thisAdapter = New JobApplicationsTableAdapter()
            End If

            Return _thisAdapter
        End Get
    End Property

    '************************************** S E L E C T ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAllApplications() As Jobs.JobApplicationsDataTable
        Return Adapter.GetAllApplications()
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetApplicationByRecid(ByVal RecID As Integer) As Jobs.JobApplicationsDataTable
        Return Adapter.GetApplicationByRecid(RecID)
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetApplicationsByJobid(ByVal JobID As Integer) As Jobs.JobApplicationsDataTable
        Return Adapter.GetApplicationsByJobid(JobID)
    End Function

    '************************************** D E L E T E ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteApplication(ByVal RecID As Integer) As Boolean
        Dim rowsAffected As Integer = Adapter.DeleteApplication(RecID)
        ' Return true if precisely one row was deleted, otherwise false
        Return rowsAffected = 1
    End Function

    '************************************** I N S E R T ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function InsertApplication(ByVal JobID As Integer, ByVal FirstName As String, ByVal LastName As String, ByVal Address As String, ByVal City As String, ByVal State As String, ByVal Zip As String, ByVal Phone As String, ByVal Email As String, ByVal _Resume As String, ByVal CoverLetter As String) As Integer

        '-----------------  cap field length ------------------
        FirstName = Left(Trim(FirstName), 30)
        LastName = Left(Trim(LastName), 30)
        Address = Left(Trim(Address), 50)
        City = Left(Trim(City), 40)
        State = Left(Trim(State), 2)
        Zip = Left(Trim(Zip), 11)
        Phone = Left(Trim(Phone), 30)
        Email = Left(Trim(Email), 60)

        Dim PostDate As Date = Date.Now

        Dim rowsAffected As Integer = Adapter.InsertApplication(JobID, FirstName, LastName, Address, City, State, Zip, Phone, Email, PostDate, _Resume, CoverLetter)
        ' Return true if precisely one row was inserted, otherwise false
        Return rowsAffected = 1
    End Function

    '************************************** U P D A T E ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateApplication(ByVal JobID As Integer, ByVal FirstName As String, ByVal LastName As String, ByVal Address As String, ByVal City As String, ByVal State As String, ByVal Zip As String, ByVal Phone As String, ByVal Email As String, ByVal _Resume As String, ByVal CoverLetter As String, ByVal RecID As Integer) As Boolean

        '-----------------  cap field length ------------------
        FirstName = Left(Trim(FirstName), 30)
        LastName = Left(Trim(LastName), 30)
        Address = Left(Trim(Address), 50)
        City = Left(Trim(City), 40)
        State = Left(Trim(State), 2)
        Zip = Left(Trim(Zip), 11)
        Phone = Left(Trim(Phone), 30)
        Email = Left(Trim(Email), 60)

        Dim rowsAffected As Integer = Adapter.UpdateApplication(JobID, FirstName, LastName, Address, City, State, Zip, Phone, Email, _Resume, CoverLetter, RecID)
        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function

End Class
