<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timings.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Timings" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script>
        $(document).ready(function () {

            // Query all selection within [td>select] and pass it in the function 
            var selects = $("td>select");
            $.each(selects, function (selectsID, selectsValue) {

                // find all options of [td>select]
                var options = $(selectsValue).find('option');

                // Query all selection within [td>select>option] and pass it in the function 
                $(options).each(function (optionsID, optionsElement) {

                    /* 
                    Query and pick the text of the first option which will 
                    later be used to check it with another option text
                    */
                    if (optionsID == 0) {
                        var optionText = $(optionsElement).text();
                    } else {
                        if (options[0].textContent == optionsElement.textContent) {
                            optionsElement.setAttribute('selected', 'selected');
                        }

                    }
                });

            });

            $('table[id*=gvDept]>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });

            $('table[id*=gvDept]').prepend($("<thead></thead>").append($(this).find("tr:first")))
                .DataTable({
                    "responsive": true,
                    "stateSave": true,
                    "paging": false,
                    "filter": false,
                    "info": false,
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
    <asp:UpdatePanel ID="upRegister" runat="server"></asp:UpdatePanel>
    <ContentTemplate>
        <nav aria-label="Page breadcrumb">
            <ol class="breadcrumb mb-1 bg-white py-1 border">
                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                <li class="breadcrumb-item">Period Timings</li>
            </ol>
        </nav>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Period Timings</h5>

                <div class="row">
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">
                            Academic Year<span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                        </asp:DropDownList>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Dis" ID="rfvAcademic"
                            CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                            ErrorMessage="Please select Academic Year"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label1">Class
                            <span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCname">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Dis" ID="rfvCname"
                            CssClass="red_new offset-md-3" ControlToValidate="ddlCname" Display="Dynamic"
                            ErrorMessage="Please select Class"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label2"> Copy
                            of Class</asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlCCname">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label4">
                            Copy of Day</asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlCDay" runat="server">
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="">--Select Day--
                            </asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Monday" Text="Monday">
                                Monday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Tuesday" Text="Tuesday">
                                Tuesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Wednesday" Text="Wednesday">
                                Wednesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Thursday" Text="Thursday">
                                Thursday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Friday" Text="Friday">
                                Friday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Saturday" Text="Saturday">
                                Saturday</asp:ListItem>
                        </asp:DropDownList>
                        
                    </div>
                    <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-130">
                        <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="Label3">
                            Day<span class="red_new">*</span></asp:Label>

                        <asp:DropDownList CssClass="col-md-9 form-control" ID="ddlDay" runat="server">
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="">--Select Day--
                            </asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Monday" Text="Monday">
                                Monday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Tuesday" Text="Tuesday">
                                Tuesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Wednesday" Text="Wednesday">
                                Wednesday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Thursday" Text="Thursday">
                                Thursday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Friday" Text="Friday">
                                Friday</asp:ListItem>
                            <asp:ListItem Cssclass="asp-listItem col-form-label" Value="Saturday" Text="Saturday">
                                Saturday</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Dis" ID="rfvDay"
                            CssClass="red_new offset-md-3" ControlToValidate="ddlDay" Display="Dynamic"
                            ErrorMessage="Please Enter Day"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-12 d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" runat="server" ID="btnStu" ValidationGroup="Dis"
                            Text="Display Timings" OnClick="btnStu_Click" />
                    </div>

                </div>

                <div class="table-responsive mb-1">
                    <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                        AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                        OnRowDataBound="gvDept_RowDataBound" HeaderStyle-CssClass="HeaderDatagrid" ShowFooter="false">
                        <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                        <HeaderStyle CssClass="HeaderDatagrid" />
                        <PagerStyle CssClass="gridViewPager" />
                        <AlternatingRowStyle CssClass="AlternateItemStyle" />
                        <Columns>

                            <asp:TemplateField HeaderText="Period Type">
                                <ItemTemplate>
                                    <asp:DropDownList CssClass="form-control" ID="ddlPeriod" AutoPostBack="true"
                                        runat="server" OnSelectedIndexChanged="ddlPeriod_SelectedIndexChanged"
                                        style="min-width: 100px;">
                                        <asp:ListItem Value="">Select</asp:ListItem>
                                        <asp:ListItem Value="period" Text="period">Period</asp:ListItem>
                                        <asp:ListItem Value="Break" Text="Break">Break</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvPeriod" runat="server"
                                        ControlToValidate="ddlPeriod" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please Select Period Type">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Period No" ItemStyle-Width="1%">
                                <ItemTemplate>
                                    <asp:Label ID="lblRowNumber" runat="server" />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Time">
                                <ItemTemplate>
                                    <asp:TextBox CssClass="form-control" ID="txtStart" runat="server" htmlencode="false"
                                        placeholder="HH:MM" MaxLength="5" onkeypress="formatTime(this)"
                                        DataFormatString="{0:hh:mm}" style="max-width: 120px;">
                                    </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revstart" runat="server" CssClass="red_new"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtStart"
                                        ErrorMessage="Please enter valid time"
                                        ValidationExpression="^(?:[01]?[0-9]|2[0-3]):[0-5][0-9]$"></asp:RegularExpressionValidator>

                                    <asp:RequiredFieldValidator ID="rfvStart" runat="server"
                                        ControlToValidate="txtStart" CssClass="red_new" Display="Dynamic"
                                        ErrorMessage="Please select Start Time">
                                    </asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Time">
                                <ItemTemplate>
                                    <asp:TextBox CssClass="form-control" ID="txtEnd" runat="server" htmlencode="false"
                                        placeholder="HH:MM" MaxLength="5" onchange="time()"
                                        onkeypress="formatTime(this)" style="max-width: 120px;"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revend" runat="server" CssClass="red_new"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtEnd"
                                        ErrorMessage="Please enter valid time"
                                        ValidationExpression="^(?:[01]?[0-9]|2[0-3]):[0-5][0-9]$"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="rfvEnd" runat="server" ControlToValidate="txtEnd"
                                        CssClass="red_new" Display="Dynamic" ErrorMessage="Please select End Time">
                                    </asp:RequiredFieldValidator>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"
                                        CausesValidation="false">Remove
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>

                <div class="form-group d-flex justify-content-end">
                    <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="ButtonAdd" runat="server" Text="Add New Row"
                        CausesValidation="false" OnClick="ButtonAdd_Click" />
                    <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnSubmit" runat="server" Text="Submit"
                        OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function formatTime(timeInput) {

                intValidNum = timeInput.value;

                if (intValidNum < 24) {
                    if (intValidNum.length == 2) {
                        timeInput.value = timeInput.value + ":";
                        return false;
                    }
                }
                if (intValidNum == 24) {
                    if (intValidNum.length == 2) {
                        timeInput.value = timeInput.value.length - 2 + "0:";
                        return false;
                    }
                }
                if (intValidNum > 24) {
                    if (intValidNum.length == 2) {
                        timeInput.value = "";
                        return false;
                    }
                }


                //Here is where I had trouble targeting the
                //mm and ss in order to add conditions (see hh above).
                //I used slice to assist me.
                //Please let me know if any of you have suggestions/enhancements/corrections.

                if (intValidNum.length == 5 && intValidNum.slice(-2) < 60) {
                    timeInput.value = timeInput.value;
                    return false;
                }
                if (intValidNum.length == 5 && intValidNum.slice(-2) > 60) {
                    timeInput.value = timeInput.value.slice(0, 2) + ":";
                    return false;
                }
                if (intValidNum.length == 5 && intValidNum.slice(-2) == 60) {
                    timeInput.value = timeInput.value.slice(0, 2) + ":00:";
                    return false;
                }


                if (intValidNum.length == 8 && intValidNum.slice(-2) > 60) {
                    timeInput.value = timeInput.value.slice(0, 5) + ":";
                    return false;
                }
                if (intValidNum.length == 8 && intValidNum.slice(-2) == 60) {
                    timeInput.value = timeInput.value.slice(0, 5) + ":00";
                    return false;
                }
            }
            //ContentPlaceHolder1_gvDept_txtStart_0
        </script>

        <script type="text/javascript">
            function time() {

                var stime = document.getElementById("ContentPlaceHolder1_gvDept_txtStart_0").value;
                var endTimeValue = document.getElementById("ContentPlaceHolder1_gvDept_txtEnd_0")
                    .value;
                if (endTimeValue == stime) {
                    alert("Start time end time should not be equal");

                } else if (endTimeValue > stime) {

                } else {
                    alert("Start time should not be less than end time")
                }

            }
        </script>

    </ContentTemplate>
</asp:Content>