<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance_ReportD.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Attendance_ReportD" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnPdf" />
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <ContentTemplate>

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Attendance Report</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Attendance Report</h5>

                <div class="row">
                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Academic
                            Year<span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvAcad" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select Year">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Class<span
                                class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select Class">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">
                            Programme/Combination/Stream<span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvSection" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>


                    <div class="form-group col-md-6 row mx-0">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Date
                            <span class="red_new">*</span></asp:Label>
                       <div class="input-group col-md-9 px-0">
                            <asp:TextBox CssClass="Displaytext form-control" ID="txtFDate" runat="server">
                            </asp:TextBox>
                            <div class="input-group-append rounded-right">
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup" ImageUrl="/images/calendar.png" height="38px" />
                            </div>
                        </div>
                        <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                            TargetControlID="txtFDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender><br />
                        <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtFDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select from date">
                        </asp:RequiredFieldValidator>
                        <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                            errormessage="The date must be less than or equal to today date"
                            CssClass="red_new offset-md-3" valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                            controltovalidate="txtFDate" type="date" Operator="LessThanEqual" />
                        

                    </div>

                  

                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="View Report"
                        OnClick="btnSubmit_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server" Text="Download PDF"
                        OnClick="btnPdf_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                        Text="Download Excel" OnClick="btnExcel_Click" />

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        ShowFooter="false" HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                        OnRowDataBound="gvRowDataBound" OnPageIndexChanging="gvDept_PageIndexChanging"
                        AllowPaging="false">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <PagerStyle CssClass="gridViewPager" />
                        <Columns>
                            <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                                HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Admission_No" HeaderText="Admission No"
                                ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                            <asp:BoundField DataField="Student_Full_Name" HeaderText="Student"
                                ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                            
                            <asp:BoundField DataField="" HeaderText="Status" ItemStyle-VerticalAlign="Top"
                                HtmlEncode="False" />
                            

                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </ContentTemplate>

</asp:Content>