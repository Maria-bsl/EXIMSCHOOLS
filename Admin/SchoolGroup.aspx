<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchoolGroup.aspx.cs" MasterPageFile="~/Head_Admin.Master" Inherits="PresentationLayer.Admin.SchoolGroup" %>

<%@ MasterType VirtualPath="~/Head_Admin.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table[id*=gvDept] tr{
            cursor: pointer;
        }
        .select2-container--default .select2-selection--multiple {
            <%-- padding: 0.375rem 0.75rem !important; --%>
            padding: 0.375rem 0.75rem 0 0.75rem !important;
        }
    </style>
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
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnDelete" />
            </Triggers>
        </asp:UpdatePanel>

        <ContentTemplate>


            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="txKulA">Home</a></li>
                    <li class="breadcrumb-item">School Groups</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">School Groups</h5>

                    <div class="row">
                         <div class="form-group col-sm-12 col-md-12 col-lg-6 mx-0 format-85">
                            <div class="w-100 d-flex flex-column">
                                <label class="col-form-label pl-0">School Group</label>
                                <asp:TextBox placeholder="Enter group name" CssClass="form-control" runat="server" ID="txtGroup">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    CssClass="red_new" ControlToValidate="txtGroup" Display="Dynamic"
                                    ErrorMessage="Please enter school group">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group col-sm-12 col-md-12 col-lg-6 mx-0 format-85">
                            <div class="w-100 d-flex flex-column">
                                <label class="col-form-label pl-0">School</label>
                                <asp:ListBox CssClass="form-control select2-listbox w-100" runat="server" ID="lbSchool" SelectionMode="Multiple">
                                </asp:ListBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new" ControlToValidate="lbSchool" Display="Dynamic"
                                    ErrorMessage="Please select school">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group col-sm-12 col-md-9 col-lg-6 mx-0 format-85">
                            <div class="w-100 d-flex flex-column">
                                <label class="col-form-label pl-0">Status</label>
                                <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0"
                                    RepeatDirection="Horizontal" runat="server" ID="rblStatus" RepeatLayout="Flow">
                                    <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Active"
                                        Selected="True">Active
                                    </asp:ListItem>
                                    <asp:ListItem class="asp-listItem col-form-label" Value="InActive">InActive
                                    </asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3 w-100"
                                    ControlToValidate="rblStatus" Display="Dynamic"
                                    ErrorMessage="Please select region status">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server"
                                Text="Create" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" OnClick="btnUpdate_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                CausesValidation="false" Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>

                    <div class="table-responsive p-1 overflow-hidden">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%"
                            AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                            PageSize="10" OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            oncheckedchanged="rbDept_CheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="School_Group_Name" HeaderText="Group" />
                                <asp:BoundField DataField="School_Group_Mas_Sno" HeaderText="Module ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </div>


    <script>
        $(document).ready(function() {
            $('.select2-listbox').select2({
                closeOnSelect: false,
                placeholder: "Select school(s)",
                width: '100%',
                AllowClear: true
            });
        })
    </script>


</asp:Content>