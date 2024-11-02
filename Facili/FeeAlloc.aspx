<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeAlloc.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="PresentationLayer.Facili.FeeAlloc" %>
<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <script>
         $(document).ready(function () {

             // 1.  #Gridview1 Table process for creating and population thead

             var gridView1 = document.querySelector('table[id*=Gridview1]');
             var gridView1Header = gridView1.querySelector('tr.HeaderDatagrid');

             // Creating "<thead/>" and "<tfoot/>"
             var gridViewTHead = document.createElement("thead");

             // Appending table rows to the "<thead/>" and "<tfoot/>"
             gridViewTHead.append(gridView1Header);

             // Prepending "<thead/>" and Appending "<tfoot/>" to the table
             gridView1.prepend(gridViewTHead);

             // 2.  #gvDept Table process for creating and population thead and tfoot

             var gridVehicle = document.querySelector('table[id*=gvDept]');
             var gridVehicleHeader = gridVehicle.querySelector('.HeaderDatagrid');

             // Creating "<thead/>" and and "<tfoot/>"
             var gridVehicleTHead = document.createElement("thead");

             // Appending table rows to the "<thead/>" and and "<tfoot/>"
             gridVehicleTHead.append(gridVehicleHeader);

             // Prepending "<thead/>" to the table
             gridVehicle.prepend(gridVehicleTHead);

             $(gridView1).DataTable({
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
    <div>
        <asp:UpdatePanel ID="upRegistration" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnReg" />
            </Triggers>
        </asp:UpdatePanel>
        <ContentTemplate>
            <nav aria-label="Page breadcrumb">
                <ol class="breadcrumb mb-1 bg-white py-1 border">
                    <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                    <li class="breadcrumb-item">Fee Structure</li>
                </ol>
            </nav>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Fee Structure</h5>

                    <div class="row">
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblCPN">University/College/School
                                Name<span class="red_new">*</span></asp:Label>
                            <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtFaci" MaxLength="200"
                                Enabled="false"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCPN" CssClass="red_new offset-md-3"
                                ControlToValidate="txtFaci" Display="Dynamic" ErrorMessage="Please enter University/College/School name">
                            </asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="Label2">Academic
                                <span class="red_new">*</span>
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlAcademic">
                            </asp:DropDownList>
                            
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                CssClass="red_new offset-md-3" ControlToValidate="ddlAcademic" Display="Dynamic"
                                ErrorMessage="Please select academic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label CssClass="col-md-3 col-form-label pl-0" runat="server" ID="lblPB">Class
                                <span class="red_new">*</span>
                            </asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlClass">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCountry" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="Please select class">
                            </asp:RequiredFieldValidator>
                            

                        </div>
                        <div class="form-group col-sm-11 col-md-9 col-lg-6 row mx-0 format-120">
                            <asp:Label Cssclass="col-md-3 col-form-label pl-0" runat="server" ID="lblCity">
                                Programme/Combination/Stream<span class="red_new">*</span></asp:Label>
                            <asp:DropDownList CssClass="col-md-9 form-control" runat="server" ID="ddlSection">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDistrict" CssClass="red_new offset-md-3"
                                ControlToValidate="ddlSection" Display="Dynamic" ErrorMessage="Please select Programme/Combination/Stream">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="Gridview1" CssClass="table table-bordered mb-1 display" runat="server"
                            ShowFooter="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            AutoGenerateColumns="false" OnRowCreated="Gridview1_RowCreated"
                            HeaderStyle-CssClass="HeaderDatagrid">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="SNo" ItemStyle-Width="1%" />
                                <asp:TemplateField HeaderText="Fee Type">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-control mw-250px" runat="server" ID="ddlTypes"
                                            AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvFee" CssClass="red_new"
                                            Display="Dynamic" ControlToValidate="ddlTypes"
                                            ErrorMessage="Please select types"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Term">
                                    <ItemTemplate>
                                        <asp:DropDownList CssClass="form-control mw-250px" runat="server" ID="ddlTerm"
                                            AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvTerm" CssClass="red_new"
                                            Display="Dynamic" ControlToValidate="ddlTerm"
                                            ErrorMessage="Please select term"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount" ItemStyle-Width="2%">
                                    <ItemTemplate>
                                        <asp:TextBox CssClass="form-control" ID="txtAmount" runat="server" Width="150"
                                            MaxLength="20">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvME"
                                            ControlToValidate="txtAmount" Display="Dynamic" CssClass="red_new"
                                            ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ID="revME"
                                            ValidationExpression="^[0-9,]{1,21}$" CssClass="red_new"
                                            ControlToValidate="txtAmount" Display="Dynamic"
                                            ErrorMessage="Please enter valid count">
                                        </asp:RegularExpressionValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-Width="2%">
                                    <ItemTemplate>
                                        <asp:LinkButton CssClass="btn btn-sm btn-biz_logic" ID="LinkButton1"
                                            runat="server" CausesValidation="false" onclick="LinkButton1_Click">
                                            Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="form-group d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="ButtonAdd" runat="server"
                            CausesValidation="false" Text="Add New Row" onclick="ButtonAdd_Click" />

                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" ID="btnReg" runat="server" Text="Upload"
                            OnClick="btnReg_Click" />
                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server" ID="btnCancel" CausesValidation="false" OnClick="btnCancel_Click"
                            Text="Cancel" />
                    </div>

                    <div class="table-responsive mb-1">
                        <asp:GridView ID="gvDept" CssClass="table table-bordered mb-1 display" runat="server"
                            AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                            HeaderStyle-CssClass="HeaderDatagrid" PageSize="10"
                            OnPageIndexChanging="gvDept_PageIndexChanging" AllowPaging="false">
                            <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                            <PagerStyle CssClass="gridViewPager" />
                            <Columns>
                                <asp:BoundField DataField="Facility_Name" HeaderText="Facility" />
                                <asp:BoundField DataField="Class_Name" HeaderText="Class" />
                                <asp:BoundField DataField="Section_Name" HeaderText="Programme/Combination/Stream" />
                                <asp:BoundField DataField="Acad_Year" HeaderText="Academic" />
                                <asp:BoundField DataField="Term_Type" HeaderText="Term" />
                                <asp:BoundField DataField="Fee_Type" HeaderText="Fee" />
                                <asp:BoundField DataField="Requested_Amount" HeaderText="Amount"
                                    DataFormatString="{0:n0}" />
                                <asp:BoundField DataField="Posted_Date" HeaderText="Upload Date"
                                    DataFormatString="{0:dd/M/yyyy}" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </div>
</asp:Content>