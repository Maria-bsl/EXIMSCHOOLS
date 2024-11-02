<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results_M_Report.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Results_M_Report" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upRegister" runat="server">
        <ContentTemplate>
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Results Report</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Results Report</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-125">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Academic
                                Year<span class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator runat="server" ID="rfvAcad" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select Year">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-125">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Class<span
                                    class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select Class">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-125">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Programme/Combination/Stream<span
                                    class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSection" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-125">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Exam <span
                                    class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlExam">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlExam" Display="Dynamic"
                                ErrorMessage="Please select Exam">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-125">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label5">Student
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlStu">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlStu" Display="Dynamic"
                                ErrorMessage="Please select student">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="View Report"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnPdf" runat="server"
                            Text="Download PDF" OnClick="btnPdf_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnExcel" runat="server"
                            Text="Download Excel" OnClick="btnExcel_Click" />

                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="true"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" OnRowDataBound="gvRowDataBound"
                            OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />

                        </asp:GridView>

                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnPdf" />
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>