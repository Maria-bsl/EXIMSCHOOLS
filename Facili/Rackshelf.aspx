<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rackshelf.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Rackshelf" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table#Grddet tbody tr {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {

            // 1.  #gvDept Table process for creating and population thead and tfoot

            var gridDept = document.querySelector('[id*=gvDept]');
            var gridViewHeader = gridDept.querySelector('.HeaderDatagrid');

            // Creating "<thead/>" and "<tfoot/>"
            var gridViewTHead = document.createElement("thead");

            // Appending table rows to the "<thead/>" and "<tfoot/>"
            gridViewTHead.append(gridViewHeader);

            // Prepending "<thead/>" and Appending "<tfoot/>" to the table
            gridDept.prepend(gridViewTHead);

            // 2.  #gvveh Table process for creating and population thead and tfoot

            var gridVehicle = document.getElementById('Grddet');
            var gridVehicleHeader = gridVehicle.querySelector('.HeaderDatagrid');

            // Creating "<thead/>" 
            var gridVehicleTHead = document.createElement("thead");

            // Appending table rows to the "<thead/>"
            gridVehicleTHead.append(gridVehicleHeader);

            // Prepending "<thead/>" to the table
            gridVehicle.prepend(gridVehicleTHead);

            $('table#Grddet>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });


            $(gridDept).DataTable({
                "responsive": true,
                "stateSave": true,
                "paging": false,
                "filter": false,
                "info": false,
                "lengthMenu": [
                    [10, 20, 30, 50, -1],
                    [10, 20, 30, 50, "All"]
                ],
                "sPaginationType": "full_numbers"
            });

            $(gridVehicle).DataTable({
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
        <asp:UpdatePanel ID="update" runat="server">
            <ContentTemplate>
                <script type="text/javascript">
                    function showProgress() {
                        if (Page_ClientValidate()) {
                            var updateProgress = $get("<%= upProgress.ClientID %>");
                            updateProgress.style.display = "block";
                        }
                    }
                </script>

                <asp:HiddenField ID="hddno" runat="server" />
                <asp:HiddenField ID="detno" runat="server" />
                <asp:HiddenField ID="libsno" Visible="true" runat="server" />


                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Rack Shelf</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Rack Shelf</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Rack
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtname" runat="server"
                                    MaxLength="100">
                                </asp:TextBox>
                                <asp:RegularExpressionValidator ID="rgvName" runat="server"
                                    CssClass="red_new offset-md-3" ControlToValidate="txtname" Display="Dynamic"
                                    ValidationExpression="[0-9A-Za-z ]*$"
                                    ErrorMessage="*Valid characters: Alphabets and Numbers." />
                                <asp:RequiredFieldValidator runat="server" ID="rfvname" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtname" Display="Dynamic" ErrorMessage="Please enter Rack Name">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Rack
                                    ID<span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtID" runat="server" MaxLength="100">
                                </asp:TextBox>
                                <%--<asp:RegularExpressionValidator ID="rgvID" runat="server" ControlToValidate="txtID" CssClass="red_new offset-md-3"  Display="Dynamic" ValidationExpression="[0-9A-Za-z ]+" ErrorMessage="only alphabets and numbers allowed"></asp:RegularExpressionValidator>--%>
                                <asp:RequiredFieldValidator runat="server" ID="rfvID" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtID" Display="Dynamic" ErrorMessage="Please enter Rack ID ">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">Location
                                    Name<span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlName"
                                    AutoPostBack="true">
                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="lblsno" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator runat="server" ID="rfvLName" CssClass="red_new offset-md-3"
                                    InitialValue="0" ControlToValidate="ddlName" Display="Dynamic"
                                    ErrorMessage="Please select Location Name">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                                <label class="col-auto col-form-label pl-0">Status<span class="red_new">*</span></label>
                                <asp:RadioButtonList RepeatLayout="Flow"
                                    CssClass="col form-check form-check-inline mx-0" RepeatDirection="Horizontal"
                                    runat="server" ID="rblStatus">
                                    <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Active"
                                        Selected="True">
                                        Active</asp:ListItem>
                                    <asp:ListItem class="asp-listItem col-form-label" Value="InActive">InActive
                                    </asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvStatus" ControlToValidate="rblStatus"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please select  status">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="false">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:BoundField DataField="Sno" HeaderText="Sno" ItemStyle-Width="1%" />
                                    <asp:TemplateField HeaderText="Shelf Number">
                                        <ItemTemplate>
                                            <asp:TextBox class="form-control" style="max-width: 300px;" ID="txtNo" runat="server">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvNo" runat="server"
                                                ControlToValidate="txtNo" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Enter Shelf Number">
                                            </asp:RequiredFieldValidator>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" Visible="false" runat="server" Width="160px">
                                            </asp:Label>

                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblnum" Visible="false" runat="server" Width="100px">
                                            </asp:Label>

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

                        <div class="form-group d-flex justify-content-end ">
                            <asp:Button ID="ButtonAdd" CssClass="btn btn-sm btn-biz_logic" runat="server"
                                Text="Add New Row" OnClick="ButtonAdd_Click" CausesValidation="false" />
                        </div>
                        <div class="form-group d-flex justify-content-end ">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnSubmit" runat="server"
                                Text="Create" OnClientClick="showProgress();" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="bnUpdate" runat="server"
                                Text="Update" Visible="false" OnClientClick="showProgress();" OnClick="bnUpdate_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                Text="Delete" OnClientClick="showProgress();" OnClick="btnDelete_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnCancel" runat="server"
                                Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="Grddet" ClientIDMode="Static" CssClass="table table-bordered mb-1 display"
                                runat="server" AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle"
                                OnPageIndexChanging="Grddet_PageIndexChanging" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" PageSize="10" ShowFooter="False">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                                OnCheckedChanged="rbDept_CheckedChanged" RepeatLayout="Flow" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Rack_Shelf_Sno">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Rack_Name" HeaderText="Rack name" />
                                    <asp:BoundField DataField="Lib_Loc_Name" HeaderText="Location Name" />
                                    <asp:BoundField DataField="Rack_Shelf_Status" HeaderText="Rack Status" />

                                    <asp:BoundField DataField="Status" HeaderText="Status" />


                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>




            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="update">
        <ProgressTemplate>
            <div
                style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <span
                    style="border-width: 0px; position: fixed; padding: 20px; background-color: #FFFFFF; font-size: 30px; left: 40%; top: 40%; border-radius: 50px;">
                    <img alt="progress" src="/Images/loader1.gif" />Loading ...</span>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </div>
</asp:Content>