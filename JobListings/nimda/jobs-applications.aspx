<%@ Page Title="" Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="jobs-applications.aspx.vb" Inherits="nimda_jobs_applications" %>
<%@ Register TagPrefix="uc1" TagName="MenuControl" Src="~/menus/NimdaMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
    <uc1:MenuControl id="McMenu" runat="server" EnableViewState="false" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><asp:Label ID="lblTitle" runat="server" Text="Job Applications" /></h2>
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="jobs.aspx" style="float:right;">Back to Job Listing</asp:HyperLink>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="RecID" DataSourceID="JAObjectDataSource">
        <Columns>
            <asp:BoundField DataField="PostDate" HeaderText="Posted" DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="Applicant">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") & " " & Eval("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("City") & ", " & Eval("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField Text="Resume" DataNavigateUrlFields="JobID,RecID" DataNavigateUrlFormatString="jobs-applications-details.aspx?rid={0}&aid={1}" HeaderText="Action" />
        </Columns>
    </asp:GridView>
    
    <asp:ObjectDataSource ID="JAObjectDataSource" runat="server" SelectMethod="GetApplicationsByJobid" TypeName="JobApplicationsBLL">
        <SelectParameters>
            <asp:QueryStringParameter Name="JobID" QueryStringField="rid" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

