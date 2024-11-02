<%@ Page Title="" Language="C#" MasterPageFile="~/Head_Faci.Master" AutoEventWireup="true" CodeBehind="BooksTransferDetails.aspx.cs" Inherits="Schools.Facili.BooksTransferDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
            height: 9px;
        }

        .auto-style6 {
            width: 100%;
            height: 11px;
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

            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Books Transfer Details</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Books Transfer Details</h5>
                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">Transfer Date<span
                                    class="red_new">*</span></label>
                            <div class="input-group col-md-9 px-0">
                                <asp:TextBox CssClass="form-control" ID="txttdate" runat="server">
                                </asp:TextBox>
                                <div class="input-group-append rounded-right">
                                    <asp:ImageButton CssClass="input-group-text" runat="server" CausesValidation="false"
                                        ID="iPopup" ImageUrl="/images/calendar.png" Height="38px" />
                                </div>
                            </div>
                            <ajaxToolkit:CalendarExtender ID="Calendar1" runat="server" PopupButtonID="iPopup"
                                TargetControlID="txttdate" Format="MM/dd/yyyy">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator runat="server" ID="rfvtdate" CssClass="red_new offset-md-3"
                                ControlToValidate="txttdate" Display="Dynamic"
                                ErrorMessage="Please select transfer date">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">From Location Id<span
                                    class="red_new">*</span></label>
                            <asp:DropDownList CssClass="col-md-9 form-control" ID="ddl_lib_from_loc_id" runat="server"
                                AutoPostBack="true" OnSelectedIndexChanged="ddl_lib_from_loc_id_SelectedIndexChanged">

                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfv_lib_from_loc_id"
                                CssClass="red_new offset-md-3" ControlToValidate="ddl_lib_from_loc_id" Display="Dynamic"
                                ErrorMessage="Please Select From Location Id">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0"> From Location name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txt_lib_from_loc_name" runat="server"
                                Enabled="false"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0"> To Location Id<span
                                    class="red_new">*</span></label>
                            <asp:DropDownList CssClass="col-md-9 form-control" ID="ddl_lib_to_loc_id" runat="server"
                                AutoPostBack="true" OnSelectedIndexChanged="ddl_lib_to_loc_id_SelectedIndexChanged">

                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfv_lib_to_loc_id"
                                CssClass="red_new offset-md-3" ControlToValidate="ddl_lib_to_loc_id" Display="Dynamic"
                                ErrorMessage="Please Select To Location Id">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">To Location Name</label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txt_lib_to_loc_name" runat="server"
                                Enabled="false"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-160">
                            <label class="col-md-3 col-form-label pl-0">Remarks</label>
                            <asp:TextBox CssClass="col-md-9 form-control" ID="txtremarks" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="True"
                            OnSelectedIndexChanged="gvDept_SelectedIndexChanged">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <HeaderStyle CssClass="HeaderDatagrid" />
                            <PagerStyle CssClass="gridViewPager" />
                            <AlternatingRowStyle CssClass="AlternateItemStyle" />
                            <Columns>
                                <asp:BoundField DataField="Sno" HeaderText="Sno" />

                                <asp:TemplateField HeaderText="Subject">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-control" ID="ddlsubjectname" runat="server"
                                            Width="250px" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlsubjectname_SelectedIndexChanged">
                                            <asp:ListItem Text="select" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvsubname" runat="server"
                                            ControlToValidate="ddlsubjectname" CssClass="red_new" Display="Dynamic"
                                            ErrorMessage="Please Select Subject Name" InitialValue="-1">
                                        </asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Book">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-control" ID="ddlbooktitle" style="width:250px;"
                                            runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlbooktitle_SelectedIndexChanged">
                                            <asp:ListItem Text="select" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvbooktitle" runat="server"
                                            ControlToValidate="ddlbooktitle" CssClass="red_new" InitialValue="-1"
                                            Display="Dynamic" ErrorMessage="Please Select Book Titles">
                                        </asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Author">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtauthor" Enabled="false"
                                            runat="server" style="width:250px;">
                                        </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Rack.ID">
                                    <ItemTemplate>

                                        <asp:TextBox CssClass="form-control" ID="ddlrack_id_from" Enabled="false"
                                            runat="server" style="width:200px;">
                                        </asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvrack_id_from" runat="server" ControlToValidate="ddlrack_id_from" CssClass="red_new" Display="Dynamic" ErrorMessage="Please select rack id from"></asp:RequiredFieldValidator>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rack From">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtrack_name_from" Enabled="false"
                                            runat="server" style="width:200px;">
                                        </asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvrack_name_from" runat="server" ControlToValidate="txtrack_name_from" CssClass="red_new" Display="Dynamic" ErrorMessage="Please enter DepartureTime"></asp:RequiredFieldValidator>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shelf From">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="ddlshelf_number_from" Enabled="false"
                                            runat="server" style="width:200px;">

                                        </asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvshelf_number_from" runat="server" ControlToValidate="ddlshelf_number_from" CssClass="red_new" Display="Dynamic" ErrorMessage="Please select shelf number from"></asp:RequiredFieldValidator>--%>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Avble.Books">
                                    <ItemTemplate>
                                        <%-- <asp:DropDownList ID="ddlsubsno" runat="server">
                            
                        </asp:DropDownList>--%>
                                        <asp:Label ID="lblbooks" runat="server"></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rack.ID.To">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-control" ID="ddlrack_id_to" runat="server"
                                            AutoPostBack="true" style="width:200px;"
                                            OnSelectedIndexChanged="ddlrack_id_to_SelectedIndexChanged">
                                            <asp:ListItem Text="select" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvrack_id_to" runat="server"
                                            ControlToValidate="ddlrack_id_to" CssClass="red_new" Display="Dynamic"
                                            InitialValue="-1" ErrorMessage="Please Select Rack Id To">
                                        </asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Rack To">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtrack_name_to" runat="server"
                                            Enabled="false" style="width:200px;">
                                        </asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvrack_name_from" runat="server" ControlToValidate="txtrack_name_from" CssClass="red_new" Display="Dynamic" ErrorMessage="Please enter DepartureTime"></asp:RequiredFieldValidator>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Shelf To">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-control" ID="ddlshelf_number_to" runat="server"
                                            style="width:200px"
                                            OnSelectedIndexChanged="ddlshelf_number_to_SelectedIndexChanged"
                                            AutoPostBack="true">
                                            <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvshelf_number_to" runat="server"
                                            ControlToValidate="ddlshelf_number_to" CssClass="red_new" Display="Dynamic"
                                            ErrorMessage="Please Select Shelf No To" InitialValue="-1">
                                        </asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtquantity" runat="server"
                                            TextMode="Number" Width="200px" OnTextChanged="txtquantity_TextChanged"
                                            AutoPostBack="true"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvquatity" runat="server"
                                            ControlToValidate="txtquantity" CssClass="red_new" Display="Dynamic"
                                            ErrorMessage="Please enter quantity">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="reMob" runat="server"
                                            ControlToValidate="txtquantity" Display="Dynamic"
                                            ErrorMessage="Enter Only Number" CssClass="red_new"
                                            ValidationExpression="^[0-9]*$">
                                        </asp:RegularExpressionValidator>
                                    </ItemTemplate>

                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="SubjectSno" Visible="false">
                                    <ItemTemplate>
                                        <%-- <asp:DropDownList ID="ddlsubsno" runat="server">
                            
                        </asp:DropDownList>--%>
                                        <asp:Label ID="ddlsubsno" runat="server"></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="BookId" Visible="false">
                                    <ItemTemplate>
                                        <%--<asp:DropDownList ID="ddlbookid" runat="server" >
                            
                        </asp:DropDownList>--%>
                                        <asp:Label ID="ddlbookid" runat="server"></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="RackShelfFromSno" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrsfn" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="RackShelfToSno" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrstn" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="RackShelf_Det_From_Sno" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrsdfn" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Rack_Shelf_Det_To_Sno" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrsdtn" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lkremove" Width="60px" runat="server"
                                            OnClick="lkremove_Click" CausesValidation="false">Remove
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnaddnew" runat="server" Visible="false"
                            CausesValidation="false" Text="AddNewRow" OnClick="btnaddnew_Click" />
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
</asp:Content>