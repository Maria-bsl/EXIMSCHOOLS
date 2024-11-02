<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grade.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Grade" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id*=gvDept] tr {
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
        <asp:UpdatePanel ID="upRegister" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnDelete" />
            </Triggers>
        </asp:UpdatePanel>
        <ContentTemplate>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Score Grade</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">

                    <h5 class="card-title">Score Grade</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Score Grade Type</label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtGrade" runat="server" MaxLength="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvGtype" CssClass="red_new offset-md-3"
                                ControlToValidate="txtGrade" Display="Dynamic" ErrorMessage="Please enter GradeType">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Score Grade From</label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtGfrom" runat="server">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator ID="reGfrom" Display="Dynamic" runat="server"
                                CssClass="red_new offset-md-3" ValidationExpression="^[0-9.]+$"
                                ControlToValidate="txtGfrom" ErrorMessage="Please enter valid grade">
                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvGfrom" CssClass="red_new offset-md-3"
                                ControlToValidate="txtGfrom" Display="Dynamic" ErrorMessage="Please enter GradeFrom">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Score Grade To</label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtGto" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="reGto" Display="Dynamic" runat="server"
                                CssClass="red_new offset-md-3" ValidationExpression="^[0-9.]+$"
                                ControlToValidate="txtGto" ErrorMessage="Please enter valid grade">
                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvGto" CssClass="red_new offset-md-3"
                                ControlToValidate="txtGto" Display="Dynamic" ErrorMessage="Please enter GradeTo">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-auto col-form-label pl-0">Status:</label>
                            <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0 asp-radioButtonList"
                                RepeatDirection="Horizontal" runat="server" ID="rblStatus" RepeatLayout="Flow">
                                <asp:ListItem class="asp-listItem col-form-label pt-0 mr-3" Value="Active"
                                    Selected="True">Active</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label pt-0" Value="InActive">InActive
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvStatus" CssClass="red_new offset-md-3"
                                ControlToValidate="rblStatus" Display="Dynamic"
                                ErrorMessage="Please select sector status"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <label class="col-md-3 col-form-label pl-0">Result</label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlResult">
                                <asp:ListItem class="asp-listItem col-form-label" Value="Excellent">Excellent</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Very Good">Very Good</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Good">Good</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Average">Average</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Bad">Bad</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label" Value="Fail">Fail</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                            OnClick="btnUpdate_Click" Visible="false" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                            CausesValidation="false" OnClick="btnDelete_Click" Text="Delete" Visible="false" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                            OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            oncheckedchanged="rbDept_CheckedChanged" RepeatLayout="Flow" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Grade_Type" HeaderText="Score Grade Type" />
                                <asp:BoundField DataField="Grade_Per_From" HeaderText="Score Grade From" />
                                <asp:BoundField DataField="Grade_Per_To" HeaderText="Score Grade To" />
                                <asp:BoundField DataField="Grade_TypeSno" HeaderText="Sector ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Result" HeaderText="Result" />
                                <asp:BoundField DataField="Grade_Status" HeaderText="Status" />
                                <asp:BoundField DataField="Status" HeaderText="Progress" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>

    </div>
</asp:Content>