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
Public Class JobListingsBLL
    Private _thisAdapter As JobListingsTableAdapter = Nothing
    Protected ReadOnly Property Adapter() As JobListingsTableAdapter
        Get
            If _thisAdapter Is Nothing Then
                _thisAdapter = New JobListingsTableAdapter()
            End If

            Return _thisAdapter
        End Get
    End Property

    '************************************** S E L E C T ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetAllJobListings() As Jobs.JobListingsDataTable
        Return Adapter.GetAllJobListings()
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetAllJobListingsWApps() As Jobs.JobListingsDataTable
        Return Adapter.zGetAllJobListings()
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetApprovedJobListings() As Jobs.JobListingsDataTable
        Return Adapter.GetApprovedJobListings()
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetJobListingByRecid(ByVal RecID As Integer) As Jobs.JobListingsDataTable
        Return Adapter.GetJobListingByRecid(RecID)
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function SearchListings(ByVal Key As String) As Jobs.JobListingsDataTable
        Return Adapter.SearchListings(Key)
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function GetDivisions() As Jobs.JobListingsDataTable
        Return Adapter.zGetDivisions()
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, False)> _
    Public Function SearchJobs(ByVal Keywords As String, ByVal Facilities As String, ByVal Divisions As String) As Data.DataSet
        Dim sqlcmd As String = "SELECT * FROM JobListings WHERE Display = 1 "

        'KEYWORD SEARCH
        If Keywords <> "" Then
            sqlcmd &= "AND ("
            Keywords = Replace(Trim(Keywords), ", ", " ")
            Keywords = Replace(Keywords, ",", " ")
            Dim keyAry As Array = Split(Keywords, " ")
            For ii As Integer = 0 To (UBound(keyAry))
                sqlcmd &= "JobTitle LIKE '%" & keyAry(ii) & "%' "
                If ii < UBound(keyAry) Then sqlcmd &= "OR "
            Next
            sqlcmd &= ")"
        End If

        'FACILITY SEARCH
        If Facilities <> "" Then
            sqlcmd &= "AND Facility = '" & Facilities & "' "
        End If

        'DIVISION SEARCH
        If Divisions <> "" Then
            sqlcmd &= "AND Division = '" & Divisions & "' "
        End If

        sqlcmd &= "ORDER BY Facility ASC, PostDate DESC"

        Dim ds As Data.DataSet = New Data.DataSet()
        Dim da As Data.SqlClient.SqlDataAdapter = New Data.SqlClient.SqlDataAdapter
        Dim con As Data.SqlClient.SqlConnection = New Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("DBConnectionString").ConnectionString)
        Dim cmd As Data.SqlClient.SqlCommand = New Data.SqlClient.SqlCommand(sqlcmd, con)
        da.SelectCommand = cmd
        da.Fill(ds)
        da = Nothing
        con = Nothing
        cmd = Nothing

        Return ds
        ds = Nothing
    End Function

    '************************************** D E L E T E ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteJobListing(ByVal RecID As Integer) As Boolean
        Dim rowsAffected As Integer = Adapter.DeleteJobListing(RecID)
        ' Return true if precisely one row was deleted, otherwise false
        Return rowsAffected = 1
    End Function

    '************************************** I N S E R T ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function InsertJobListing(ByVal Facility As String, ByVal Division As String, ByVal ContactName As String, ByVal ContactNumber As String, ByVal ContactEmail As String, ByVal JobTitle As String, ByVal JobDescription As String, ByVal Salary As String, ByVal ExpireDate As DateTime, ByVal Duities As String, ByVal Requirements As String, ByVal Display As Boolean) As Integer

        '-----------------  cap field length ------------------
        Facility = Left(Trim(Facility), 50)
        Division = Left(Trim(Division), 50)
        ContactName = Left(Trim(ContactName), 50)
        ContactNumber = Left(Trim(ContactNumber), 30)
        ContactEmail = Left(Trim(ContactEmail), 50)
        JobTitle = Left(Trim(JobTitle), 75)
        Salary = Left(Trim(Salary), 30)

        If Not IsDate(ExpireDate) Or ExpireDate = "1/1/1900 12:00:00 AM" Then ExpireDate = "12/31/2074"
        Dim PostDate As Date = Date.Now
        Randomize()
        Dim RanID As Integer = Int(Rnd() * 99999) + 1

        Dim rowsAffected As Integer = Adapter.InsertJobListing(Facility, Division, ContactName, ContactNumber, ContactEmail, JobTitle, JobDescription, Salary, PostDate, ExpireDate, Duities, Requirements, Display, RanID.ToString)
        ' Return true if precisely one row was inserted, otherwise false
        Return rowsAffected = 1
    End Function

    '************************************** U P D A T E ************************************

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateJobListing(ByVal Facility As String, ByVal Division As String, ByVal ContactName As String, ByVal ContactNumber As String, ByVal ContactEmail As String, ByVal JobTitle As String, ByVal JobDescription As String, ByVal Salary As String, ByVal ExpireDate As DateTime, ByVal Duities As String, ByVal Requirements As String, ByVal Display As Boolean, ByVal RecID As Integer) As Boolean

        '-----------------  cap field length ------------------
        Facility = Left(Trim(Facility), 50)
        Division = Left(Trim(Division), 50)
        ContactName = Left(Trim(ContactName), 50)
        ContactNumber = Left(Trim(ContactNumber), 30)
        ContactEmail = Left(Trim(ContactEmail), 50)
        JobTitle = Left(Trim(JobTitle), 75)
        Salary = Left(Trim(Salary), 30)

        If Not IsDate(ExpireDate) Or ExpireDate = "1/1/1900 12:00:00 AM" Then ExpireDate = "12/31/2074"

        Dim rowsAffected As Integer = Adapter.UpdateJobListing(Facility, Division, ContactName, ContactNumber, ContactEmail, JobTitle, JobDescription, Salary, ExpireDate, Duities, Requirements, Display, RecID)
        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function

End Class
