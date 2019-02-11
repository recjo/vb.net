<%@ Page Title="" Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="jobs-add.aspx.vb" Inherits="nimda_jobs_add" %>
<%@ Register TagPrefix="uc1" TagName="MenuControl" Src="~/menus/NimdaMenu.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="GrayMatterSoft" Assembly="GMDatePicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
    <uc1:MenuControl id="McMenu" runat="server" EnableViewState="false" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><asp:Label ID="lblTitle" runat="server" Text="Add Job Listing" /></h2>
    <asp:HyperLink ID="lnkBack" runat="server" Visible="false" NavigateUrl="jobs.aspx" style="float:right;">Back to List</asp:HyperLink>

    <p><strong>Note:</strong> Required fields are marked with an asterisk (<em>*</em>)</p>

    <asp:HiddenField ID="hfRecID" runat="server" />
    <table>
    
    <tr class="HeaderStyle"><th colspan="2">Employer Info</th></tr>
    
    <tr><td>Facility: </td>
    <td>
        <asp:DropDownList ID="ddlFacility" runat="server">
            <%-- If you change Facility names, update existing records in JobListings
            make same changes to nimda/jobs-add.aspx, careers/careerssearch.ascx --%>
            <asp:ListItem Text="Riverside" Value="Riverside" />
            <asp:ListItem Text="Los Angeles" Value="Los Angeles" />
            <asp:ListItem Text="Ontario" Value="Ontario" />
            <asp:ListItem Text="Rialto" Value="Rialto" />
        </asp:DropDownList>
    </td>
    </tr>
    
    <tr><td>Division/Department: </td>
    <td><asp:TextBox ID="txtDivision" runat="server" MaxLength="50" Width="470px" /></td>
    </tr>
    
    <tr><td>Contact Name: </td>
    <td><asp:TextBox ID="txtContactName" runat="server" MaxLength="50" Width="470px" /></td>
    </tr>
    
    <tr><td>Contact Number: </td>
    <td><asp:TextBox ID="txtContactNumber" runat="server" MaxLength="30" Width="470px" /></td>
    </tr>
    
    <tr><td>Contact Email: </td>
    <td><asp:TextBox ID="txtContactEmail" runat="server" MaxLength="50" Width="470px" />
        <asp:RegularExpressionValidator ID="REV1" runat="server" ControlToValidate="txtContactEmail"
            Display="Dynamic" EnableViewState="False" ErrorMessage="CONTACT EMAIL must be in format user@domain.com"
            ForeColor="#B83D0D" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>
    </tr>
    
    <tr class="HeaderStyle"><th colspan="2">Job Info</th></tr>
    
    <tr><td>Job Title:  <em>*</em></td>
    <td><asp:TextBox ID="txtJobTitle" runat="server" MaxLength="75" Width="470px" />
        <asp:RequiredFieldValidator ID="RV1" runat="server" ControlToValidate="txtJobTitle"
            Display="Dynamic" EnableViewState="false" ErrorMessage="JOB TITLE cannot be blank."
            ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
    </td>
    </tr>
    
    <tr><td valign="top">Job Description:  <em>*</em></td>
    <td><asp:TextBox ID="txtJobDescription" runat="server" MaxLength="7000" Width="470px" Height="90px" TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtJobDescription"
            Display="Dynamic" EnableViewState="false" ErrorMessage="JOB DESCRIPTION cannot be blank."
            ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
    </td>
    </tr>
    
    <tr><td>Salary: </td>
    <td><asp:TextBox ID="txtSalary" runat="server" MaxLength="30" Width="470px" /></td>
    </tr>
    
    <tr><td valign="top">Job Duties: </td>
    <td><asp:TextBox ID="txtDuities" runat="server" MaxLength="7000" Width="470px" Height="90px" TextMode="MultiLine" /></td>
    </tr>
    
    <tr><td valign="top">Job Requirements: </td>
    <td><asp:TextBox ID="txtRequirements" runat="server" MaxLength="7000" Width="470px" Height="90px" TextMode="MultiLine" /></td>
    </tr>
    
    <tr class="HeaderStyle"><th colspan="2">Other</th></tr>
    
    <tr><td>Expiration Date: </td>
    <td>
        <cc1:GMDatePicker ID="txtExpireDate" runat="server" TextBoxWidth="80" InitialText=" "
            ImageUrl="../pics/calendar.gif" CalendarDayNameFormat="FirstLetter"
            ShowNoneButton="false" ShowTodayButton="false" InitialValueMode="Null"
            CalendarWidth="170" NextPrevFormat="CustomText" 
            NextMonthText="<img src=../pics/monthright.gif>" 
            PrevMonthText="<img src=../pics/monthleft.gif>">
            <CalendarTitleStyle CssClass="DatePickerTitle" />
            <CalendarNextPrevStyle CssClass="DatePickerNextPrev" />
            <CalendarDayHeaderStyle CssClass="DatePickerDayHeader" />
            <CalendarDayStyle CssClass="DatePickerDayStyle" />
            <CalendarTodayDayStyle CssClass="DatePickerTodayDay" />
            <CalendarOtherMonthDayStyle CssClass="DatePickerOtherMonth" />
            <MonthYearDropDownStyle CssClass="DatePickerMonthYear" />
            <CalendarFooterStyle CssClass="DatePickerFooter" />
            <CalendarSelectedDayStyle CssClass="DatePickerSelectedDay" />
        </cc1:GMDatePicker>
        &nbsp; <i>if left blank, listing will display indefinitely.</i>
    </td></tr>
    
    <tr><td>Display: </td>
    <td><asp:CheckBox ID="chkDisplay" runat="server" Checked="true" Text="Check this box to display on the website to visitors." /></td>
    </tr>
    
    <tr><td></td>
    <td>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableViewState="False" ShowMessageBox="True" HeaderText="The following fields need your attention:" />
    <div id="buttonRow">
        <asp:Button ID="btnAdd" runat="server" Text="Add" CausesValidation="true" CssClass="button" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CausesValidation="true" CssClass="button" Visible="false" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" CssClass="button" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CausesValidation="false" CssClass="button" Visible="false" OnClientClick="return confirm('Do you really want to delete this Job?')" />
    </div>
    </td></tr>
    </table>

    <asp:ObjectDataSource ID="JLDataSource" runat="server" TypeName="JobListingsBLL"
        InsertMethod="InsertJobListing" UpdateMethod="UpdateJobListing" DeleteMethod="DeleteJobListing">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hfRecID" Name="RecID" PropertyName="Value" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="ddlFacility" PropertyName="SelectedValue" Name="Facility" Type="String" />
            <asp:ControlParameter ControlID="txtDivision" PropertyName="Text" Name="Division" Type="String" />
            <asp:ControlParameter ControlID="txtContactName" PropertyName="Text" Name="ContactName" Type="String" />
            <asp:ControlParameter ControlID="txtContactNumber" PropertyName="Text" Name="ContactNumber" Type="String" />
            <asp:ControlParameter ControlID="txtContactEmail" PropertyName="Text" Name="ContactEmail" Type="String" />
            <asp:ControlParameter ControlID="txtJobTitle" PropertyName="Text" Name="JobTitle" Type="String" />
            <asp:ControlParameter ControlID="txtJobDescription" PropertyName="Text" Name="JobDescription" Type="String" />
            <asp:ControlParameter ControlID="txtSalary" PropertyName="Text" Name="Salary" Type="String" />
            <asp:ControlParameter ControlID="txtExpireDate" PropertyName="Date" Name="ExpireDate" Type="DateTime" />
            <asp:ControlParameter ControlID="txtDuities" PropertyName="Text" Name="Duities" Type="String" />
            <asp:ControlParameter ControlID="txtRequirements" PropertyName="Text" Name="Requirements" Type="String" />
            <asp:ControlParameter ControlID="chkDisplay" PropertyName="Checked" Name="Display" Type="Boolean" />
            <asp:ControlParameter ControlID="hfRecID" Name="RecID" PropertyName="Value" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlFacility" PropertyName="SelectedValue" Name="Facility" Type="String" />
            <asp:ControlParameter ControlID="txtDivision" PropertyName="Text" Name="Division" Type="String" />
            <asp:ControlParameter ControlID="txtContactName" PropertyName="Text" Name="ContactName" Type="String" />
            <asp:ControlParameter ControlID="txtContactNumber" PropertyName="Text" Name="ContactNumber" Type="String" />
            <asp:ControlParameter ControlID="txtContactEmail" PropertyName="Text" Name="ContactEmail" Type="String" />
            <asp:ControlParameter ControlID="txtJobTitle" PropertyName="Text" Name="JobTitle" Type="String" />
            <asp:ControlParameter ControlID="txtJobDescription" PropertyName="Text" Name="JobDescription" Type="String" />
            <asp:ControlParameter ControlID="txtSalary" PropertyName="Text" Name="Salary" Type="String" />
            <asp:ControlParameter ControlID="txtExpireDate" PropertyName="Date" Name="ExpireDate" Type="DateTime" DefaultValue="1/1/1900" />
            <asp:ControlParameter ControlID="txtDuities" PropertyName="Text" Name="Duities" Type="String" />
            <asp:ControlParameter ControlID="txtRequirements" PropertyName="Text" Name="Requirements" Type="String" />
            <asp:ControlParameter ControlID="chkDisplay" PropertyName="Checked" Name="Display" Type="Boolean" />
        </InsertParameters>

    </asp:ObjectDataSource>
    
</asp:Content>

