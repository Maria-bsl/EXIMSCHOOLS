<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="BooksDisposal.aspx.cs" Inherits="Schools.Facili.BooksDisposal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Books Disposal</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Books Disposal</h5>
                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Location Id
                                    <span class="red_new">*</span></label>
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddl_lib_loc_id" runat="server"
                                    OnSelectedIndexChanged="ddl_lib_loc_id_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfv_lib_from_loc_id"
                                    CssClass="red_new offset-md-3 offset-3" InitialValue="0"
                                    ControlToValidate="ddl_lib_loc_id" Display="Dynamic"
                                    ErrorMessage="Please Select Location Id">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Location Name
                                    <span class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txt_lib_loc_name" runat="server"
                                    Enabled="false">
                                </asp:TextBox>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Subject<span
                                        class="red_new">*</span></label>

                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlSubject" runat="server"
                                    OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new offset-md-3 offset-md-3" InitialValue="0"
                                    ControlToValidate="ddlSubject" Display="Dynamic"
                                    ErrorMessage="Please Select Subject">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Remarks
                                    <span class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtremarks" runat="server"
                                    TextMode="MultiLine">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    CssClass="red_new offset-md-3 offset-md-3" ControlToValidate="txtremarks"
                                    Display="Dynamic" ErrorMessage="Please Enter Remarks">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" ShowFooter="True">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <HeaderStyle CssClass="HeaderDatagrid" />
                                <PagerStyle CssClass="gridViewPager" />
                                <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sno">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book_Id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbid" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Title">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="ddlbtitle" runat="server"
                                                Width="250px" style="max-width: 350px;" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlbtitle_SelectedIndexChanged1">
                                                <asp:ListItem Text="select" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvbtitle2" runat="server"
                                                ControlToValidate="ddlbtitle" InitialValue="-1"
                                                CssClass="red_new offset-md-3" Display="Dynamic"
                                                ErrorMessage="Please select book title">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Author">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtauthor" runat="server"
                                            Width="250px" style="max-width: 400px;" Enabled="false">
                                            </asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="Publisher">
                        <ItemTemplate>
                            <asp:TextBox CssClass="form-control" ID="txtPublisher" runat="server" Width="200px" Enabled="false"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Available Books">
                                        <ItemTemplate>
                                            <asp:Label ID="lblavi" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No.of.Books">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtNobks" runat="server"
                                                Width="200px" TextMode="Number" OnTextChanged="txtNobks_TextChanged"
                                                AutoPostBack="true">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvbkts" runat="server"
                                                ControlToValidate="txtNobks" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Enter No. of Books">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="reMob" runat="server"
                                                ControlToValidate="txtNobks" Display="Dynamic"
                                                ErrorMessage="Enter Only Number" CssClass="red_new"
                                                ValidationExpression="^[0-9]*$">
                                            </asp:RegularExpressionValidator>
                                        </ItemTemplate>


                                        <FooterStyle HorizontalAlign="Right" />
                                        <FooterTemplate>
                                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnaddnew"
                                                runat="server" Text="AddNewRow" CausesValidation="false"
                                                OnClick="btnaddnew_Click" />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lkremove" runat="server" OnClick="lkremove_Click"
                                                CausesValidation="false">Remove
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                                OnClientClick="showProgress();" OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />

                        </div>
                    </div>
                </div>


            </ContentTemplate>
        </asp:UpdatePanel>
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