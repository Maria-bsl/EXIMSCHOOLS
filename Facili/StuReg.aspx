<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuReg.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.StuReg" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>
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
            $('input[type="file"]').change(function (e) {
                var fileName = e.target.files[0].name;
                $('.custom-file-label').html(fileName);
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
                    <li class="breadcrumb-item">Student Registration Upload</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Student Registration Upload</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">University/College/School
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci" MaxLength="200"
                                Enabled="false"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                ControlToValidate="txtFaci" Display="Dynamic" ErrorMessage="Please enter University/College/School name">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Academic<span
                                    class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                ErrorMessage="Please select academic">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblDesig">Medium<span
                                    class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlMedium">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlMedium" Display="Dynamic" ErrorMessage="Please select medium">
                            </asp:RequiredFieldValidator>
                        </div>

                        <%--<div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Class<span
                                    class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCity">Programme/Combination/Stream<span
                                    class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                            </asp:RequiredFieldValidator>
                        </div>--%>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Upload
                                File<span class="red_new">*</span></asp:Label>
                            <div class="custom-file col-md-9">
                                <asp:FileUpload runat="server" ID="fuExcel" CssClass="custom-file-input"
                                    ToolTip="Supported file name should not contain Special Characters, Supported file formats are xls,xlsx,xlsm,xlsb" />
                                <label class="custom-file-label">Upload</label>
                            </div>
                            <small class="form-text text-muted offset-md-3">Only Excel files are supported.</small>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                CssClass="red_new offset-md-3" ControlToValidate="fuExcel" Display="Dynamic"
                                ErrorMessage="Please select excel file">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                                CssClass="red_new offset-md-3"
                                ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx|.XLS|.XLSX|.xlsm|.XLSM|.xlsb|.XLSB)$"
                                ControlToValidate="fuExcel" Display="Dynamic"
                                ErrorMessage="Supported file name should not contain Special Characters, Supported file formats are xls,xlsx,xlsm,xlsb">
                            </asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cvExcel" runat="server" ControlToValidate="fuExcel"
                                CssClass="red_new offset-md-3"
                                ErrorMessage="File size should not be greater than 20 MB." Display="Dynamic"
                                OnServerValidate="cvExcel_ServerValidate"></asp:CustomValidator>
                        </div>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Upload"
                            OnClick="btnReg_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            Text="Cancel" />
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                            OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
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