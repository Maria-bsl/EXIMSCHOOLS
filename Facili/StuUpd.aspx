<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuUpd.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.StuUpd" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Student Details Update</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><label class="hd1 mb-0">Student Details Update</label></h5>
                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Admission No</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegion" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" CssClass="red_new offset-md-3"
                                ControlToValidate="txtRegion" Display="Dynamic" ErrorMessage="Please enter admission no">
                            </asp:RequiredFieldValidator>
                    </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label1">Academic
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select academic">
                            </asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label3">Medium
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlMedium">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlMedium" Display="Dynamic" ErrorMessage="Please select medium">
                            </asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Roll No</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRN" MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" CssClass="red_new offset-md-3"
                                ControlToValidate="txtRN" Display="Dynamic" ErrorMessage="Please enter Roll no">
                            </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Admission Date</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtAD" 
                            MaxLength="50">
                        </asp:TextBox>
                        <div class="input-group-append rounded-right">
                            <asp:ImageButton CssClass="input-group-text" runat="server"
                                CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                Height="38" />
                            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtAD" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                        </div>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" CssClass="red_new offset-md-3"
                                ControlToValidate="txtAD" Display="Dynamic" ErrorMessage="Please enter admission date">
                            </asp:RequiredFieldValidator>
                        <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                            errormessage="The date must be less than or equal to today date"
                            CssClass="red_new offset-md-3"
                            valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                            controltovalidate="txtAD" type="date" Operator="LessThanEqual" />
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            First Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFullName" 
                            MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" CssClass="red_new offset-md-3"
                                ControlToValidate="txtFullName" Display="Dynamic" ErrorMessage="Please enter first name">
                            </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Middle Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMName" 
                            MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" CssClass="red_new offset-md-3"
                                ControlToValidate="txtMName" Display="Dynamic" ErrorMessage="Please enter middle name">
                            </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Last Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtLName" 
                            MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" CssClass="red_new offset-md-3"
                                ControlToValidate="txtLName" Display="Dynamic" ErrorMessage="Please enter last name">
                            </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Parent Name</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPName" 
                            MaxLength="50">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" CssClass="red_new offset-md-3"
                                ControlToValidate="txtPName" Display="Dynamic" ErrorMessage="Please enter parent name">
                            </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">
                            Mobile No.</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtWork" MaxLength="20"
                             ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" CssClass="red_new offset-md-3"
                                ControlToValidate="txtwork" Display="Dynamic" ErrorMessage="Please enter mobile no">
                            </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Email</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtEmailID" MaxLength="100">
                        </asp:TextBox>
                        
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="Label2">Class</asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass" 
                            AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvClass" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label CssClass="col-sm-3 col-form-label pl-0" runat="server" ID="lblCity">Programme/Combination/Stream
                        </asp:Label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection"
                            >
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label11">Gender<span class="red_new"></span></asp:Label>
                        <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0" 
                            RepeatDirection="Horizontal" runat="server" ID="rblGender" RepeatLayout="Flow">
                            <asp:ListItem  class="asp-listItem col-form-label mr-3" Value="m">Male</asp:ListItem>
                            <asp:ListItem class="asp-listItem col-form-label" Value="f">Female
                            </asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    </div>
                     <div class="table-responsive mb-1">
                        <asp:GridView ID="gvComments"
                            Style="border-width: 0px; border-style: None; width: 100%; border-collapse: collapse;" runat="server" AutoGenerateColumns="false" Width="100%"
                            EmptyDataText="No comments exists" GridLines="None" AllowPaging="true" PageSize="10" OnPageIndexChanging="gvComments_PageIndexChanging"
                            ShowHeader="false">
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Commentd On" ItemStyle-VerticalAlign="Top" ItemStyle-Width="60px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCD" runat="server">
                                            <br />Commented By:<br />Commented
                                            Date:<br />Comment:<br />
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Commented By"
                                    ItemStyle-VerticalAlign="Top"
                                    ItemStyle-Width="200px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCB" runat="server"><br />
                                            <%# Eval("UserName") %><br />
                                                <%# Eval("C_Date") %><br />
                                                    <%# Eval("Comment") %><br />
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-sm-3 col-form-label pl-0">Add Comments <span
                                class="red">*</span></label>
                        <asp:TextBox CssClass="form-control" runat="server"
                            TextMode="MultiLine" Rows="5" Columns="30" ID="txtComments">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvComments"
                            CssClass="red_new offset-md-3" ControlToValidate="txtComments" Display="Dynamic"
                            ErrorMessage="Please enter comments">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-12 d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnUpdate" runat="server" OnClientClick="return confirm('Are you sure you want to update?');"
                            Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            Visible="false" CausesValidation="false" Text="Return" OnClick="btnCancel_Click" />
                    </div>
                
               
            </div>
        </div>


</asp:Content>