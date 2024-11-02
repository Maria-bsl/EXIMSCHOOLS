﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SectionAppInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.SectionAppInb" %>

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
    <div>
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>

                <nav aria-label="Page breadcrumb">
                    <ol class="breadcrumb mb-1 bg-white py-1 border">
                        <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                        <li class="breadcrumb-item">Programme/Combination/Stream Approve Inbox</li>
                    </ol>
                </nav>


                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Programme/Combination/Stream Approve Inbox</h5>

                        <div class="table-responsive mb-1">
                            <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                                AutoGenerateColumns="false" Width="100%"
                                AlternatingRowStyle-CssClass="AlternateItemStyle" HeaderStyle-CssClass="HeaderDatagrid"
                                AllowPaging="false" OnRowCancelingEdit="gvDept_RowCancelingEdit"
                                OnRowDeleting="gvDept_RowDeleting" DataKeyNames="SectionSno"
                                OnRowEditing="gvDept_RowEditing" OnRowUpdating="gvDept_RowUpdating">
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
                                    <asp:TemplateField HeaderText="Programme/Combination/Stream">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lnkView" Text='<%#Eval("Section_Name")%>'
                                                OnClick="lnkView_Click"></asp:LinkButton>
                                            
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCName" MaxLength="100" runat="server"
                                                Text='<%#Eval("Section_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SectionSno" HeaderText="Sector ID" ShowHeader="false">
                                        <ItemStyle CssClass="hide" />
                                        <HeaderStyle CssClass="hide" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblID" Text='<%#Eval("SectionSno") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Active / InActive">
                                        <ItemTemplate>
                                            <asp:Label ID="lblActive" runat="server"
                                                Text='<%#Eval("Section_Status") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlActive" Width="160"
                                                SelectedValue='<%#Eval("Section_Status") %>'>
                                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                                <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="form-group d-flex justify-content-end">
                            <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve"
                                OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" Visible="false"
                                CausesValidation="false" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>