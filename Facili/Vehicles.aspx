<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vehicles.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Vehicles" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table#gvveh tbody tr {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {

            // 1.  #gvDept Table process for creating and population thead and tfoot

            var gridDept = document.querySelector('[id*=gvDept]');
            var gridViewHeader = gridDept.querySelector('.HeaderDatagrid');
            var gridViewFooter = gridDept.querySelector('[id$=ButtonAdd]').parentElement.parentElement;

            // Creating "<thead/>" and "<tfoot/>"
            var gridViewTHead = document.createElement("thead");
            var gridViewTFoot = document.createElement("tfoot");

            // Appending table rows to the "<thead/>" and "<tfoot/>"
            gridViewTHead.append(gridViewHeader);
            gridViewTFoot.append(gridViewFooter);

            // Prepending "<thead/>" and Appending "<tfoot/>" to the table
            gridDept.prepend(gridViewTHead);
            gridDept.append(gridViewTFoot);

            // 2.  #gvveh Table process for creating and population thead and tfoot

            var gridVehicle = document.getElementById('gvveh');
            var gridVehicleHeader = gridVehicle.querySelector('.HeaderDatagrid');

            // Creating "<thead/>" 
            var gridVehicleTHead = document.createElement("thead");

            // Appending table rows to the "<thead/>"
            gridVehicleTHead.append(gridVehicleHeader);

            // Prepending "<thead/>" to the table
            gridVehicle.prepend(gridVehicleTHead);

            $('table#gvveh>tbody>tr').click(function () {
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
        <asp:HiddenField ID="hddvmsno" runat="server" />

        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Vehicles</li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Vehicles</h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Registration No/Plate No</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtReg" MaxLength="50">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator runat="server" ID="rfvReg" CssClass="red_new offset-md-3"
                            ControlToValidate="txtReg" Display="Dynamic" ErrorMessage="Please enter Registration No">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rgvreg" runat="server" ControlToValidate="txtreg"
                            CssClass="red_new offset-md-3" Display="Dynamic" ValidationExpression="[0-9A-Za-z]+"
                            ErrorMessage="only alphabets and numbers allowed">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Model</label>
                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtModel" MaxLength="100">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator runat="server" ID="rfvModel" CssClass="red_new offset-md-3"
                            ControlToValidate="txtModel" Display="Dynamic" ErrorMessage="Please enter Model">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rgvmodel" runat="server" ControlToValidate="txtModel"
                            CssClass="red_new offset-md-3" Display="Dynamic" ValidationExpression="[A-Za-z0-9]+"
                            ErrorMessage="only numbers and alphabets allowed">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Chasis No</label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtChasis" runat="server" MaxLength="100">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator runat="server" ID="rfvChasis" CssClass="red_new offset-md-3"
                            ControlToValidate="txtChasis" Display="Dynamic" ErrorMessage="Please enter Chasis No">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="rgvchasis" CssClass="red_new offset-md-3"
                            ControlToValidate="txtChasis" Display="Dynamic" ValidationExpression="[0-9A-Za-z]+"
                            ErrorMessage="Only Alphabets and Numbers allowed">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Manufacturer</label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtMnfctr" runat="server" MaxLength="100">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator runat="server" ID="rfvMnfctr" CssClass="red_new offset-md-3"
                            ControlToValidate="txtMnfctr" Display="Dynamic" ErrorMessage="Please enter Manufacturer">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="rgvmnf" CssClass="red_new offset-md-3"
                            ControlToValidate="txtMnfctr" Display="Dynamic" ValidationExpression="[A-Za-z]+"
                            ErrorMessage="Only Alphabets allowed"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-3 col-form-label pl-0">Purchased Date</label>
                        <div class="input-group  col-md-9 px-0">
                            <asp:TextBox class="form-control Displaytext" ID="txtDate" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <!-- <span CssClass="input-group-text" id="iPopup"> -->
                                <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                    ID="iPopup" ImageUrl="/images/calendar.png" Height="38px" />
                                <!-- </span> -->
                            </div>
                        </div>
                        <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                            TargetControlID="txtDate" Format="MM/dd/yyyy">
                        </ajaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator runat="server" ID="rfvDate" ControlToValidate="txtDate"
                            Display="Dynamic" CssClass="red_new offset-md-3" ErrorMessage="Please select  Date">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-auto col-form-label pl-0">Loading Capacity</label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtload" runat="server" MaxLength="20">
                        </asp:TextBox>
                        <small class="form-text text-muted offset-md-3">The capacity should be in Kilograms</small>
                        <asp:RequiredFieldValidator runat="server" ID="rfvload" CssClass="red_new offset-md-3"
                            ControlToValidate="txtload" Display="Dynamic" ErrorMessage="Please enter Loading Capacity">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="revFE" ValidationExpression="^[0-9.]{1,21}$"
                            CssClass="red_new offset-md-3" ControlToValidate="txtload" Display="Dynamic"
                            ErrorMessage="Please enter valid loading capacity">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-md-auto col-form-label pl-0">No. of Passengers</label>
                        <asp:TextBox CssClass="col-md-9 form-control" ID="txtPass" runat="server" MaxLength="20">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                            CssClass="red_new offset-md-3" ControlToValidate="txtPass" Display="Dynamic"
                            ErrorMessage="Please enter No. of Passengers">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                            ValidationExpression="^[0-9.]{1,21}$" CssClass="red_new offset-md-3"
                            ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Please enter valid passengers">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                        <label class="col-auto col-form-label pl-0">Status:</label>
                        <asp:RadioButtonList RepeatLayout="Flow"
                            class="col form-check form-check-inline mx-0 asp-radioButtonList"
                            RepeatDirection="Horizontal" runat="server" ID="rblStatus">
                            <asp:ListItem class="asp-listItem pt-0 col-form-label mr-3" Value="Active" Selected="True">
                                Active
                            </asp:ListItem>
                            <asp:ListItem class="asp-listItem pt-0 col-form-label" Value="InActive">InActive
                            </asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvStatus" ControlToValidate="rblStatus"
                            CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please select  Status">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        OnRowDataBound="gvDept_RowDataBound" AutoGenerateColumns="False" Width="100%"
                        AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                        ShowFooter="True">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <%--<asp:BoundField  DataField="Sno" HeaderText="Sno" />--%>
                            <asp:TemplateField HeaderText="Sno">
                                <ItemTemplate>
                                    <asp:Label ID="lblsno" runat="server">
                                        <%# Container.DataItemIndex+1 %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Vehicle Diary Type">
                                <ItemTemplate>
                                    <asp:DropDownList class="form-control" ID="ddlVehType"
                                        OnSelectedIndexChanged="ddlVehType_SelectedIndexChanged" runat="server"
                                        AutoPostBack="true" width="200px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvehtype" runat="server" InitialValue="-1"
                                        ControlToValidate="ddlVehType" Display="Dynamic" CssClass="red_new"
                                        ErrorMessage="Please select vehicle type">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Vehicle_Id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbltypeid" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <div class="input-group table-date" style="min-width: 200px;">
                                        <asp:TextBox class="form-control" ID="txtStart" runat="server"></asp:TextBox>
                                        <div class="input-group-append">
                                            <asp:ImageButton CssClass="input-group-text" runat="server"
                                                CausesValidation="false" ID="imgPopup" ImageUrl="/images/calendar.png"
                                                Height="38px" />
                                        </div>
                                    </div>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Format="MM/dd/yyyy" PopupButtonID="imgPopup" TargetControlID="txtStart">
                                    </ajaxToolkit:CalendarExtender>

                                    <asp:RequiredFieldValidator ID="rfvStart" runat="server"
                                        ControlToValidate="txtStart" Display="Dynamic" CssClass="red_new"
                                        ErrorMessage="Please enter start date">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Date">
                                <ItemTemplate>
                                    <div class="input-group table-date" style="min-width: 200px;">
                                        <asp:TextBox ID="txtEnd" class="form-control" runat="server"></asp:TextBox>
                                        <div class="input-group-append">
                                            <asp:ImageButton CssClass="input-group-text" runat="server"
                                                CausesValidation="false" ID="img1Popup" ImageUrl="/images/calendar.png"
                                                Height="38px" />
                                        </div>
                                    </div>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                        Format="MM/dd/yyyy" PopupButtonID="img1Popup" TargetControlID="txtEnd">
                                    </ajaxToolkit:CalendarExtender>

                                    <asp:RequiredFieldValidator ID="rfvEnd" runat="server" ControlToValidate="txtEnd"
                                        CssClass="red_new" Display="Dynamic" ErrorMessage="Please enter end date">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Policy No">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtPolicy" runat="server" class="form-control"
                                        style="min-width: 100px;"></asp:TextBox>

                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:DropDownList class="form-control" ID="ddlstatus" width="120px" runat="server">
                                        <asp:ListItem Value="Active">Active</asp:ListItem>
                                        <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ID="rfvstatus1" runat="server"
                                        ControlToValidate="ddlstatus" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please select status">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtRemarks" runat="server" class="form-control"
                                        style="min-width: 200px;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvrmrk" runat="server"
                                        ControlToValidate="ddlstatus" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please enter remarks">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Detno" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbldtno" Width="20" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"
                                        CausesValidation="false">Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="ButtonAdd" class="btn btn-sm btn-biz_logic" runat="server"
                                        Text="Add New Row" OnClick="ButtonAdd_Click" CausesValidation="false" />
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                        OnClick="btnSubmit_Click1" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                        OnClick="btnUpdate_Click" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server" Text="Delete"
                        OnClick="btnDelete_Click" />
                    <asp:Button class="btn btn-sm btn-biz_logic ml-1" ID="BtnCancel" runat="server" Text="Cancel"
                        CausesValidation="false" OnClick="BtnCancel_Click" />
                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvveh" ClientIDMode="Static" CssClass="table table-bordered mb-1 display"
                        runat="server" AutoGenerateColumns="False" Width="100%"
                        AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                        AllowPaging="false" OnPageIndexChanging="gvveh_PageIndexChanging" ShowFooter="false">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                        OnCheckedChanged="rbDept_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Veh_Sno" HeaderText="Sno" />
                            <asp:BoundField DataField="Veh_Reg_No" HeaderText="Registration No/Plate No" />
                            <asp:BoundField DataField="Veh_Model" HeaderText="Model" />
                            <asp:BoundField DataField="Veh_Chasis_No" HeaderText="Chasis Number" />
                            <asp:BoundField DataField="Veh_Manufuaterer" HeaderText="Manufacturer" />
                            <asp:BoundField DataField="Purchased_Date" HeaderText="Purchased Date"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Veh_Status" HeaderText="Status" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />


                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>
</asp:Content>