<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="Attendant.aspx.cs" Inherits="Schools.Facili.Attendant" %>

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
                    <li class="breadcrumb-item">Attenders Details</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Attenders Details</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Attendant Name
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvdriname" CssClass="red_new offset-md-3"
                                ControlToValidate="txtname" Display="Dynamic"
                                ErrorMessage="Please enter attendant name">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Mobile Number
                            </asp:Label>
                            <div class="col-md-9 px-0  input-group">
                                <div class="input-group-prepend">
                                        <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtmob" MaxLength="9"
                                        ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                                </div>
                            </div>
                            <asp:RegularExpressionValidator ID="reMob" runat="server" ControlToValidate="txtmob"
                                Display="Dynamic" ErrorMessage="Not valid PhoneNumber" CssClass="red_new offset-md-3"
                                ValidationExpression="[0-9]{9}">
                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvrid" CssClass="red_new offset-md-3"
                                ControlToValidate="txtmob" Display="Dynamic" ErrorMessage="Please enter  mobile number">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label class="col-md-3 col-form-label pl-0" runat="server" ID="Label1"> Address
                            </asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtadd" TextMode="MultiLine"
                                runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                CssClass="red_new offset-md-3" ControlToValidate="txtmob" Display="Dynamic"
                                ErrorMessage="Please enter  address">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                            <asp:Label class="col-3 col-form-label pl-0" runat="server" ID="Label3">Status
                            </asp:Label>
                            <asp:RadioButtonList RepeatLayout="Flow"
                                CssClass="col-9 form-check form-check-inline mx-0 asp-radioButtonList" ID="rblstatus"
                                runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem class="asp-listItem col-form-label pt-0 mr-3" Text="Active" Value="0"
                                    Selected="True"></asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label pt-0" Text="InActive" Value="1">
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvrblstatus" CssClass="red_new offset-md-3"
                                ControlToValidate="rblstatus" Display="Dynamic" ErrorMessage="Please select Status">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button class="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClick="btnSubmit_Click" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnUpdate"
                                OnClick="btnUpdate_Click" Text="Update" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnDelete"
                                CausesValidation="false" OnClick="btnDelete_Click" Text="Delete" />
                            <asp:Button class="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
                        </div>
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="False" OnPageIndexChanging="gvDept_PageIndexChanging" Width="100%"
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
                                            OnCheckedChanged="rbDept_CheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Attendant_Sno" HeaderText="Sno" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Attendant_Name" HeaderText="Attendant Name" />
                                <asp:BoundField DataField="Attendant_Mobile_No" HeaderText="Attendant Mobile Number" />
                                <asp:BoundField DataField="Attendant_Address" HeaderText="Attendant Address" />
                                <asp:BoundField DataField="Attendant_Status" HeaderText="Attendant Status" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </div>
</asp:Content>