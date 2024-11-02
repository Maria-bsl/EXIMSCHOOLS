<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Books" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:UpdatePanel ID="update" runat="server"></asp:UpdatePanel>
        <ContentTemplate>
            <script type="text/javascript">
                function showProgress() {
                    if (Page_ClientValidate()) {
                        var updateProgress = $get("<%= upProgress.ClientID %>");
                        updateProgress.style.display = "block";
                    }
                }
            </script>
            <style type="text/css">
                /*.uppercase {
                        text-transform: uppercase;
                    }*/
            </style>

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Books</li>
                </ol>
            </nav>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Books</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Book Title<span class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtBook" runat="server" MaxLength="200">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvBook" CssClass="red_new offset-md-3"
                                ControlToValidate="txtBook" Display="Dynamic" ErrorMessage="Please enter Book Title ">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Subject<span class="red_new">*</span></label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSubject">
                            </asp:DropDownList><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvSubject" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSubject" Display="Dynamic" ErrorMessage="Please select Subject">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Author<span class="red_new">*</span></label>

                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtAuthr" runat="server" MaxLength="100">
                            </asp:TextBox>
                            <asp:RegularExpressionValidator ID="rgvAuthr" runat="server" CssClass="red_new offset-md-3"
                                ControlToValidate="txtAuthr" Display="Dynamic" ValidationExpression="[a-zA-Z ]*$"
                                ErrorMessage="*Valid characters: Alphabets and space." />
                            <asp:RequiredFieldValidator runat="server" ID="rfvAuthr" CssClass="red_new offset-md-3"
                                ControlToValidate="txtAuthr" Display="Dynamic" ErrorMessage="Please enter Author ">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Publisher<span class="red_new">*</span></label>

                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtPub" runat="server" MaxLength="100">
                            </asp:TextBox><br />
                            <asp:RequiredFieldValidator runat="server" ID="rfvPub" CssClass="red_new offset-md-3"
                                ControlToValidate="txtPub" Display="Dynamic" ErrorMessage="Please enter Publisher">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">CopyRight<span class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtCopy" runat="server" MaxLength="100">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCopy" CssClass="red_new offset-md-3"
                                ControlToValidate="txtCopy" Display="Dynamic" ErrorMessage="Please enter CopyRight ">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Edition
                                <span class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtEdtn" runat="server" MaxLength="100">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEdtn" CssClass="red_new offset-md-3"
                                ControlToValidate="txtEdtn" Display="Dynamic" ErrorMessage="Please enter Edition">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-md-3 col-form-label pl-0">Pages<span class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtPage" runat="server" MaxLength="100"
                                TextMode="Number">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPage" CssClass="red_new offset-md-3"
                                ControlToValidate="txtPage" Display="Dynamic" ErrorMessage="Please enter Pages ">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-100">
                            <label class="col-auto col-form-label pl-0">Status<span class="red_new">*</span></label>
                            <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0"
                                RepeatDirection="Horizontal" runat="server" ID="rblStatus" RepeatLayout="Flow">
                                <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Active" Selected="True">
                                    Active
                                </asp:ListItem>
                                <asp:ListItem class="asp-listItem col-form-label " Value="InActive">InActive
                                </asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvStatus" CssClass="red_new offset-md-3"
                                ControlToValidate="rblStatus" Display="Dynamic"
                                ErrorMessage="Please select sector status">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-12 d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClientClick="showProgress();" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server"
                                Text="Update" OnClientClick="showProgress();" Visible="false"
                                OnClick="btnUpdate_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server"
                                CausesValidation="false" OnClientClick="showProgress();" Text="Delete" Visible="false"
                                OnClick="btnDelete_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
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
                                <asp:TemplateField ItemStyle-Width="2%">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                            OnCheckedChanged="rbDept_CheckedChanged" RepeatLayout="Flow" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Book_Title" HeaderText="Book Title" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                <asp:BoundField DataField="Author" HeaderText="Author"   />
                                <asp:BoundField DataField="Book_ID" HeaderText="Sector ID" ShowHeader="false">
                                    <ItemStyle CssClass="hide" />
                                    <HeaderStyle CssClass="hide" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Publisher" HeaderText="Publisher" />
                                <asp:BoundField DataField="Copyright" HeaderText="Copyrights" HtmlEncode="false" />
                                <asp:BoundField DataField="Edition" HeaderText="Edition" />
                                <asp:BoundField DataField="Pages" HeaderText="Pages" />
                                <%-- <asp:BoundField DataField="No_Of_Books" HeaderText=" No.of.Books" />
           <asp:BoundField DataField="No_Of_Available_Books" HeaderText="No. of Available Books" />
        <asp:BoundField DataField="No_Of_Issued_Books" HeaderText="No. of Issued Books" />
           <asp:BoundField DataField="Lib_Loc_Name" HeaderText="Location" />
           <asp:BoundField DataField="Rack_Name" HeaderText="Rack" />
          <asp:BoundField DataField="Shelf_No" HeaderText="Shelf" /> --%>
                                <asp:BoundField DataField="Book_Mas_Status" HeaderText="Status" />
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
<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 12px;
        }

        table#gvDept th {
            white-space: nowrap;
        }

        table#gvDept tbody tr {
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