<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuRegInd.aspx.cs" MasterPageFile="~/Head_Teach.Master" Inherits="PresentationLayer.Teach.StuRegInd" %>
<%@ MasterType VirtualPath="~/Head_Teach.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(document).ready(function () {
            $('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=gvDept]').prepend($("<thead></thead>").append($(this).find("tr:first")))
                .DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "lengthMenu": [
                        [10, 20, 30, 50, -1],
                        [10, 20, 30, 50, "All"]
                    ],
                    "sPaginationType": "full_numbers"
                });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegistration" runat="server">
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Student Registration Individual</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">

                    <h5 class="card-title">Student Registration Individual</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">University/College/School
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci" MaxLength="200"
                                Enabled="false"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                ControlToValidate="txtFaci" Display="Dynamic" ErrorMessage="Please enter University/College/School name">
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
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">
                                Medium<span class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlMedium">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlMedium" Display="Dynamic" ErrorMessage="Please select medium">
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
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCity">
                                Programme/Combination/Stream<span class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Admission
                                No<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtADN" MaxLength="200">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                CssClass="red_new offset-md-3" ControlToValidate="txtADN" Display="Dynamic"
                                ErrorMessage="Please enter admission no">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Admission
                                Date<span class="red_new">*</span></asp:Label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="Displaytext form-control" ID="txtFDate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup" ImageUrl="/images/calendar.png" height="38" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate"
                                Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select admission date">
                            </asp:RequiredFieldValidator>
                            <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                errormessage="The date must be less than equal to today date"
                                CssClass="red_new offset-md-3"
                                valuetocompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFDate"
                                type="date" Operator="LessThanEqual" />
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">First
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFN" MaxLength="200">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                CssClass="red_new offset-md-3" ControlToValidate="txtFN" Display="Dynamic"
                                ErrorMessage="Please enter first name">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label5">Middle
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtMN" MaxLength="200">
                            </asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label6">Last
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtLN" MaxLength="200">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5"
                                CssClass="red_new offset-md-3" ControlToValidate="txtLN" Display="Dynamic"
                                ErrorMessage="Please enter last name">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label7">Roll
                                No<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRoll" MaxLength="200">
                            </asp:TextBox>
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
                                    <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtPM" MaxLength="9"
                                    ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
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
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtPE" MaxLength="200">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtPE"
                                CssClass="red_new offset-md-3" ErrorMessage="Please enter the valid Email ID"
                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label11">Gender<span class="red_new">*</span></asp:Label>
                            <asp:RadioButtonList
                                CssClass="col form-check form-check-inline mx-0"
                                RepeatDirection="Horizontal" runat="server" ID="rblGender" RepeatLayout="Flow">
                                <asp:ListItem  class="asp-listItem col-form-label mr-3" Value="m">Male</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="f">Female
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" CssClass="red_new offset-md-3"
                                ControlToValidate="rblGender" Display="Dynamic"
                                ErrorMessage="Please select gender"></asp:RequiredFieldValidator>
                        </div>
                    </div>


                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Submit"
                            OnClick="btnReg_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" CausesValidation="false" OnClick="btnCancel_Click"
                            Text="Cancel" />
                    </div>

                    <div class="table-responsive mb-1">
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
                                <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream" />
                                <asp:BoundField DataField="Roll_No" HeaderText="Roll No" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnReg" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>