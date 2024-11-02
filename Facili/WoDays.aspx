<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WoDays.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.WoDays" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        table[id*=gvRes] tr {
            cursor: pointer;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('table[id*=gvRes]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            //$('table[id*=gvRes]').prepend($("<thead></thead>").append($(this).find("tr:first")))
            //    .DataTable({
            //        "responsive": true,
            //        "stateSave": true,
            //        "lengthMenu": [
            //            [10, 20, 30, 50, -1],
            //            [10, 20, 30, 50, "All"]
            //        ],
            //        "sPaginationType": "full_numbers"
            //    });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Working Days</li>
        </ol>
    </nav>
     <div class="card">
        <div class="card-body">
            <h5 class="card-title">Working Days</h5>
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
               
            </div>

            <hr>


           

            <div class="table-responsive mb-1">
                <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                    AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" ShowFooter="false">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <HeaderStyle CssClass="HeaderDatagrid" />
                    <PagerStyle CssClass="gridViewPager" />
                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                    <Columns>
                        <asp:BoundField DataField="Sno" HeaderText="Sno" />
                        <asp:TemplateField HeaderText="Month">
                            <ItemTemplate>
                                <asp:TextBox CssClass="form-control" ID="txtMonth" runat="server" Enabled="false">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAdmission" runat="server"
                                    ControlToValidate="txtMonth" CssClass="red_new offset-sm-4 offset-md-3"
                                    Display="Dynamic" ErrorMessage="Please enter month name">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Days">
                            <ItemTemplate>
                                <asp:TextBox CssClass="form-control" ID="txtDays" runat="server" MaxLength="5"
                                    Width="100px">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvmarks" runat="server" ControlToValidate="txtDays"
                                    CssClass="red_new offset-sm-4 offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please Enter Days">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revMarks"
                                    ValidationExpression="^[0-9.]{1,2}$" CssClass="red_new offset-sm-4 offset-md-3"
                                    ControlToValidate="txtDays" Display="Dynamic"
                                    ErrorMessage="Please enter valid days">
                                </asp:RegularExpressionValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Submit"
                    Visible="false" OnClick="btnSubmit_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                            OnClick="btnUpdate_Click" Visible="true" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                            OnClientClick="return confirmCheckIn(this,'Are you sure you want to delete?');"
                            CausesValidation="false" Text="Delete" OnClick="btnDelete_Click" Visible="false" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <div class="table-responsive mb-1">
               <asp:GridView ID="gvRes" CssClass="table table-bordered mb-1 display" runat="server"
                    AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" OnPageIndexChanging="gvRes_PageIndexChanging" PageSize="10" AllowPaging="true" >
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
                        <asp:BoundField DataField="Month_Work_Days_Sno" HeaderText="sno" ShowHeader="false">
                            <ItemStyle CssClass="hide" />
                            <HeaderStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Academic_Sno" HeaderText="sno" ShowHeader="false">
                            <ItemStyle CssClass="hide" />
                            <HeaderStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Acad_Year" ItemStyle-Width="1%" HeaderText="Academic" />
                       

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>