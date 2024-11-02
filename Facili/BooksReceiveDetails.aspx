<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="BooksReceiveDetails.aspx.cs" Inherits="Schools.Facili.BooksReceiveDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <div>
                <asp:HiddenField ID="hdd" runat="server" />

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">New Books Received Details</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">New Books Received Details</h5>

                        <div class="row">
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Received Date<span
                                        class="red_new">*</span></label>
                                <div class="input-group col-md-9 px-0">
                                    <asp:TextBox CssClass="Displaytext form-control" ID="txtrdate" runat="server">
                                    </asp:TextBox>
                                    <div class="input-group-append rounded-right">
                                        <asp:ImageButton CssClass="input-group-text" runat="server"
                                            CausesValidation="false" ID="iPopup" ImageUrl="/images/calendar.png"
                                            Height="38" />
                                    </div>
                                </div>
                                <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                    TargetControlID="txtrdate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                <asp:RequiredFieldValidator runat="server" ID="rfvrdate" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtrdate" Display="Dynamic"
                                    ErrorMessage="Please select received date">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Received From<span
                                        class="red_new">*</span></label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtrfrom" runat="server">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvrfrom" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtrfrom" Display="Dynamic"
                                    ErrorMessage="Please enter received from">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Location <span
                                        class="red_new">*</span></label>
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddl_lib_loc_id" runat="server"
                                    OnSelectedIndexChanged="ddl_lib_loc_id_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfv_lib_from_loc_id"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddl_lib_loc_id" Display="Dynamic"
                                    ErrorMessage="Please Select Location"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Location Name</label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txt_lib_loc_name" runat="server"
                                    Enabled="false">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfv_lib_loc_name"
                                    CssClass="red_new offset-md-3" ControlToValidate="txt_lib_loc_name"
                                    Display="Dynamic" ErrorMessage="Please Enter Location Name">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Subject<span
                                        class="red_new">*</span></label>
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlsub" runat="server"
                                    OnSelectedIndexChanged="ddlsub_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="Select Subject" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvbtitle" runat="server" ControlToValidate="ddlsub"
                                    CssClass="red_new offset-md-3" Display="Dynamic"
                                    ErrorMessage="Please select subject">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-145">
                                <label class="col-md-3 col-form-label pl-0">Remarks</label>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtremarks" runat="server">
                                </asp:TextBox>
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

                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbid" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Title">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="ddlbtitle" runat="server"
                                                Width="250px" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlbtitle_SelectedIndexChanged1">
                                                <asp:ListItem Text="Select " Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvbtitle" runat="server"
                                                ControlToValidate="ddlbtitle" InitialValue="-1" CssClass="red_new"
                                                Display="Dynamic" ErrorMessage="Please select book title">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Author">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtauthor" runat="server"
                                                Width="250px" Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvathur" runat="server"
                                                ControlToValidate="txtauthor" InitialValue="" CssClass="red_new"
                                                Display="Dynamic" ErrorMessage="Please enter Author name">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Rack Id">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="txtrid" runat="server"
                                                OnSelectedIndexChanged="txtrid_SelectedIndexChanged" AutoPostBack="true"
                                                Width="200px">
                                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvrid" runat="server"
                                                ControlToValidate="txtrid" InitialValue="0" CssClass="red_new"
                                                Display="Dynamic" ErrorMessage="Please select rack id">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rack Name">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtrackname" runat="server"
                                                Width="200px" Enabled="false">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvrid21" runat="server"
                                                ControlToValidate="txtrackname" InitialValue="" CssClass="red_new"
                                                Display="Dynamic" ErrorMessage="Please enter rack name">
                                            </asp:RequiredFieldValidator>

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Shelf Number">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="txtshelfno" runat="server"
                                                Width="200px" OnSelectedIndexChanged="txtshelfno_SelectedIndexChanged"
                                                AutoPostBack="true">
                                                <asp:ListItem Text="select" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvrshid" runat="server"
                                                ControlToValidate="txtshelfno" InitialValue="0" CssClass="red_new"
                                                Display="Dynamic" ErrorMessage="Please select shelf no">
                                            </asp:RequiredFieldValidator>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtquantity" runat="server"
                                                TextMode="Number" Width="200px">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvquatity" runat="server"
                                                ControlToValidate="txtquantity" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please enter quantity">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="reMob" style="width:50px;"
                                                runat="server" ControlToValidate="txtquantity" Display="Dynamic"
                                                ErrorMessage="Enter Only Number" CssClass="red_new"
                                                ValidationExpression="^[0-9]*$">
                                            </asp:RegularExpressionValidator>
                                        </ItemTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                        <FooterTemplate>
                                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnaddnew"
                                                runat="server" Text="Add New Row" CausesValidation="false"
                                                OnClick="btnaddnew_Click" />
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrsno" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrdsno" runat="server"></asp:Label>
                                        </ItemTemplate>
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
</asp:Content>