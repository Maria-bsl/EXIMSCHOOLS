<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="Book_issue_master.aspx.cs" Inherits="Schools.Facili.Book_issue_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .FirstItemStyle{
            background-color: #FFFFFF !important;
        }
    </style>
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
            <asp:HiddenField ID="hddbookid" runat="server" />
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Students Books Issuing</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Students Books Issuing</h5>
                    <div class="row">
                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">Admission No<span
                                    class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtadno" runat="server"
                                OnTextChanged="Get_details" AutoPostBack="true"></asp:TextBox>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                CssClass="red_new offset-md-3" ControlToValidate="txtadno" Display="Dynamic"
                                ErrorMessage="Please enter Admission No">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">Student Name<span
                                    class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtstudent" runat="server"
                                Enabled="false">
                            </asp:TextBox>
                            <asp:Label ID="lbladno" runat="server" Visible="false"></asp:Label>
                        </div>

                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-145">
                            <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Academic
                                Year<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtacdic" runat="server" Enabled="false">
                            </asp:TextBox>
                            <asp:Label ID="lbladicid" runat="server" Visible="false"></asp:Label>
                        </div>

                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-145">
                            <label class="col-md-3 col-form-label pl-0">Class Name<span class="red_new">*</span></label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtclass" runat="server" Enabled="false">
                            </asp:TextBox>
                            <asp:Label ID="lblclassno" runat="server" Visible="false"></asp:Label>
                        </div>

                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-145">
                            <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Section
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtsection" runat="server"
                                Enabled="false">
                            </asp:TextBox>
                            <asp:Label ID="lblsno" runat="server" Visible="false"></asp:Label>
                        </div>

                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-145">
                            <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">From
                                Location<span class="red_new">*</span></asp:Label>
                            <asp:DropDownList class="form-control" CssClass="col-md-9 form-control" runat="server"
                                ID="ddlloc" AutoPostBack="true" Width="160px"
                                OnSelectedIndexChanged="ddlloc_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlloc" Display="Dynamic"
                                ErrorMessage="Please select from location">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-6 row mx-0 format-145">
                            <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Number of Days<span
                                    class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtdays" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                                CssClass="red_new offset-md-3" ControlToValidate="txtdays" Display="Dynamic"
                                ErrorMessage="Please Enter Days">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="table-responsive mb-1">
                        <tr id="master" runat="server">
                            <td>
                                <asp:GridView ID="gvbooks" CssClass="table table-bordered mb-1 display" runat="server"
                                    AutoGenerateColumns="False" Width="100%"
                                    AlternatingRowStyle-CssClass="AlternateItemStyle"
                                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="True">
                                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                    <HeaderStyle CssClass="HeaderDatagrid" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                    <Columns>
                                        <asp:BoundField DataField="Sno" HeaderText="Sno" />


                                        <asp:TemplateField HeaderText="Subjects">
                                            <ItemTemplate>
                                                <asp:DropDownList CssClass="form-control" ID="ddlsubject" runat="server"
                                                    OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged"
                                                    AutoPostBack="true" style="min-width: 200px; max-width: 275px;">
                                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvsub" runat="server" InitialValue="-1"
                                                    ControlToValidate="ddlsubject" CssClass="red_new" Display="Dynamic"
                                                    ErrorMessage="Please select subject">
                                                </asp:RequiredFieldValidator>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subid" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsubid" runat="server">

                                                </asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Book Title">
                                            <ItemTemplate>

                                                <asp:DropDownList CssClass="form-control" ID="ddlbook" runat="server"
                                                    OnSelectedIndexChanged="ddlbook_SelectedIndexChanged"
                                                    style="min-width: 270px; max-width: 350px;" AutoPostBack="true">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvbook" runat="server" InitialValue="0"
                                                    ControlToValidate="ddlbook" CssClass="red_new" Display="Dynamic"
                                                    ErrorMessage="Please select book title">
                                                </asp:RequiredFieldValidator>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Book ID" Visible="false">
                                            <ItemTemplate>

                                                <asp:Label ID="ddlbookid" runat="server">

                                                </asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Author">
                                            <ItemTemplate>

                                                <asp:TextBox CssClass="form-control" ID="ddlauhor" runat="server"
                                                style="min-width: 250px; max-width: 350px;" Enabled="false">
                                                </asp:TextBox>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Available Books">
                                            <ItemTemplate>

                                                <asp:Label ID="lblavi" runat="server"></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txtqty" runat="server"
                                                    TextMode="Number" Width="100px">
                                                </asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvland" runat="server"
                                                    ControlToValidate="txtqty" CssClass="red_new" Display="Dynamic"
                                                    ErrorMessage="Please enter Quantity">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="reMob" runat="server"
                                                    ControlToValidate="txtqty" Display="Dynamic"
                                                    ErrorMessage="Enter Only Number" CssClass="red_new"
                                                    ValidationExpression="^[0-9]*$">
                                                </asp:RegularExpressionValidator>
                                            </ItemTemplate>
                                            <FooterStyle HorizontalAlign="Right" />

                                            <FooterTemplate>

                                                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnaddrow"
                                                    runat="server" CausesValidation="false" Text="Add New Row"
                                                    OnClick="btnaddrow_Click" />

                                            </FooterTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lkremove" runat="server" OnClick="Remove_click"
                                                    CausesValidation="false">Remove
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </div>
                    <div class="table-responsive mb-1">

                        <tr id="details" runat="server">
                            <td>
                                <asp:GridView ID="gvbookdata" CssClass="table table-bordered mb-1 display"
                                    runat="server" AutoGenerateColumns="False" Width="100%"
                                    AlternatingRowStyle-CssClass="AlternateItemStyle"
                                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="True">
                                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                    <HeaderStyle CssClass="HeaderDatagrid" />
                                    <PagerStyle CssClass="gridViewPager" />
                                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsno" runat="server"
                                                    Text='<%#Eval("Book_Iss_Det_Sno") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sno" ItemStyle-Width="2%"
                                            ItemStyle-VerticalAlign="Top" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:BoundField  DataField="Sno" HeaderText="Sno"  />--%>
                                        <asp:BoundField DataField="Subject" HeaderText="Subject Name" />
                                        <asp:BoundField DataField="Book_Title" HeaderText="Book Title" />
                                        <asp:BoundField DataField="Author" HeaderText="Author" />
                                        <asp:BoundField DataField="Qty" HeaderText="Quantity" />


                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </div>

                    <div class="form-group d-flex justify-content-end">

                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                            OnClientClick="showProgress();" OnClick="btnSubmit_Click" />

                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnapprove" runat="server"
                            Text="Approve" OnClientClick="showProgress();" OnClick="btnapprove_Click" />


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
</asp:Content>