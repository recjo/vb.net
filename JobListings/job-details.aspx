<%@ Page Title="" Language="VB" MasterPageFile="~/SubPage.master" AutoEventWireup="false" CodeFile="job-details.aspx.vb" Inherits="careers_job_details" %>
<%@ Register TagPrefix="cs1" TagName="CareerSearch" Src="~/careers/CareersSearch.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    fieldset { border:solid 1px #516293;padding:10px; }
    legend { padding:10px; }
    label {
        width: 100px;
        display: inline-block;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" Runat="Server">
    <cs1:CareerSearch id="McMenu" runat="server" EnableViewState="false" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><asp:Label ID="Label1" runat="server" Text="Job Details" /></h2>
    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="job-list.aspx" style="float:right;">Back to List</asp:HyperLink>

    <dl class="tabset">
        <dt id="services" class="active">Job Description</dt>
        <dd>

            <fieldset>
                <legend>Job Details</legend>
                <div id="dJobTitle" runat="server"><label>Job Title</label>
                <asp:Label ID="lblJobTitle1" runat="server" /></div>
                <div id="dPosted" runat="server"><label>Posted</label>
                <asp:Label ID="lblPosted" runat="server" /></div>
                <div id="dApplyby" runat="server"><label>Apply by</label>
                <asp:Label ID="lblExpDate" runat="server" /></div>
                <div id="dFacility" runat="server"><label>Facility</label>
                <asp:Label ID="lblFacility1" runat="server" /></div>
                <div id="dDivision" runat="server"><label>Division</label>
                <asp:Label ID="lblDivision1" runat="server" /></div>
                <div id="dSalary" runat="server"><label>Salary</label>
                <asp:Label ID="lblSalary" runat="server" /></div>
            </fieldset>

            <fieldset>
                <legend>Job Description</legend>
                <asp:Label ID="lblJobDescription" runat="server" />
            </fieldset>

            <fieldset id="fsJobRequirements" runat="server">
                <legend>Job Requirements</legend>
                <asp:Label ID="lblJobRequirements" runat="server" />
            </fieldset>

            <fieldset id="fsJobDuties" runat="server">
                <legend>Job Duties</legend>
                <asp:Label ID="lblJobDuties" runat="server" />
            </fieldset>

            <fieldset id="fsContact" runat="server">
                <legend>Contact Information</legend>
                <div id="dContactName" runat="server"><label>Contact Name</label>
                <asp:Label ID="lblContactName" runat="server" /></div>
                <div id="dContactNumber" runat="server"><label>Contact Number</label>
                <asp:Label ID="lblContactNumber" runat="server" /></div>
                <div id="dContactEmail" runat="server"><label>Contact Email</label>
                <asp:HyperLink ID="lnkContactEmail" Target="_blank" runat="server" /></div>
            </fieldset>
        
        </dd>














        <dt id="facilityTour" runat="server">Apply for this Job</dt>
        <dd>
            <h3>Apply for this Job</h3>

            <fieldset>
                <legend>Job Details</legend>
                <div><label>Facility</label>
                <asp:Label ID="lblFacility2" runat="server" />
                </div>
                <div><label>Division</label>
                <asp:Label ID="lblDivision2" runat="server" />
                </div>
                <div><label>Job Title</label>
                <asp:Label ID="lblJobTitle2" runat="server" />
                </div>
            </fieldset>
            
            <fieldset>
                <legend>Applicant Details</legend>
                
                <div><label>First Name</label>
                <asp:TextBox ID="txtFirstname" runat="server" Width="300" MaxLength="30" Text='<%# Bind("FirstName") %>' />
                    <asp:RequiredFieldValidator
                        ID="RV1" runat="server" ControlToValidate="txtFirstname" Display="Dynamic" EnableViewState="false"
                        ErrorMessage="FIRST NAME cannot be blank." Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator></div>
                
                
                <div><label>Last Name</label>
                <asp:TextBox ID="txtLastname" runat="server" Width="300" MaxLength="30" Text='<%# Bind("LastName") %>' />
                    <asp:RequiredFieldValidator
                        ID="RV2" runat="server" ControlToValidate="txtLastname" Display="Dynamic" EnableViewState="false"
                        ErrorMessage="LAST NAME cannot be blank." Text="*" SetFocusOnError="true"></asp:RequiredFieldValidator></div>
                
                
                <div><label>Street Address</label>
                <asp:TextBox ID="txtAddress" runat="server" Width="300" MaxLength="40" Text='<%# Bind("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RV3" runat="server" ControlToValidate="txtAddress"
                        Display="Dynamic" EnableViewState="false" ErrorMessage="ADDRESS cannot be blank."
                        ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                </div>
                
                
                <div><label>City</label>
                <asp:TextBox ID="txtCity" runat="server" Width="300" MaxLength="40" Text='<%# Bind("City") %>' />
                    <asp:RequiredFieldValidator ID="RV4" runat="server" ControlToValidate="txtCity"
                        Display="Dynamic" EnableViewState="false" ErrorMessage="CITY cannot be blank."
                        ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                </div>
                
                
                <div><label>State</label>
                <asp:DropDownList ID="ddlState" runat="server" SelectedValue='<%# Bind("State") %>'>
                <asp:ListItem value="" Text="" />
                <asp:ListItem value="AL" Text="Alabama" />
                <asp:ListItem value="AK" Text="Alaska" />
                <asp:ListItem value="AZ" Text="Arizona" />
                <asp:ListItem value="AR" Text="Arkansas" />
                <asp:ListItem value="CA" Text="California" />
                <asp:ListItem value="CO" Text="Colorado" />
                <asp:ListItem value="CT" Text="Connecticut" />
                <asp:ListItem value="DE" Text="Delaware" />
                <asp:ListItem value="FL" Text="Florida" />
                <asp:ListItem value="GA" Text="Georgia" />
                <asp:ListItem value="HI" Text="Hawaii" />
                <asp:ListItem value="ID" Text="Idaho" />
                <asp:ListItem value="IL" Text="Illinois" />
                <asp:ListItem value="IN" Text="Indiana" />
                <asp:ListItem value="IA" Text="Iowa" />
                <asp:ListItem value="KS" Text="Kansas" />
                <asp:ListItem value="KY" Text="Kentucky" />
                <asp:ListItem value="LA" Text="Louisiana" />
                <asp:ListItem value="ME" Text="Maine" />
                <asp:ListItem value="MD" Text="Maryland" />
                <asp:ListItem value="MA" Text="Massachusetts" />
                <asp:ListItem value="MI" Text="Michigan" />
                <asp:ListItem value="AA" Text="Mil. APO (AA)" />
                <asp:ListItem value="AE" Text="Mil. APO/FPO (AE)" />
                <asp:ListItem value="AP" Text="Mil. APO/FPO (AP)" />
                <asp:ListItem value="MN" Text="Minnesota" />
                <asp:ListItem value="MS" Text="Mississippi" />
                <asp:ListItem value="MO" Text="Missouri" />
                <asp:ListItem value="MT" Text="Montana" />
                <asp:ListItem value="NE" Text="Nebraska" />
                <asp:ListItem value="NV" Text="Nevada" />
                <asp:ListItem value="NH" Text="New Hampshire" />
                <asp:ListItem value="NJ" Text="New Jersey" />
                <asp:ListItem value="NM" Text="New Mexico" />
                <asp:ListItem value="NY" Text="New York" />
                <asp:ListItem value="NC" Text="North Carolina" />
                <asp:ListItem value="ND" Text="North Dakota" />
                <asp:ListItem value="OH" Text="Ohio" />
                <asp:ListItem value="OK" Text="Oklahoma" />
                <asp:ListItem value="OR" Text="Oregon" />
                <asp:ListItem value="PA" Text="Pennsylvania" />
                <asp:ListItem value="RI" Text="Rhode Island" />
                <asp:ListItem value="SC" Text="South Carolina" />
                <asp:ListItem value="SD" Text="South Dakota" />
                <asp:ListItem value="TN" Text="Tennessee" />
                <asp:ListItem value="TX" Text="Texas" />
                <asp:ListItem value="UT" Text="Utah" />
                <asp:ListItem value="VT" Text="Vermont" />
                <asp:ListItem value="VA" Text="Virginia" />
                <asp:ListItem value="WA" Text="Washington" />
                <asp:ListItem value="DC" Text="Washington D.C." />
                <asp:ListItem value="WV" Text="West Virgina" />
                <asp:ListItem value="WI" Text="Wisconsin" />
                <asp:ListItem value="WY" Text="Wyoming" />
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RV5" runat="server" ControlToValidate="ddlState"
                        Display="Dynamic" EnableViewState="false" ErrorMessage="Please choose STATE."
                        ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                </div>
                
                
                <div><label>Zip</label>
                <asp:TextBox ID="txtZip" runat="server" Width="300" MaxLength="11" Text='<%# Bind("Zip") %>' />
                    <asp:RequiredFieldValidator ID="RV6" runat="server" ControlToValidate="txtZip"
                        Display="Dynamic" EnableViewState="false" ErrorMessage="ZIP cannot be blank."
                        ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                </div>
                
                
                <div><label>E-mail</label>
                <asp:TextBox ID="txtEmail" runat="server" Width="300" MaxLength="40" Text='<%# Bind("Email") %>' />
                    <asp:RequiredFieldValidator ID="RV7" runat="server" ControlToValidate="txtEmail" Display="Dynamic" EnableViewState="false" ErrorMessage="EMAIL cannot be blank." ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator  ID="REV1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" EnableViewState="False"  ErrorMessage="EMAIL must be in format user@domain.com" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                
                
                <div><label>Phone Number</label>
                <asp:TextBox ID="txtPhoneareacode" runat="server" Width="30" MaxLength="3" />-<asp:TextBox ID="txtPhoneprefix" runat="server" Width="30" MaxLength="3" />-<asp:TextBox ID="txtPhonenum" runat="server" Width="40" MaxLength="4" />
                    <asp:RequiredFieldValidator ID="RV8" runat="server" ControlToValidate="txtPhoneareacode" Display="Dynamic" EnableViewState="false" ErrorMessage="AREA CODE cannot be blank." ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RV9" runat="server" ControlToValidate="txtPhoneprefix" Display="Dynamic" EnableViewState="false" ErrorMessage="PHONE PREFIX cannot be blank." ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RV10" runat="server" ControlToValidate="txtPhonenum" Display="Dynamic" EnableViewState="false" ErrorMessage="PHONES SUFFIX cannot be blank." ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="REV2" runat="server" ControlToValidate="txtPhoneareacode" Display="Dynamic" ErrorMessage="Only number allowed in AREA CODE" ForeColor="#B83D0D" Text="*" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="REV3" runat="server" ControlToValidate="txtPhoneprefix" Display="Dynamic" ErrorMessage="Only number allowed in PHONE PREFIX" ForeColor="#B83D0D" Text="*" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="REV4" runat="server" ControlToValidate="txtPhonenum" Display="Dynamic" ErrorMessage="Only number allowed in PHONES SUFFIX" ForeColor="#B83D0D" Text="*" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                </div>
            </fieldset>
            
            <fieldset>
                <legend>Additional Info</legend>
                <div><label style="height:100px;">Cover Letter:</label>
                <asp:TextBox ID="txtCoverLetter" runat="server" MaxLength="8000" TextMode="MultiLine" Width="550" Height="100" Text='<%# Bind("comments") %>' /><br />
                <label></label><asp:Label ID="Label3" runat="server" Text="(8000 characters max)" ForeColor="#999999" Font-Size="9px" Font-Names="Arial, Helvetica, sans-serif"></asp:Label></div>

                <div><label style="height:100px;">Resume:</label>
                <asp:TextBox ID="txtResume" runat="server" MaxLength="8000" TextMode="MultiLine" Width="550" Height="100" Text='<%# Bind("comments") %>' />
                    <asp:RequiredFieldValidator ID="RV11" runat="server" ControlToValidate="txtResume"
                        Display="Dynamic" EnableViewState="false" ErrorMessage="RESUME cannot be blank."
                        ForeColor="#B83D0D" Text="*"></asp:RequiredFieldValidator>
                    <br />
                <label></label><asp:Label ID="Label2" runat="server" Text="(8000 characters max)" ForeColor="#999999" Font-Size="9px" Font-Names="Arial, Helvetica, sans-serif"></asp:Label></div>
            </fieldset>

            <div id="buttonRow">
                <asp:ValidationSummary ID="VS1" runat="server" EnableViewState="false" ForeColor="red" HeaderText="The following items need your attention." ShowMessageBox="true" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CausesValidation="true" CommandName="Insert" CssClass="button" />
            </div>


        </dd>
    </dl>
    
    <asp:ObjectDataSource ID="JAObjectDataSource" runat="server" InsertMethod="InsertApplication" TypeName="JobApplicationsBLL">
        <InsertParameters>
            <asp:QueryStringParameter Name="JobID" QueryStringField="rid" Type="Int32" />
            <asp:ControlParameter ControlID="txtFirstname" PropertyName="Text" Name="FirstName" Type="String" />
            <asp:ControlParameter ControlID="txtLastname" PropertyName="Text" Name="LastName" Type="String" />
            <asp:ControlParameter ControlID="txtAddress" PropertyName="Text" Name="Address" Type="String" />
            <asp:ControlParameter ControlID="txtcity" PropertyName="Text" Name="City" Type="String" />
            <asp:ControlParameter ControlID="ddlState" PropertyName="SelectedValue" Name="State" Type="String" />
            <asp:ControlParameter ControlID="txtzip" PropertyName="Text" Name="Zip" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:ControlParameter ControlID="txtEmail" PropertyName="Text" Name="Email" Type="String" />
            <asp:ControlParameter ControlID="txtResume" PropertyName="Text" Name="_Resume" Type="String" />
            <asp:ControlParameter ControlID="txtCoverLetter" PropertyName="Text" Name="CoverLetter" Type="String" DefaultValue="" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

