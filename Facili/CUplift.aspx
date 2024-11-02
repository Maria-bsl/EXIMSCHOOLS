<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CUplift.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.CUplift" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!--<script>
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
    </script>-->
    <style>
        [id*=gvDept] td {
            white-space: nowrap;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Class Uplift</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">

                <h5 class="card-title">Class Uplift</h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-150">
                        <label class="col-md-3 col-form-label">Academic:</label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvAcademic" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlAcademic" Display="Dynamic" ErrorMessage="Please select academic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-150">
                        <label class="col-md-3 col-form-label">Uplift Academic:</label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlUAcademic">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvUAcademic" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlUAcademic" Display="Dynamic" ErrorMessage="Please select academic">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-150">
                        <label class="col-md-3 col-form-label">Class:</label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvClass" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-150">
                        <label class="col-md-3 col-form-label">Uplift Class:</label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlUClass"
                            Enabled="false">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvUClass" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlUClass" Display="Dynamic" ErrorMessage="Please select class">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-150">
                        <label class="col-md-3 col-form-label">Programme/Combination/Stream:</label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCSection">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCSection" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlCSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-150">
                        <label class="col-md-3 col-form-label">Uplift Programme/Combination/Stream:</label>
                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlUSection">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvUSection" CssClass="red_new offset-md-3"
                            ControlToValidate="ddlUSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="form-group d-flex justify-content-end px-0">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Find"
                        OnClick="btnSubmit_Click" />

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        OnRowDataBound="OnRowDataBound" HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false"
                        OnRowCancelingEdit="gvDept_RowCancelingEdit" OnRowDeleting="gvDept_RowDeleting"
                        DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <PagerStyle CssClass="gridViewPager" />
                        <Columns>
                            <asp:TemplateField HeaderText="Admission">
                                <ItemTemplate>
                                    <asp:Label ID="lblAdmin" runat="server" Text='<%#Eval("Admission_No") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Sno" HeaderText="Sector ID" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Student Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblSName" runat="server" Text='<%#Eval("Student_Full_Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class">
                                <ItemTemplate>
                                    <asp:Label ID="lblCLA" runat="server" Text='<%#Eval("Class_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Programme/Combination/Stream">
                                <ItemTemplate>
                                    <asp:Label ID="lblSEC" runat="server" Text='<%#Eval("Section_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Academic">
                                <ItemTemplate>
                                    <asp:Label ID="lblACA" runat="server" Text='<%#Eval("Acad_Year") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Uplift Class">
                                <ItemTemplate>
                                    <asp:DropDownList class="form-control" runat="server" ID="ddlUCLA"
                                        style="min-width: 200px;">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvUCLA"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlUCLA" Display="Dynamic"
                                        ErrorMessage="Please select class"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Uplift Academic">
                                <ItemTemplate>
                                    <asp:DropDownList class="form-control" runat="server" ID="ddlUACA"
                                        style="min-width: 200px;">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvUACA"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlUACA" Display="Dynamic"
                                        ErrorMessage="Please select academic"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Uplift Programme/Combination/Stream">
                                <ItemTemplate>
                                    <asp:DropDownList class="form-control" runat="server" ID="ddlUSEC"
                                        style="min-width: 200px;">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvUSEC"
                                        CssClass="red_new offset-md-3" ControlToValidate="ddlUSEC" Display="Dynamic"
                                        ErrorMessage="Please select Programme/Combination/Stream"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ShowEditButton="false" />
                            <asp:CommandField ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-group d-flex justify-content-end px-0">
                    <asp:Button CssClass=" btn
                    btn-sm btn-biz_logic" ID="lnkView" runat="server" Visible="false" Text="Submit"
                        OnClick="lnkView_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="lnkView1" runat="server" Visible="false"
                        Text="Cancel" OnClick="lnkView1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>