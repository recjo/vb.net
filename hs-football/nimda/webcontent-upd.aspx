<%@ Page Language="VB" MasterPageFile="~/Nimda.master" AutoEventWireup="false" CodeFile="webcontent-upd.aspx.vb" Inherits="nimda_webcontent_upd" title="Web Content Edit" ValidateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <asp:Label ID="Label5" runat="server" Text="Web Content Edit" CssClass="h2title"></asp:Label><br />
        <br />
        <b>To skip only One line, use Ctrl-Enter. Pictures must be uploaded (ftp'd) to the server prior to using.</b><br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="RecID" DataSourceID="EventsDataSource" DefaultMode="Edit" EnableViewState="False" >
            <EditItemTemplate>
                <asp:HiddenField ID="PageID" runat="server" Value='<%# Bind("PageName") %>' EnableViewState="false" />
                <table border="0">
                <tr><th style="height:22px;">Page ID: </th>
                <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("PageName") %>' EnableViewState="false"></asp:Label>
                </td></tr>
                
                <asp:HiddenField ID="hfLinkName" runat="server" Value='<%# Bind("LinkName") %>' EnableViewState="false" />
                <%--<tr><th>Link Name: </th>
                <td><asp:TextBox ID="txtLinkName" runat="server" Text='<%# Bind("LinkName") %>' MaxLength="30" Columns="30" EnableViewState="false"></asp:TextBox>
                </td></tr>--%>
                
                <tr><th>Page Title: </th>
                <td><asp:TextBox ID="txtPageTitle" runat="server" Text='<%# Bind("PageTitle") %>' MaxLength="50" Columns="30" EnableViewState="false" ></asp:TextBox>
                </td></tr>
                
                <tr><th colspan="2" style="height:22px;">Page Text: </th></tr>
                <tr><td colspan="2"><FTB:FreeTextBox id="txtPageText" runat="Server" EnableViewState="False" 
                ToolbarLayout="FontSizesMenu,FontForeColorsMenu;bold,italic,underline,BulletedList,NumberedList;InsertImage;Cut, Copy, Paste, Delete; CreateLink, Unlink, RemoveFormat"
                Width="490" Height="190" EnableHtmlMode="false"  ToolbarStyleConfiguration="NotSet" Text='<%# Bind("PageText") %>'
                BackColor="#F2F2F2" EditorBorderColorDark="Black" EditorBorderColorLight="#F2F2F2" UseToolbarBackGroundImage="false" ToolbarBackgroundImage="false" ToolbarBackColor="#f2f2f2" PasteMode="Text" /><br />
                </td></tr>
                
                <tr><th></th>
                <td><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" EnableViewState="false"></asp:LinkButton> |
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" PostBackUrl="webcontent.aspx" EnableViewState="false"></asp:LinkButton><%-- |
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Do you really want to delete this page?')" EnableViewState="false"></asp:LinkButton>--%>
                </td></tr>
                
                </table>
            </EditItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="EventsDataSource" runat="server" DeleteMethod="DeleteWebContent"
            OldValuesParameterFormatString="original_{0}" EnableViewState="false"
            SelectMethod="GetWebContentByRecID" TypeName="WebContentBLL" UpdateMethod="UpdateWebContent">
            <DeleteParameters>
                <asp:Parameter Name="original_RecID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="PageName" Type="String" />
                <asp:Parameter Name="LinkName" Type="String" />
                <asp:Parameter Name="PageTitle" Type="String" />
                <asp:Parameter Name="PageText" Type="String" />
                <asp:Parameter Name="original_RecID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="RecID" QueryStringField="artID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

