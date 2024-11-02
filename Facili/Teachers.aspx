<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Teachers" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #GridView1 th,
        #GridView1 td {
            white-space: nowrap;
        }

        #GridView1 tr{
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {

            // 1.  #gvDept Table process for creating and population thead and tfoot

            var gridDept = document.querySelector('[id*=gvDept]');
            var gridViewHeader = gridDept.querySelector('.HeaderDatagrid');

            // Creating "<thead/>" and "<tfoot/>"
            var gridViewTHead = document.createElement("thead");

            // Appending table rows to the "<thead/>" and "<tfoot/>"
            gridViewTHead.append(gridViewHeader);

            // Prepending "<thead/>" and Appending "<tfoot/>" to the table
            gridDept.prepend(gridViewTHead);

            // 2.  #gvveh Table process for creating and population thead and tfoot

            var gridVehicle = document.getElementById('GridView1');
            var gridVehicleHeader = gridVehicle.querySelector('.HeaderDatagrid');

            // Creating "<thead/>" 
            var gridVehicleTHead = document.createElement("thead");

            // Appending table rows to the "<thead/>"
            gridVehicleTHead.append(gridVehicleHeader);

            // Prepending "<thead/>" to the table
            gridVehicle.prepend(gridVehicleTHead);

            $('table#GridView1>tbody>tr').click(function () {
                if ($(this).find(' input[type=radio]')[0]) {
                    $(this).find(' input[type=radio]')[0].click();
                }
            });


            $(gridDept).DataTable({
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

            $(gridVehicle).DataTable({
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

    <nav aria-label="Page breadcrumb">
        <ol class="breadcrumb mb-1 bg-white py-1 border">
            <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
            <li class="breadcrumb-item">Teachers</li>
        </ol>
    </nav>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Teachers</h5>

            <div class="row">
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-md-3 col-form-label pl-0">ID Number <span class="red_new">*</span></label>
                    <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtRegion" MaxLength="100">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvDept" CssClass="red_new offset-md-3"
                        ControlToValidate="txtRegion" Display="Dynamic" ErrorMessage="Please enter ID">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-auto col-form-label pl-0">Gender<span class="red_new">*</span></label>

                    <asp:RadioButtonList RepeatLayout="Flow" CssClass="col form-check form-check-inline mx-0 "
                        RepeatDirection="Horizontal" runat="server" ID="rblGender">
                        <asp:ListItem class="asp-listItem col-form-label mr-3" Value="M" Selected="True">Male
                        </asp:ListItem>
                        <asp:ListItem class="asp-listItem col-form-label" Value="F">Female</asp:ListItem>

                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvGender" CssClass="red_new offset-md-3"
                        ControlToValidate="rblGender" Display="Dynamic" ErrorMessage="Please enter Gender">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-md-3 col-form-label pl-0">First Name <span class="red_new">*</span></label>

                    <asp:TextBox CssClass="col-md-9 form-control" ID="txtFirst" runat="server" MaxLength="100">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator runat="server" ID="rfvFirst" CssClass="red_new offset-md-3"
                        ControlToValidate="txtFirst" Display="Dynamic" ErrorMessage="Please enter FirstName">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-md-3 col-form-label pl-0">Middle name</label>

                    <asp:TextBox CssClass="col-md-9 form-control" ID="txtMiddle" runat="server" MaxLength="50">
                    </asp:TextBox>

                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-md-3 col-form-label pl-0">Last Name<span class="red_new">*</span></label>

                    <asp:TextBox CssClass="col-md-9 form-control" ID="txtLast" runat="server" MaxLength="100">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator runat="server" ID="rfvLast" CssClass="red_new offset-md-3"
                        ControlToValidate="txtLast" Display="Dynamic" ErrorMessage="Please enter LastName">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-md-3 col-form-label pl-0">Username<span class="red_new">*</span></label>

                    <asp:TextBox CssClass="col-md-9 form-control" ID="txtUser" runat="server" MaxLength="100"
                        onblur="CheckAvailability();"></asp:TextBox>
                    <%-- <asp:Label CssClass="col-md-9 form-control" ID="Label1" runat="server" Text=""></asp:Label> --%>
                    <asp:RequiredFieldValidator runat="server" ID="rfvUser" CssClass="red_new offset-md-3"
                        ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="Please enter UserName">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-md-3 col-form-label pl-0">Email<span class="red_new">*</span></label>

                    <asp:TextBox CssClass="col-md-9 form-control" ID="txtEmail" runat="server" MaxLength="200">
                    </asp:TextBox>
                    <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ErrorMessage="Not valid email " CssClass="red_new offset-md-3"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ID="rfvEmail" CssClass="red_new offset-md-3"
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter Email">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-md-3 col-form-label pl-0">Phone Number <span class="red_new">*</span></label>

                    <div class="input-group col-md-9 px-0">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="my-addon"><asp:Label runat="server" ID="lblISD"></asp:Label></span></div>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtPhone" MaxLength="9"
                            ToolTip="Mobile No:(ex:784777777)"></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator ID="rePhone" runat="server" ControlToValidate="txtPhone"
                        Display="Dynamic" ErrorMessage="Not valid PhoneNumber " CssClass="red_new offset-md-3"
                        ValidationExpression="[0-9]{9}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ID="rfvPhone" CssClass="red_new offset-md-3"
                        ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Please enter PhoneNumber">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-140">
                    <label class="col-auto col-form-label pl-0">Status:<span class="red_new">*</span></label>

                    <asp:RadioButtonList RepeatLayout="Flow"
                        CssClass="col form-check form-check-inline mx-0 asp-radioButtonList"
                        RepeatDirection="Horizontal" runat="server" ID="rblStatus">
                        <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Active" Selected="True">Active
                        </asp:ListItem>
                        <asp:ListItem class="asp-listItem col-form-label" Value="InActive">InActive</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvStatus" ControlToValidate="rblStatus"
                        CssClass="red_new offset-md-3" Display="Dynamic" ErrorMessage="Please select  Status">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="table-responsive mb-1">
                <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1" runat="server"
                    AutoGenerateColumns="False" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" ShowFooter="false">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <HeaderStyle CssClass="HeaderDatagrid" />
                    <PagerStyle CssClass="gridViewPager" />
                    <AlternatingRowStyle CssClass="AlternateItemStyle" />
                    <Columns>
                        <asp:BoundField DataField="Sno" HeaderText="Sno" ItemStyle-Width="1%" />
                        <asp:TemplateField HeaderText="Class">
                            <ItemTemplate>
                                <asp:DropDownList style="min-width: 200px;" CssClass="form-control" ID="ddlClass"
                                    runat="server">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="ddlClass"
                                    CssClass="red_new" Display="Dynamic" ErrorMessage="Please Select Class">
                                </asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Programme/Combination/Stream">
                            <ItemTemplate>
                                <asp:DropDownList style="min-width: 200px;" CssClass="form-control" ID="ddlSection"
                                    runat="server" AppendDataBoundItems="true">

                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvSection" runat="server"
                                    ControlToValidate="ddlSection" CssClass="red_new" Display="Dynamic"
                                    ErrorMessage="Please Select Section"></asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subject">
                            <ItemTemplate>
                                <asp:DropDownList style="min-width: 200px;" CssClass="form-control" ID="ddlSubject"
                                    runat="server" AppendDataBoundItems="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
                                    ControlToValidate="ddlSubject" CssClass="red_new" Display="Dynamic"
                                    ErrorMessage="Please Select Subject"></asp:RequiredFieldValidator>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />

                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="1%">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"
                                    CausesValidation="false">Remove</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>


            <div class="form-group d-flex justify-content-end">
                <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="ButtonAdd" runat="server" Text="Add New Row"
                    CausesValidation="false" onclick="ButtonAdd_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnSubmit" runat="server" Text="Create"
                    OnClick="btnSubmit_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnUpdate" runat="server" Text="Update"
                    OnClick="btnUpdate_Click" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnDelete" runat="server" OnClick="btnDelete_Click"
                    OnClientClick="return confirm('Are you sure you want to delete the teacher?');" CausesValidation="false" Text="Delete" />
                <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel"
                    CausesValidation="false" OnClick="btnCancel_Click" Text="Cancel" />
            </div>


            <div id="TableGridView1" class="table-responsive mb-1">
                <asp:GridView ID="GridView1" ClientIDMode="Static" CssClass="table table-bordered mb-1" runat="server"
                    AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                    HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                    OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="false">
                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                    <PagerStyle CssClass="gridViewPager" />
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:RadioButton ID="rbDept" runat="server" AutoPostBack="true"
                                    oncheckedchanged="rbDept_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Teacher_Id_No" HeaderText="IDNo" />
                        <asp:BoundField DataField="Tea_Mas_Sno" HeaderText="Sector ID" ShowHeader="false">
                            <ItemStyle CssClass="hide" />
                            <HeaderStyle CssClass="hide" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Teacher_Gender" HeaderText="Gender" />
                        <asp:BoundField DataField="Teacher_First_Name" HeaderText="FirstName" />
                        <asp:BoundField DataField="Teacher_Middle_Name" HeaderText="MiddleName" />
                        <asp:BoundField DataField="Teacher_Last_Name" HeaderText="LastName" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="PhoneNo" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <!-- DataTable -->
    <script src="../assets/dataTable/js/jquery.dataTables.min.js"></script>
    <script src="../assets/dataTable/js/dataTables.bootstrap4.min.js"></script>

    <script type="text/javascript">
        function CheckAvailability() {
            var username = $("#<% =txtUser.ClientID %>").val();
            $.ajax({
                type: "POST",
                url: "Teachers.aspx/CheckUserName",
                data: '{username: "' + username + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (response.d == "false") {
                        alert("Email/Username available");
                        //document.getElementById("Label1").innerHTML = "Username is available";
                    } else if (response.d == "true") {
                        alert("Email/Username already exists");
                        //document.getElementById("Label1").innerHTML = "Username is NOT available";
                    }
                    
                }
            });
        };

        function ClearMessage() {
            $("#message").html("");
        };


        $(document).ready(function () {});
    </script>

</asp:Content>