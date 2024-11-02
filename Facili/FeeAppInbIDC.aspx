<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeAppInbIDC.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.FeeAppInbIDC" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        /*$(document).ready(function () {
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
        });*/
        function Check_Click(objRef) {
            var row = objRef.parentNode.parentNode;
            var GridView = row.parentNode;

            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                var headerCheckBox = inputList[0];
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;
        }
        function checkAll(objRef) {
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {

                        inputList[i].checked = true;
                    }
                    else {

                        inputList[i].checked = false;
                    }

                }

            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function showProgress() {
            if (Page_ClientValidate()) {
                var updateProgress = $get("<%= upProgress.ClientID %>");
                updateProgress.style.display = "block";
            }
        }
    </script>
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
                <asp:PostBackTrigger ControlID="btnCancel" />
            </Triggers>
        </asp:UpdatePanel>

        <ContentTemplate>


            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Fee Approve Inbox</li>
                </ol>
            </nav>


            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Fee Approve Inbox</h5>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" OnRowCommand="gvDept_OnRowCommand"
                            OnRowCancelingEdit="gvDept_RowCancelingEdit" OnRowDeleting="gvDept_RowDeleting"
                            DataKeyNames="Sno" OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                      <asp:CheckBox ID="checkAll" runat="server" onclick = "checkAll(this);" />
                                    </HeaderTemplate>
                                   <ItemTemplate>
                                     <asp:CheckBox ID="chkID" runat="server" onclick = "Check_Click(this)" />
                                   </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Admission">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lnkView" Text='<%#Eval("Admission_No")%>' OnClick="lnkView_Click"></asp:LinkButton>
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
                                <asp:TemplateField HeaderText="Term">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTerm" runat="server" Text='<%#Eval("Term_Type") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fee">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFee" runat="server" Text='<%#Eval("Fee_Type") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Requested Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRAmount" runat="server" Text='<%#Eval("Requested_Amount") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="txtRAmount"
                                            MaxLength="10" Width="150" Text='<%#Eval("Requested_Amount") %>'>
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvRAmount"
                                            CssClass="red_new offset-md-3" ControlToValidate="txtRAmount"
                                            Display="Dynamic" ErrorMessage="Please enter amount">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ID="revDays"
                                            CssClass="red_new offset-md-3" ValidationExpression="^[0-9]{1,7}$"
                                            ControlToValidate="txtRAmount" Display="Dynamic"
                                            ErrorMessage="Please enter valid amount">
                                        </asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                
                                <%--<asp:CommandField ShowEditButton="false" />
                                <asp:CommandField ShowDeleteButton="false" />--%>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                            OnClick="btnSubmit_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" Text="Delete All" Visible="false"
                            OnClientClick="return confirm('Are you sure you want to delete?');"
                            OnClick="btnCancel_Click" />

                    </div>
                </div>
            </div>
        </ContentTemplate>

        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upRegister">
            <ProgressTemplate>
                <div
                    style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <span
                        style="border-width: 0px; position: fixed; padding: 20px; background-color: #FFFFFF; font-size: 30px; left: 40%; top: 40%; border-radius: 50px;"><img
                            alt="progress" src="/Images/loader1.gif" />Loading ...</span>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>