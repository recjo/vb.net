<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="teammom_default" ValidateRequest="false" title="Untitled Page" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MenuContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <h2>Team Mom Announcement Page</h2>
    
    <asp:Label ID="lblInstructions" runat="server" Text="Change Message on the Team News page. Check the box to email the new message to all subscribed parents."></asp:Label><br /><br />
    
    <asp:HiddenField ID="hfRecID" runat="server" />
    <h4><asp:Label ID="lblPageTitle" runat="server"></asp:Label></h4>
    <b><asp:Label ID="lblInstructions2" runat="server" Text="(To skip only One line, use Ctrl-Enter.)"></asp:Label></b><br />
    
    <FTB:FreeTextBox id="txtMessage" runat="Server" EnableViewState="False" ToolbarLayout="FontSizesMenu,FontForeColorsMenu;bold,italic,underline,BulletedList,NumberedList;InsertImage;Cut, Copy, Paste, Delete|CreateLink, Unlink, RemoveFormat" Width="420" Height="190" EnableHtmlMode="false"  ToolbarStyleConfiguration="NotSet" BackColor="#F2F2F2" EditorBorderColorDark="Black" EditorBorderColorLight="#F2F2F2" UseToolbarBackGroundImage="false" ToolbarBackgroundImage="false" ToolbarBackColor="#f2f2f2" PasteMode="Text" /><br />
    
    <asp:CheckBox ID="chkMailer" runat="server" Text="Check box to email all subscribers." /><br />
    <asp:Label ID="lblMsg" runat="server" Text="Please enter your email so parents can contact you with any questions:"></asp:Label><br />
    <asp:Label ID="lblEmail" runat="server" Text="My Email:" Font-Bold="true"></asp:Label> <asp:TextBox ID="txtReplyTo" runat="server" Columns="30" MaxLength="30"></asp:TextBox><asp:RegularExpressionValidator ID="REV1" runat="server" ErrorMessage="Email must be in the form of user@host.com" ControlToValidate="txtReplyTo" Text="*" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
    <asp:ValidationSummary ID="VS1" runat="server" ShowMessageBox="true" HeaderText="The following fields need your attention:" />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" />
    
    
    
    
    
    
    <br /><br />
    <hr id="hr1" runat="server" style="color: #800000;" />
    <asp:Label ID="lblGridView" runat="server" Text="Subscribers to your Team News Page"></asp:Label><br /><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="RecID" DataSourceID="NewsletterSource" PageSize="40" EmptyDataText="<br /><br />No subscribers found." ShowHeader="true">
        <Columns>
            <asp:BoundField DataField="ParentName" HeaderText="Parent Name" SortExpression="ParentName" />
            <asp:BoundField DataField="ChildName" HeaderText="Child" SortExpression="ChildName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Action" HeaderStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="NewsletterSource" runat="server" DeleteMethod="DeleteSubscriber" EnableViewState="false" 
        InsertMethod="InsertSubscriber" 
        SelectMethod="GetSubsByLeague" TypeName="NewsletterBLL" UpdateMethod="UpdateSubscriber">
        <DeleteParameters>
            <asp:Parameter Name="RecID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="league" Type="String" />
            <asp:Parameter Name="parentname" Type="String" />
            <asp:Parameter Name="childname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="recid" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="league" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
    
    <asp:HyperLink ID="hyp1" runat="server" NavigateUrl="default.aspx" Visible="false">Back to Team Announcements</asp:HyperLink>
    
</asp:Content>

