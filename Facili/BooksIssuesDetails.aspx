<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="BooksIssuesDetails.aspx.cs" Inherits="Schools.Facili.BooksIssuesDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Books Issues Details</li>
        </ol>
    </nav>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><label class="hd1">Books Issues Details</label></h5>

            <div class="row">
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-sm-3 col-form-label pl-0">Issued Date<span class="red_new">*</span></label>
                    <div class="input-group col-md-9 px-0">
                        <asp:TextBox CssClass="form-control" ID="txtidate" runat="server" AutoPostBack="true"
                            ></asp:TextBox>
                        <div class="input-group-append rounded-right">
                            <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                ID="iPopup" ImageUrl="/images/calendar.png" Height="38" />
                        </div>
                    </div>
                    <ajaxToolkit:CalendarExtender ID="cal2" runat="server" PopupButtonID="iPopup"
                        TargetControlID="txtidate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator runat="server" ID="rfvidate" CssClass="red_new offset-sm-3"
                        ControlToValidate="txtidate" Display="Dynamic" ErrorMessage="Please select issued date">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-sm-3 col-form-label pl-0">FreeDays <span class="red_new">*</span></label>
                    <asp:TextBox CssClass="col-md-9 form-control" ID="txtfdays" runat="server" MaxLength="2">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvfdays" CssClass="red_new offset-sm-3"
                        ControlToValidate="txtfdays" Display="Dynamic" ErrorMessage="Please enter free days">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-sm-3 col-form-label pl-0">Return Date<span class="red_new">*</span></label>
                    <div class="input-group col-md-9 px-0">
                        <asp:TextBox CssClass="form-control" ID="txtrdate" runat="server" AutoPostBack="true"
                            ></asp:TextBox>
                        <div class="input-group-append rounded-right">
                            <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                ID="ImageButton1" ImageUrl="/images/calendar.png" Height="38" />
                        </div>
                    </div>
                    <ajaxToolkit:CalendarExtender ID="cal1" runat="server" PopupButtonID="iPopup"
                        TargetControlID="txtrdate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator runat="server" ID="rfvrdate" CssClass="red_new offset-sm-3"
                        ControlToValidate="txtrdate" Display="Dynamic" ErrorMessage="Please select return date">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-sm-3 col-form-label pl-0">Academic Year<span class="red_new">*</span></label>
                    <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlayear" runat="server">
                        <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvayear" CssClass="red_new offset-sm-3"
                        ControlToValidate="ddlayear" Display="Dynamic" ErrorMessage="Please select academmic year">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-sm-3 col-form-label pl-0">Class Name<span class="red_new">*</span></label>
                    <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlcname" runat="server">
                        <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvcname" CssClass="red_new offset-sm-3"
                        ControlToValidate="ddlcname" Display="Dynamic" ErrorMessage="Please select class name">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-sm-3 col-form-label pl-0">Section Name<span class="red_new">*</span></label>
                    <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlsecname" runat="server">
                        <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvsecname" CssClass="red_new offset-sm-3"
                        ControlToValidate="ddlsecname" Display="Dynamic" ErrorMessage="Please select section name">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-sm-3 col-form-label pl-0">Student Full Name<span class="red_new">*</span></label>
                    <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlsfname" runat="server">
                        <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvsfname" CssClass="red_new offset-sm-3"
                        ControlToValidate="ddlsfname" Display="Dynamic" ErrorMessage="Please select Student full name">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-155">
                    <label class="col-auto col-form-label pl-0">Status<span class="red_new">*</span></label>
                    <asp:RadioButtonList ID="rblstatus" CssClass="col form-check form-check-inline mx-0 asp-radioButtonList" runat="server"
                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem class="pt-0 col-form-label mr-3" Text="Active" Value="0"></asp:ListItem>
                        <asp:ListItem class="pt-0 col-form-label" Text="InActive" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvrblstatus" CssClass="red_new offset-sm-3"
                        ControlToValidate="rblstatus" Display="Dynamic" ErrorMessage="Please select Status">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="table-responsive mb-1">
                <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                    AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="True">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <HeaderStyle CssClass="HeaderDatagrid" />
                    <PagerStyle CssClass="gridViewPager" />
                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                    <Columns>
                        <asp:BoundField DataField="Sno" HeaderText="Sno" />

                        <asp:TemplateField HeaderText="Subject name">
                            <ItemTemplate>
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlsub_name" runat="server">
                                    <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvsub_name" runat="server"
                                    ControlToValidate="ddlsub_name" CssClass="red_new offset-sm-3" Display="Dynamic"
                                    ErrorMessage="Please select Subject name">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Book Title">
                            <ItemTemplate>
                                <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlbtitle" runat="server">
                                    <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvbtitle" runat="server" ControlToValidate="ddlbtitle"
                                    CssClass="red_new offset-sm-3" Display="Dynamic"
                                    ErrorMessage="Please select book title">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Author">
                            <ItemTemplate>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtauthor" runat="server">
                                </asp:TextBox><br />
                            </ItemTemplate>
                        </asp:TemplateField>





                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:TextBox CssClass="col-md-9 form-control" ID="txtquantity" runat="server">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvquatity" runat="server"
                                    ControlToValidate="txtquantity" CssClass="red_new offset-sm-3" Display="Dynamic"
                                    ErrorMessage="Please enter quantity"></asp:RequiredFieldValidator>

                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <FooterTemplate>
                                <asp:Button ID="btnaddnew" runat="server" Text="AddNewRow" OnClick="btnaddnew_Click" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lkremove" runat="server" OnClick="lkremove_Click"
                                    CausesValidation="false">Remove</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>


            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Create"
                    OnClick="btnSubmit_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                    CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
            </div>
        </div>
    </div>
</asp:Content>