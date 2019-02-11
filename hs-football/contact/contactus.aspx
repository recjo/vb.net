<%@ Page Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="contactus.aspx.vb" Inherits="contact_contactus" title="Untitled Page" %>
<%@ Register TagPrefix="uc1" TagName="MenuControl" Src="../menus/MenuControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuContent" Runat="Server">
    <uc1:MenuControl id="mcMenu" runat="server" EnableViewState="false"></uc1:MenuControl>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="RecID" DataSourceID="WebContentDataSource" EnableViewState="false">
        <ItemTemplate>
            <asp:Label ID="lblPageTitle" runat="server" Text='<%# Eval("PageTitle") %>' CssClass="h2title" EnableViewState="false"></asp:Label>
            <br /><br />
            <asp:Label ID="PageTextLabel" runat="server" Text='<%# Eval("PageText") %>' EnableViewState="false"></asp:Label><br />
        </ItemTemplate>
    </asp:FormView>
    
    <asp:ObjectDataSource ID="WebContentDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetWebContentByPageName" TypeName="WebContentBLL" EnableViewState="false">
        <SelectParameters>
            <asp:Parameter DefaultValue="ContactUs" Name="PageName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

