<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BooksIssues_tea.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.BooksIssues_tea" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

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
                        <li class="breadcrumb-item">Teachers Books Issuing</li>
                    </ol>
                </nav>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><label class="hd1 mb-0">Teachers Books Issuing</h5>
                        <div class="row">
                            <div class="form-group col-md-9 col-lg-6 row mx-0 format-155">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">Academic
                                    Year<span class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcademic"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                    ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                            </div>


                            <div class="form-group col-md-9 col-lg-6 row mx-0 format-155">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Teacher
                                    Full
                                    Name<span class="red_new">*</span></asp:Label>

                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlFull"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvFull" CssClass="red_new offset-md-3"
                                    ControlToValidate="ddlFull" Display="Dynamic"
                                    ErrorMessage="Please select TeacherName">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-md-9 col-lg-6 row mx-0 format-155">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">From
                                    Location
                                    <span class="red_new">*</span></asp:Label>
                                <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlloc"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlloc_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    CssClass="red_new offset-md-3" ControlToValidate="ddlloc" Display="Dynamic"
                                    ErrorMessage="Please select from location">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group col-md-9 col-lg-6 row mx-0 format-155">
                                <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Number of Days
                                    <span class="red_new">*</span></asp:Label>
                                <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtfree">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvfree" CssClass="red_new offset-md-3"
                                    ControlToValidate="txtfree" Display="Dynamic" ErrorMessage="Please Enter Number of Days">
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
                                    <asp:BoundField DataField="Sno" HeaderText="Sno" />
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlsub_name"
                                                Width="200" OnSelectedIndexChanged="ddlsub_name_SelectedIndexChanged"
                                                AutoPostBack="true">
                                                <asp:ListItem Value="0" Selected="True">Select Subject</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvsub_name" runat="server" InitialValue="0"
                                                ControlToValidate="ddlsub_name" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select Subject name"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Book Title">

                                        <ItemTemplate>
                                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlbtitle"
                                                Width="200" OnSelectedIndexChanged="ddlbook_SelectedIndexChanged"
                                                AutoPostBack="true">
                                                <asp:ListItem Value="-1" Selected="True">Select Book</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvbtitle" runat="server" InitialValue="-1"
                                                ControlToValidate="ddlbtitle" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please Select book title"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Author">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtauthor" runat="server"
                                                Enabled="false" Width="200">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvauthor" runat="server"
                                                ControlToValidate="txtauthor" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please enter author"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Available Books">
                                        <ItemTemplate>
                                            <asp:Label ID="lblavi" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:TextBox CssClass="form-control" ID="txtquantity" TextMode="Number"
                                                runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvquantity" runat="server"
                                                ControlToValidate="txtquantity" CssClass="red_new" Display="Dynamic"
                                                ErrorMessage="Please enter quantity"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="reMob" runat="server"
                                                ControlToValidate="txtquantity" Display="Dynamic"
                                                ErrorMessage="Enter Only Number" CssClass="red_new"
                                                ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                        </ItemTemplate>

                                        <FooterStyle HorizontalAlign="Right" />

                                        <FooterTemplate>

                                            <asp:Button ID="ButtonAdd" CssClass="btn btn-sm btn-biz_logic"
                                                runat="server" Text="Add New Row" CausesValidation="false"
                                                OnClick="ButtonAdd_Click" />

                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="false" HeaderStyle-CssClass="d-none" Visible="False">

                                        <ItemTemplate>

                                            <asp:TextBox CssClass="form-control d-none" ID="ddlbtitleid" runat="server">

                                            </asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"
                                                OnClick="LinkButton1_Click">Remove
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