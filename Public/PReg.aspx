<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PReg.aspx.cs" MasterPageFile="~/Login_New.Master" Inherits="PresentationLayer.Public.PReg" %>
<%@ MasterType VirtualPath="~/Login_New.master" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegistration" runat="server">
        <ContentTemplate >
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="/H0Pijr">Home</a></li>
                    <li class="breadcrumb-item">Admission Page</li>
                </ol>
            </nav>
            <div class="row">
                <div class=" col-md-3">
                    <div class="card" style="margin-left: 5%; margin-right: 5%; margin-top: 40px; padding: 10px;">
                        <div class="card-header" style="background-color: #3AAF4A; color: white; margin-bottom: 10px; border-radius: 20px;">
                            <h3>Instructions</h3>

                        </div>
                        <p>This page is for Requesting admission for student.</p>
                        <ul>
                            <li>Enter student details</li>
                            <li>You will receive Control Number your mobile number</li>
                            <li>Make payment using obtained Control Number.</li>
                            <li>You will be contacted for further details.</li>
                        </ul>
                    </div>
                </div> 
                <div class="col-md-9 ">
                    <div class="card" style="margin-left: 5%; margin-right: 5%; margin-top: 40px; ">
                        <div class="card-body">       
                            <!-- <h5 class="card-title">Control No. for Admission Fee</h5> -->
                            <div class="card-header"  style="background-color: #3AAF4A; color: white; margin-bottom: 10px; border-radius: 20px;">
                                  <h5 class="card-title" style="text-align: center; margin-bottom: 10px;">Fill in below information to get the control number for admission payments 
                                  </h5> 
                            </div>
                         
        
                            <div class="row">
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">School
                                        Name<span class="red_new">*</span></asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSchool" AutoPostBack="true" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" CssClass="red_new offset-md-3"
                                        ControlToValidate="ddlSchool" Display="Dynamic" ErrorMessage="Please select school">
                                    </asp:RequiredFieldValidator>
                                </div>
        
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">
                                        Academic<span class="red_new">*</span></asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                        ErrorMessage="Please select academic">
                                    </asp:RequiredFieldValidator>
                                </div>
        
                                
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Class<span
                                            class="red_new">*</span></asp:Label>
                                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                                        ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                                    </asp:RequiredFieldValidator>
                                </div>
        
                                
        
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1"> Index No
                                        <%--<span class="red_new">*</span>--%></asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtADN" MaxLength="200">
                                    </asp:TextBox>
                                    <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                        CssClass="red_new offset-md-3" ControlToValidate="txtADN" Display="Dynamic"
                                        ErrorMessage="Please enter index no">
                                    </asp:RequiredFieldValidator>--%>
                                </div>
        
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Student
                                        Name<span class="red_new">*</span></asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFN" MaxLength="200">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                        CssClass="red_new offset-md-3" ControlToValidate="txtFN" Display="Dynamic"
                                        ErrorMessage="Please enter student name">
                                    </asp:RequiredFieldValidator>
                                </div>
        
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label8">Parent
                                        Name<span class="red_new">*</span></asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPN" MaxLength="200">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                                        CssClass="red_new offset-md-3" ControlToValidate="txtPN" Display="Dynamic"
                                        ErrorMessage="Please enter parent name">
                                    </asp:RequiredFieldValidator>
                                </div>
        
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label9">Parent
                                        Mobile<span class="red_new">*</span></asp:Label>
                                    <div class="input-group col-md-9 px-0">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD">255</asp:Label></span></div>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="txtPM" MaxLength="9"
                                            ToolTip="Mobile No:(ex:784777777)" placeholder="eg.784777777"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6"
                                        CssClass="red_new offset-md-3" ControlToValidate="txtPM" Display="Dynamic"
                                        ErrorMessage="Please enter parent mobile">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ID="revWork" CssClass="red_new" ValidationExpression="^[0-9]{9}$"
                                                ControlToValidate="txtPM" Display="Dynamic" ErrorMessage="Please enter valid number"> </asp:RegularExpressionValidator>
                                </div>   
                                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                                    <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label10">Parent
                                        Email</asp:Label>
                                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPE" placeholder="parent@email.com" MaxLength="200">
                                    </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtPE"
                                        CssClass="red_new offset-md-3" ErrorMessage="Please enter the valid Email ID"
                                        ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                        Display="Dynamic">
                                    </asp:RegularExpressionValidator>
                                </div>           
                            </div>    
                            <div class="form-group d-flex justify-content-end">
                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Submit"
                                    OnClick="btnReg_Click" />
                                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" CausesValidation="false" OnClick="btnCancel_Click"
                                    Text="Cancel" />
                            </div>
                           <%-- <div class="table-responsive mb-1">
                                <asp:GridView ID="gvDept" Visible="false" CssClass="table table-bordered mb-1 display"
                                    runat="server" AutoGenerateColumns="false" Width="100%"
                                    AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                    PageSize="10" OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <Columns>
                                        <asp:BoundField DataField="Admission_No" HeaderText="Admission No" />
                                        <asp:BoundField DataField="Admission_Date" HeaderText="Admission Date"
                                            DataFormatString="{0:dd/M/yyyy}" />
                                        <asp:BoundField DataField="Student_Full_Name" HeaderText="Full Name" />
                                        <asp:BoundField DataField="Medium_Type" HeaderText="Medium" />
                                        <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                                        <asp:BoundField DataField="Section_Name" HeaderText="Stream/Combination" />
                                        <asp:BoundField DataField="Roll_No" HeaderText="Roll No" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                    </Columns>
                                </asp:GridView>
                            </div> --%>
        
                        </div>
                </div>
            </div>
             
            </div>
            
        </ContentTemplate>
  
        <Triggers>
            <asp:PostBackTrigger ControlID="btnReg" />
        </Triggers>
        
    </asp:UpdatePanel>
    <div class="footer" style="height: 10px;  margin-top: 125px; text-align: center;">
        <p class="mb-0 small"><span id="lblBSA">Designed &amp; Developed by <a href="http://bizlogicsolutions.com">Biz-Logic Solutions Ltd</a></span></p>
    </div>
</asp:Content>