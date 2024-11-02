<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vehicle_diary_master.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Vehicle_diary_master" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table tbody tr {
            cursor: pointer;
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
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Vehicle Diary Type</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Vehicle Diary Type</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">Vehicle Diary Type</label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtveh" MaxLength="200">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator ID="rgvveh" runat="server" CssClass="red_new offset-md-3"
                                ControlToValidate="txtveh" Display="Dynamic" ValidationExpression="[a-zA-Z0-9 ]*$"
                                ErrorMessage="*only alphabets and numbers allowed" />
                            <asp:RequiredFieldValidator runat="server" ID="rfvveh" CssClass="red_new offset-md-3"
                                ControlToValidate="txtveh" Display="Dynamic" ErrorMessage="Please enter Vehicle Type">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <label class="col-auto col-form-label pl-0">Status</label>
                            <asp:RadioButtonList RepeatLayout="Flow"
                                CssClass="col form-check form-check-inline mx-0 asp-radioButtonList"
                                RepeatDirection="Horizontal" runat="server" ID="rblStatus">
                                <asp:ListItem class="asp-listItem pt-0 col-form-label mr-3" Value="Active"
                                    Selected="True">Active
                                </asp:ListItem>
                                <asp:ListItem class="asp-listItem pt-0 col-form-label" Value="InActive">InActive
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRegion" CssClass="red_new offset-md-3"
                                ControlToValidate="rblStatus" Display="Dynamic"
                                ErrorMessage="Please select sector status">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClick="btnSubmit_Click" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" Visible="false" OnClick="btnUpdate_Click" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                CausesValidation="false" Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" AllowPaging="false"
                            OnPageIndexChanging="gvDept_PageIndexChanging">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            OnCheckedChanged="rbDept_CheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Veh_Dailry_Type" HeaderText="Vehicle Diary Type" />
                                <asp:BoundField DataField="Veh_D_Mas_Sno" HeaderText="Sector ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Veh_Dailry_Status" HeaderText="Status" />
                                <asp:BoundField DataField="Status" HeaderText="Progress" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </div>
</asp:Content>