<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Routes.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Routes" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table#grvroute tbody tr {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {

            // 1.  #gvDept Table process for creating and population thead and tfoot

            var gridDept = document.querySelector('[id*=gvDept]');
            var gridViewHeader = gridDept.querySelector('.HeaderDatagrid');
            // var gridViewFooter = gridDept.querySelector('[id*=ButtonAdd]').parentElement.parentElement;

            // Creating "<thead/>" and "<tfoot/>"
            var gridViewTHead = document.createElement("thead");
            // var gridViewTFoot = document.createElement("tfoot");

            // Appending table rows to the "<thead/>" and "<tfoot/>"
            gridViewTHead.append(gridViewHeader);
            // gridViewTFoot.append(gridViewFooter);

            // Prepending "<thead/>" and Appending "<tfoot/>" to the table
            gridDept.prepend(gridViewTHead);
            // gridDept.append(gridViewTFoot);

            // 2.  #gvveh Table process for creating and population thead and tfoot

            var gridRoute = document.getElementById('grvroute');
            var gridRouteHeader = gridRoute.querySelector('.HeaderDatagrid');

            // Creating "<thead/>" 
            var gridRouteTHead = document.createElement("thead");

            // Appending table rows to the "<thead/>"
            gridRouteTHead.append(gridRouteHeader);

            // Prepending "<thead/>" to the table
            gridRoute.prepend(gridRouteTHead);

            $('table#grvroute>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });


            $(gridDept).DataTable({
                "responsive": true,
                "stateSave": true,
                "paging": false,
                // "ordering": false,
                "info": false,
                "filter": false,
                "lengthMenu": [
                    [10, 20, 30, 50, -1],
                    [10, 20, 30, 50, "All"]
                ],
                "sPaginationType": "full_numbers"
            });

            $(gridRoute).DataTable({
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
            <ContentTemplate>
                <asp:HiddenField ID="hddno" runat="server" />

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Routes</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Routes</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-110">
                                <label class="col-md-3 col-form-label pl-0">Route ID<span
                                        class="red_new">*</span></label>
                                <asp:TextBox class="col-md-9 form-control" runat="server" ID="txtID" MaxLength="100">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvID" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtID" Display="Dynamic" ErrorMessage="Please enter Route ID">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rgvreg" runat="server" ControlToValidate="txtID"
                                    CssClass="red_new offset-md-3" Display="Dynamic" ValidationExpression="[0-9A-Za-z]+"
                                    ErrorMessage="only alphabets and numbers allowed">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-110">
                                <label class="col-md-3 col-form-label pl-0">Route Name<span
                                        class="red_new">*</span></label>
                                <asp:TextBox class="col-md-9 form-control" runat="server" ID="txtRoute" MaxLength="200">
                                </asp:TextBox>

                                <asp:RegularExpressionValidator ID="rgvRoute" runat="server"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtRoute" Display="Dynamic"
                                    ValidationExpression="[a-zA-Z ]*$"
                                    ErrorMessage="*Valid characters: Alphabets and space." />
                                <asp:RequiredFieldValidator runat="server" ID="rfvRoute" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtRoute" Display="Dynamic"
                                    ErrorMessage="Please enter Route Name">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-110">
                                <label class="col-auto col-form-label pl-0">Status<span class="red_new">*</span></label>
                                <asp:RadioButtonList RepeatLayout="Flow"
                                    class="col form-check form-check-inline mx-0 asp-radioButtonList"
                                    RepeatDirection="Horizontal" runat="server" ID="rblStatus">
                                    <asp:ListItem class="asp-listItem pt-0 col-form-label mr-3" Value="Active"
                                        Selected="True">Active
                                    </asp:ListItem>
                                    <asp:ListItem class="asp-listItem pt-0 col-form-label" Value="InActive">InActive
                                    </asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvStatus" ControlToValidate="rblStatus"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please select  Status">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="false" OnRowDeleting="gvDept_RowDeleting">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:BoundField DataField="Sno" HeaderText="Sno" ItemStyle-Width="1%" />
                                    <asp:TemplateField HeaderText="Area Name">
                                        <ItemTemplate>
                                            <asp:TextBox style="max-width: 350px;" ID="txtArea" runat="server"
                                                class="form-control">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvArea" runat="server"
                                                ControlToValidate="txtArea" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Enter Area Name">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Det sno" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldetsno" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rsno" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRsno" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" Visible="false" ItemStyle-Width="1%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbldelte" runat="server" CommandName="delete"
                                                Text="Delete">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="1%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"
                                                CausesValidation="false">
                                                Remove</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button ID="ButtonAdd" class="btn btn-sm btn-biz_logic" runat="server"
                                Text="Add New Row" CausesValidation="false" OnClick="ButtonAdd_Click" />
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClick="btnSubmit_Click" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" OnClick="btnUpdate_Click" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnCancel" runat="server"
                                Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                        </div>
                        <div class="table-responsive mb-1">
                            <asp:GridView ID="grvroute" ClientIDMode="Static" class="table table-bordered"
                                runat="server" AutoGenerateColumns="False"
                                OnPageIndexChanging="gvDept_PageIndexChanging" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="false">
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
                                    <asp:BoundField DataField="Route_Mas_Sno" HeaderText="Sno" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Route_ID" HeaderText="Route ID" />
                                    <asp:BoundField DataField="Route_Name" HeaderText="Route Name" />
                                    <asp:BoundField DataField="Route_Status" HeaderText="Route Status" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>