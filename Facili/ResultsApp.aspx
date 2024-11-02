<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultsApp.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.ResultsApp" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(document).ready(function () {
            /*$('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });*/

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

    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Results Approve</li>
        </ol>
    </nav>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><label class="hd1">Results</label></h5>

            <div class="row">
                <div class="form-group col-md-8 row mx-0">
                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic Year
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic" 
                        Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" CssClass="red_new"
                        ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select Academic Year">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 row mx-0">
                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Teacher
                        <span class="red_new">*</span>
                    </asp:Label>
                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFull" 
                        Enabled="false">

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvFull" CssClass="red_new" InitialValue="-1"
                        ControlToValidate="ddlFull" Display="Dynamic" ErrorMessage="Please select TeacherName">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 row mx-0">
                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Class
                        <span class="red_new">*</span>
                    </asp:Label>

                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCname" 
                        Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvCname" CssClass="red_new"
                        ControlToValidate="ddlCname" Display="Dynamic" ErrorMessage="Please select Class">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 row mx-0">
                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Stream/Combination
                        <span class="red_new">*</span>
                    </asp:Label>

                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection" 
                        Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvSection" CssClass="red_new"
                        ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Stream/Combination">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 row mx-0">
                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">Subject
                        <span class="red_new">*</span>
                    </asp:Label>

                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSubject" 
                        Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvSubject" CssClass="red_new"
                        ControlToValidate="ddlSubject" Display="Dynamic" ErrorMessage="Please select Subject">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 row mx-0">
                    <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label5">Exam
                        <span class="red_new">*</span>
                    </asp:Label>

                    <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlExam" 
                        Enabled="false">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvExam" CssClass="red_new"
                        ControlToValidate="ddlExam" Display="Dynamic" ErrorMessage="Please select Exam">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="table-responsive mb-1">
                <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                    AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="True">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <HeaderStyle CssClass="HeaderDatagrid" />
                    <PagerStyle CssClass="gridViewPager" />
                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                    <Columns>
                        <asp:TemplateField HeaderText="SNo" ItemStyle-Width="1%" ItemStyle-VerticalAlign="Top"
                            HeaderStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Admission_No" ItemStyle-Width="1%" HeaderText="Admission No" />
                        <asp:BoundField DataField="Student_Full_Name" HeaderText="Student" />
                        <asp:BoundField DataField="Marks" ItemStyle-Width="1%" HeaderText="Marks" />
                        <asp:BoundField DataField="Grade_Type" ItemStyle-Width="1%" HeaderText="Grade" />
                        <asp:BoundField DataField="Remarks" ItemStyle-Width="1%" HeaderText="Remarks" />

                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                    OnClientClick="return confirm('Are you sure you want to approve');" OnClick="btnSubmit_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnReturn" runat="server" Text="Return"
                    OnClientClick="return confirm('Are you sure you want to return');" OnClick="btnReturn_Click" />

            </div>
        </div>
    </div>

</asp:Content>