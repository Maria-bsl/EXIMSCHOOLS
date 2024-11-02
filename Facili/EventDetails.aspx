<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.EventDetails" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <div>
        <%--    <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate> --%>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a
                        href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Event Details</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Event Details</h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0" for="my-input">Event Date
                            <span class="red_new">*</span>
                        </label>
                        <div class="input-group col-md-9 px-0">
                            <asp:TextBox ID="txtEDate" runat="server" CssClass="Displaytext form-control"
                                Width="150">
                            </asp:TextBox>
                            <div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup" ImageUrl="/images/calendar.png" height="38px"  />
                            </div>
                            <br>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="iPopup"
                                TargetControlID="txtEDate" Format="MM/dd/yyyy">
                            </ajaxToolkit:CalendarExtender><br />
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                ControlToValidate="txtEDate" Display="Dynamic" CssClass="red_new offset-md-3"
                                ErrorMessage="Please select Event Date"></asp:RequiredFieldValidator>
                            <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                errormessage="The date must be less than today date" CssClass="red_new offset-md-3"
                                valuetocompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtEDate"
                                type="date" Operator="GreaterThanEqual" />
                        </div>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Event Off Date<span class="red_new">*</span></label>
                        <div class="input-group col-md-9 px-0">
                            <asp:TextBox ID="txtODate" runat="server" CssClass="Displaytext form-control"
                                Width="150">
                            </asp:TextBox>
                            <div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup1" ImageUrl="/images/calendar.png" height="38px"  />
                            </div>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="iPopup1"
                                TargetControlID="txtODate" Format="MM/dd/yyyy">
                            </ajaxToolkit:CalendarExtender><br />
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                ControlToValidate="txtODate" Display="Dynamic" CssClass="red_new offset-md-3"
                                ErrorMessage="Please select Event Off Date"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpVal" ControlToCompare="txtEDate" ControlToValidate="txtODate"
                                Display="Dynamic" CssClass="red_new offset-md-3" Type="Date" Operator="GreaterThan"
                                ErrorMessage="Event Off Date should be greater than Event Date" runat="server">
                            </asp:CompareValidator>
                        </div>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Event Time</label>
                        <asp:TextBox CssClass="form-control col-md-9" ID="txtTime" runat="server" htmlencode="false"
                            MaxLength="5" onkeypress="formatTime(this)" DataFormatString="{0:hh:mm}"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rgvatime" runat="server" CssClass="red_new offset-md-3"
                            ErrorMessage="please enter valid time" Display="Dynamic" ControlToValidate="txtTime"
                            ValidationExpression="^(?:[01]?[0-9]|2[0-3]):[0-5][0-9]$">
                        </asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">

                        <label class="col-md-3 col-form-label pl-0">Event Subject <span class="red_new">*</span></label>
                        <asp:TextBox CssClass="form-control col-md-9" ID="txtSubject" runat="server" MaxLength="100">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvMob" CssClass="red_new offset-md-3"
                            ControlToValidate="txtSubject" Display="Dynamic" ErrorMessage="Please enter Event Subject">
                        </asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">

                        <label class="col-md-3 col-form-label pl-0">Event Location</label>
                        <asp:TextBox CssClass="form-control col-md-9" ID="txtLoc" runat="server" MaxLength="200">
                        </asp:TextBox>

                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">

                        <label class="col-md-3 col-form-label pl-0">Event Description</label>
                        <asp:TextBox CssClass="form-control col-md-9" ID="txtDesc" runat="server" MaxLength="200"
                            TextMode="MultiLine" ></asp:TextBox>
                        

                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">

                        <label class="col-md-3 col-form-label pl-0">Academic Year<span class="red_new"></span></label>
                        <asp:DropDownList CssClass="form-control col-md-9" runat="server" ID="ddlAcad">
                        </asp:DropDownList>

                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">

                        <label class="col-md-3 col-form-label pl-0">Class<span class="red_new"></span></label>
                        <asp:DropDownList CssClass="form-control col-md-9" runat="server" ID="ddlClass">
                        </asp:DropDownList>

                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">

                        <label class="col-md-3 col-form-label pl-0">Programme/Combination/Stream<span class="red_new"></span></label>
                        <asp:DropDownList CssClass="form-control col-md-9" runat="server" ID="ddlSection" Width="190">
                        </asp:DropDownList>

                    </div>

                    <div class="form-group col-12 d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                            OnClick="btnSubmit_Click" />

                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                            OnClick="btnUpdate_Click" Visible="false" />

                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                            CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete?');" OnClick="btnDelete_Click" Text="Delete" Visible="false" />

                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
                    </div>

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                        OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="true">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <PagerStyle CssClass="gridViewPager" />
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                        oncheckedchanged="rbDept_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Event_Date" HeaderText="Event Date"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Event_Off_Date" HeaderText="Event Off Date"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Event_Sno" HeaderText="Sector ID" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Event_Subject" HeaderText="Event Subject" />
                            <asp:BoundField DataField="Acad_Year" HeaderText="Academic Year" />
                            <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                            <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream" />
                            <asp:BoundField DataField="Status" HeaderText="Progress" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    
    </div>
</asp:Content>