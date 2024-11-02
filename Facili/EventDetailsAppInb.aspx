<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventDetailsAppInb.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.EventDetailsAppInb" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <div>
        <%--    <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate> --%>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a
                        href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Event Details Approve Inbox</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Event Details Approve Inbox</h5>

                <div class="row">
                    

                    

                    

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server" DataKeyNames="Event_Sno"
                        AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        HeaderStyle-CssClass="HeaderDatagrid" 
                         AllowPaging="false">
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
                            <asp:BoundField DataField="Event_Date" HeaderText="Event Date"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Event_Off_Date" HeaderText="Event Off Date"
                                DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Event_Sno" HeaderText="Sector ID" ShowHeader="false">
                                <ItemStyle CssClass="hide" />
                                <HeaderStyle CssClass="hide" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Event_Time" HeaderText="Event Time" />
                            <asp:BoundField DataField="Event_Location" HeaderText="Event Location" />
                            <asp:BoundField DataField="Event_Subject" HeaderText="Event Subject" />
                            <asp:BoundField DataField="Acad_Year" HeaderText="Academic Year" />
                            <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                            <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream" />
                            <asp:BoundField DataField="Status" HeaderText="Progress" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="form-group col-12 d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnSubmit" runat="server" Text="Approve" OnClientClick="return confirm('Are you sure you want to approve?');"
                            OnClick="btnSubmit_Click" />

                      
                 
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                            CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
                    </div>
            </div>
        </div>
    </div>

    
    </div>
</asp:Content>