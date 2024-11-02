<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" MasterPageFile="~/Head_Teach.Master" Inherits="Schools.Teach.Results" %>

<%@ MasterType VirtualPath="~/Head_Teach.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Results</li>
        </ol>
    </nav>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Results</h5>
            <div class="row">
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                    <asp:Label CssClass="col-sm-4 col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                        Year
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-sm-8 col-md-9 form-control" runat="server" ID="ddlAcademic">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvAcademic"
                        CssClass="red_new offset-sm-4 offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                        ErrorMessage="Please select Academic Year">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                    <asp:Label CssClass="col-sm-4 col-md-3 col-form-label pl-0" runat="server" ID="Label1">Class
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-sm-8 col-md-9 form-control" runat="server" ID="ddlCname">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new offset-sm-4 offset-md-3"
                        ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                    <asp:Label CssClass="col-sm-4 col-md-3 col-form-label pl-0" runat="server" ID="Label3">Programme/Combination/Stream
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-sm-8 col-md-9 form-control" runat="server" ID="ddlSection">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvSection"
                        CssClass="red_new offset-sm-4 offset-md-3" ControlToValidate="ddlSection" Display="Dynamic"
                        ErrorMessage="Please select Programme/Combination/Stream">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                    <asp:Label CssClass="col-sm-4 col-md-3 col-form-label pl-0" runat="server" ID="Label4">Subject
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-sm-8 col-md-9 form-control" runat="server" ID="ddlSubject">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvSubject"
                        CssClass="red_new offset-sm-4 offset-md-3" ControlToValidate="ddlSubject" Display="Dynamic"
                        ErrorMessage="Please select Subject">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                    <asp:Label CssClass="col-sm-4 col-md-3 col-form-label pl-0" runat="server" ID="Label5">Exam Type
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-sm-8 col-md-9 form-control" runat="server" ID="ddlExam">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvExam" CssClass="red_new offset-sm-4 offset-md-3"
                        ControlToValidate="ddlExam" Display="Dynamic" ErrorMessage="Please select Exam">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-12 col-md-9 col-lg-12 d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" runat="server" ID="btnStu" Text="Display Students"
                        OnClick="btnStu_Click" />
                </div>
            </div>

            <hr>

            <div class="row">
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                    <asp:Label CssClass="col-auto col-form-label pl-0" runat="server" ID="Label2">Upload
                        File <span class="red_new">*</span></asp:Label>
                    <div class="custom-file">
                        <asp:FileUpload CssClass="custom-file-input" runat="server" ID="fuExcel"
                            ToolTip="Supported file name should not contain Special Characters, Supported file formats are xls,xlsx,xlsm,xlsb" />
                        <label for="my-input" class="custom-file-label">Upload
                            Excel File</label>
                    </div>
                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                        CssClass="red_new offset-sm-4 offset-md-3"
                        ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx|.XLS|.XLSX|.xlsm|.XLSM|.xlsb|.XLSB)$"
                        ControlToValidate="fuExcel" Display="Dynamic"
                        ErrorMessage="Supported file name should not contain Special Characters, Supported file formats are xls,xlsx,xlsm,xlsb">
                    </asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cvExcel" runat="server" ControlToValidate="fuExcel"
                        CssClass="red_new offset-sm-4 offset-md-3"
                        ErrorMessage="File size should not be greater than 20 MB." Display="Dynamic"
                        OnServerValidate="cvExcel_ServerValidate"></asp:CustomValidator>
                </div>
                <div class="form-group col-auto row mx-0">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server" Text="Upload"
                        OnClick="btnReg_Click" />
                </div>
            </div>

            <div class="table-responsive mb-1">
                <asp:GridView ID="gvDept1" ClientIDMode="static" CssClass="table table-bordered mb-1 display"
                    runat="server" AutoGenerateColumns="false" Width="100%"
                    AlternatingRowStyle-CssClass="AlternateItemStyle" ShowFooter="false"
                    HeaderStyle-CssClass="HeaderDatagrid" Visible="false" AllowPaging="false">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <PagerStyle CssClass="gridViewPager" />
                    <Columns>
                        <asp:TemplateField HeaderText="SNo" ItemStyle-Width="2%" ItemStyle-VerticalAlign="Top"
                            HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Admission_No" HeaderText="Admission No" ItemStyle-VerticalAlign="Top"
                            HtmlEncode="False" />
                        <asp:BoundField DataField="Student_Full_Name" HeaderText="Student Name"
                            ItemStyle-VerticalAlign="Top" HtmlEncode="False" />
                        <asp:BoundField DataField="" HeaderText="Marks" ItemStyle-VerticalAlign="Top"
                            HtmlEncode="False" />
                        <asp:BoundField DataField="" HeaderText="Remarks" ItemStyle-VerticalAlign="Top"
                            HtmlEncode="False" />
                    </Columns>

                </asp:GridView>
            </div>

            <div class="table-responsive mb-1">
                <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                    AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="false">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <HeaderStyle CssClass="HeaderDatagrid" />
                    <PagerStyle CssClass="gridViewPager" />
                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                    <Columns>
                        <asp:BoundField DataField="Sno" HeaderText="Sno" />
                        <asp:TemplateField HeaderText="Admission No">
                            <ItemTemplate>
                                <asp:TextBox CssClass="form-control" ID="ddlAdmission" runat="server" Enabled="false">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAdmission" runat="server"
                                    ControlToValidate="ddlAdmission" CssClass="red_new offset-sm-4 offset-md-3"
                                    Display="Dynamic" ErrorMessage="Please Select Admission No">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student FullName">
                            <ItemTemplate>
                                <asp:TextBox CssClass="form-control" ID="ddlStuName" runat="server" Enabled="false">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvStuname" runat="server"
                                    ControlToValidate="ddlStuName" CssClass="red_new offset-sm-4 offset-md-3"
                                    Display="Dynamic" ErrorMessage="Please Select Student Name">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marks">
                            <ItemTemplate>
                                <asp:TextBox CssClass="form-control" ID="txtMarks" runat="server" MaxLength="5"
                                    Width="100px">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvmarks" runat="server" ControlToValidate="txtMarks"
                                    CssClass="red_new offset-sm-4 offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please Enter Marks">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revMarks"
                                    ValidationExpression="^[0-9.]{1,3}$" CssClass="red_new offset-sm-4 offset-md-3"
                                    ControlToValidate="txtMarks" Display="Dynamic"
                                    ErrorMessage="Please enter valid marks">
                                </asp:RegularExpressionValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remarks">
                            <ItemTemplate>
                                <asp:TextBox CssClass="form-control" ID="txtRemarks" runat="server" MaxLength="100"
                                    Width="100px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Submit"
                    Visible="false" OnClick="btnSubmit_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnDS" Text="Download Students"
                    OnClick="btnDS_Click" />
            </div>
            <div class="table-responsive mb-1">
               <%-- <asp:GridView ID="gvRes" CssClass="table table-bordered mb-1 display" runat="server"
                    AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="True">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <HeaderStyle CssClass="HeaderDatagrid" />
                    <PagerStyle CssClass="gridViewPager" />
                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                    oncheckedchanged="rbDept_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Result_Sno" HeaderText="sno" ShowHeader="false">
                            <ItemStyle CssClass="hide" />
                            <HeaderStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Admission_No" ItemStyle-Width="1%" HeaderText="Admission No" />
                        <asp:BoundField DataField="Student_Full_Name" HeaderText="Student" />
                        <asp:BoundField DataField="Marks" ItemStyle-Width="1%" HeaderText="Marks" />
                        <asp:BoundField DataField="Grade_Type" ItemStyle-Width="1%" HeaderText="Grade" />
                        <asp:BoundField DataField="Remarks" ItemStyle-Width="1%" HeaderText="Remarks" />

                    </Columns>
                </asp:GridView>--%>
            </div>
        </div>
    </div>

</asp:Content>