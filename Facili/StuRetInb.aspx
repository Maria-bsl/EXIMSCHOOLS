<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StuRetInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.StuRetInb" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        th,
        td {
            white-space: nowrap;
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
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Students Return Inbox</li>
                    </ol>
                </nav>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Students Return Inbox</h5>


                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" OnRowCancelingEdit="gvDept_RowCancelingEdit"
                                OnRowDeleting="gvDept_RowDeleting" DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing"
                                OnRowUpdating="gvDept_RowUpdating">
                                <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                <PagerStyle CssClass="gridViewPager" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Admission">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lblAdmin" runat="server" Text='<%#Eval("Admission_No") %>'>
                                            </asp:Label>--%>
                                            <asp:LinkButton runat="server" ID="lnkView" Text='<%#Eval("Admission_No")%>'
                                                OnClick="lnkView_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Sno" HeaderText="Sector ID" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblID" Text='<%#Eval("Sno") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Admission Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblADate" runat="server"
                                                Text='<%#Eval("Admission_Date","{0:dd/M/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Roll No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRNo" runat="server" Text='<%#Eval("Roll_No") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCLA" runat="server" Text='<%#Eval("Class_Name") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Programme/Combination/Stream">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSEC" runat="server" Text='<%#Eval("Section_Name") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="First Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFName" runat="server"
                                                Text='<%#Eval("Student_Frist_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtFName"
                                                MaxLength="100" Width="200" Text='<%#Eval("Student_Frist_Name") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvFName"
                                                CssClass="red_new offset-md-3" ControlToValidate="txtFName"
                                                Display="Dynamic" ErrorMessage="Please enter first name">
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Middle Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMName" runat="server"
                                                Text='<%#Eval("Student_Middle_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtMName"
                                                MaxLength="100" Width="200" Text='<%#Eval("Student_Middle_Name") %>'>
                                            </asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLName" runat="server"
                                                Text='<%#Eval("Student_Last_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtLName"
                                                MaxLength="100" Width="200" Text='<%#Eval("Student_Last_Name") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvLName"
                                                CssClass="red_new offset-md-3" ControlToValidate="txtLName"
                                                Display="Dynamic" ErrorMessage="Please enter last name">
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Parent Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPName" runat="server" Text='<%#Eval("Parent_Name") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtPName"
                                                MaxLength="100" Width="280" Text='<%#Eval("Parent_Name") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvPName"
                                                CssClass="red_new offset-md-3" ControlToValidate="txtPName"
                                                Display="Dynamic" ErrorMessage="Please enter parent name">
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMobile" runat="server"
                                                Text='<%#Eval("Parent_Mobile_No") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="px-0  input-group" style="min-width: 180px;">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text country">TZ</span>
                                                </div>
                                                <asp:TextBox CssClass="form-control phone-num" type="tel" runat="server"
                                                    ID="txtMobile" MaxLength="100" Width="130"
                                                    Text='<%#Eval("Parent_Mobile_No") %>'></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ID="rfvMobile"
                                                CssClass="red_new offset-md-3" ControlToValidate="txtMobile"
                                                Display="Dynamic" ErrorMessage="Please enter mobile no">
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server"
                                                Text='<%#Eval("Parent_Email_Address") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail"
                                                MaxLength="100" Width="300" Text='<%#Eval("Parent_Email_Address") %>'>
                                            </asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revEmail" CssClass="red_new offset-md-3"
                                                runat="server" ControlToValidate="txtEmail"
                                                ErrorMessage="Please enter the valid Email ID"
                                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                                Display="Dynamic"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                  <asp:CommandField ShowDeleteButton="true" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve" Visible="false"
                                OnClick="btnSubmit_Click" />
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                                CausesValidation="false"
                                OnClientClick="return confirm('Are you sure you want to delete?');" Text="Delete All" Visible="false"
                                OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>