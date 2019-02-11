<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CareersSearch.ascx.vb" Inherits="careers_CareersSearch" %>
<h3>Job Opening Search</h3>

<asp:TextBox ID="txtKeywords" runat="server" onfocus="clearMe();" Text="job title keyword" style="width:147px; font-family:'Myriad Web'; font-size:11px; font-style:normal; font-weight:normal;" />

<asp:Button ID="btnGo" runat="server" Text="Go" CausesValidation="false" PostBackUrl="~/careers/job-list.aspx" style="width:37px; font-size:11px;" />

<asp:DropDownList ID="ddlFacility" runat="server" style="width:187px;background-color:#FFFFFF;font-family:'Myriad Web';font-size:11px;margin-top:6px;margin-bottom:3px;">
    <asp:ListItem Text="facility" Value="" />
    <%-- If you change Facility names, update existing records in JobListings
    make same changes to nimda/jobs-add.aspx, careers/careerssearch.ascx --%>
    <asp:ListItem Text="Riverside" Value="Riverside" />
    <asp:ListItem Text="Los Angeles" Value="Los Angeles" />
    <asp:ListItem Text="Ontario" Value="Ontario" />
    <asp:ListItem Text="Rialto" Value="Rialto" />
</asp:DropDownList>

<asp:DropDownList ID="ddlDivision" runat="server" DataSourceID="JobListingsDataSource" DataTextField="Division" DataValueField="Division" AppendDataBoundItems="true" style="width:187px;background-color:#FFFFFF;font-family:'Myriad Web';font-size:11px;margin-top:3px;margin-bottom:3px;">
    <asp:ListItem Text="division" Value="" />
</asp:DropDownList>

<asp:ObjectDataSource ID="JobListingsDataSource" runat="server" SelectMethod="GetDivisions" TypeName="JobListingsBLL" />

<script type="text/javascript">
    function clearMe() {
        var ctrl = document.getElementById("ctl00_MenuContent_McMenu_txtKeywords");
        if (ctrl.value == "job title keyword")
        {
            ctrl.value = "";
        }
    }
</script>