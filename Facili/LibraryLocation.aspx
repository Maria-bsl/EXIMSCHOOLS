<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibraryLocation.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.LibraryLocation" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 12px;
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
        <asp:UpdatePanel ID="update" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnDelete" />
            </Triggers>
        </asp:UpdatePanel>
        <ContentTemplate>
            <script type="text/javascript">
                function showProgress() {
                    if (Page_ClientValidate()) {
                        var updateProgress = $get("<%= upProgress.ClientID %>");
                        updateProgress.style.display = "block";
                    }
                }
            </script>


            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Library Location</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Library Location</h5>

                    <div class="row ">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Location ID<span
                                    class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtID" runat="server" MaxLength="100">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator ID="rgvID" runat="server" ControlToValidate="txtID"
                                CssClass="red_new offset-md-3" Display="Dynamic" ValidationExpression="[0-9A-Za-z ]+"
                                ErrorMessage="only alphabets and numbers allowed">
                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvID" CssClass="red_new offset-md-3"
                                ControlToValidate="txtID" Display="Dynamic" ErrorMessage="Please enter Location ID ">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Location Name<span
                                    class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtname" runat="server" MaxLength="200">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator ID="rgvName" runat="server" ControlToValidate="txtname"
                                CssClass="red_new offset-md-3" Display="Dynamic" ValidationExpression="[0-9A-Za-z ]*$"
                                ErrorMessage="*Valid characters: Alphabets and Numbers." />
                            <asp:RequiredFieldValidator runat="server" ID="rfvname" CssClass="red_new offset-md-3"
                                ControlToValidate="txtname" Display="Dynamic" ErrorMessage="Please enter Location Name">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-md-3 col-form-label pl-0">Location Details<span
                                    class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtDet" runat="server" MaxLength="500"
                                TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDet" CssClass="red_new offset-md-3"
                                ControlToValidate="txtDet" Display="Dynamic"
                                ErrorMessage="Please enter Location Details">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                            <label class="col-auto col-form-label pl-0">Status<span class="red_new">*</span></label>
                            <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0 asp-radioButtonList"
                                RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" ID="rblStatus">
                                <asp:ListItem class="asp-listItem col-form-label mr-3 pt-0" Value="Active"
                                    Selected="True">Active</asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label pt-0" Value="InActive">InActive
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvStatus" CssClass="red_new offset-md-3"
                                ControlToValidate="rblStatus" Display="Dynamic"
                                ErrorMessage="Please select sector status">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group d-flex justify-content-end ">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                            OnClientClick="showProgress();" OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                            Visible="false" OnClientClick="showProgress();" OnClick="btnUpdate_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                            CausesValidation="false" OnClientClick="showProgress();" Text="Delete" Visible="false"
                            OnClick="btnDelete_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" Text="Cancel"
                            OnClick="btnCancel_Click" />
                    </div>


                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" class="table table-bordered" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10" AllowPaging="false"
                            OnPageIndexChanging="gvDept_PageIndexChanging">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            OnCheckedChanged="rbDept_CheckedChanged" RepeatLayout="Flow" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Lib_Loc_Id" HeaderText="Location ID" />
                                <asp:BoundField DataField="Lib_Loc_Name" HeaderText="Location Name" />
                                <asp:BoundField DataField="Location_Details" HeaderText="Location Details" />
                                <asp:BoundField DataField="Lib_Loc_Sno" HeaderText="Sector ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Lib_Loc_Status" HeaderText="Status" />
                                <asp:BoundField DataField="Status" HeaderText="Progress" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>

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