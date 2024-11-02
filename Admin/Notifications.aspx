<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" MasterPageFile="~/Head_Admin.Master"
    Inherits="Schools.Admin.Notifications" %>
    <%@ MasterType VirtualPath="~/Head_Admin.master" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

            <link rel="stylesheet" href="../assets/select2/css/select2.min.css">
            <link rel="stylesheet" href="../assets/datepicker/gijgo.min.css">

            <script src="../assets/select2/js/select2.min.js"></script>
            <script src="../assets/datepicker/gijgo.min.js"></script>
            <script src="../assets/momentjs/moment-with-locales.js"></script>

            <style>
                /* Select_2 Style Section */

                .select2.select2-container.select2-container--default,
                /* .select2-search__field, */
                .iti.iti--allow-dropdown.iti--separate-dial-code {
                    width: 100% !important;
                    max-width: 100% !important;
                }

                .select2-container--default .select2-selection--multiple .select2-selection__rendered li {
                    font-size: 1rem;
                    font-weight: 400;
                    color: #fff;
                }

                .select2-container .select2-selection--multiple {
                    min-height: 38px !important;
                }

                .select2-dropdown,
                .select2-container--default .select2-selection--multiple,
                .select2-container--default.select2-container--focus .select2-selection--multiple {
                    border: solid #e9ecef 1px;
                    outline: 0;
                }

                .select2-container--default .select2-selection--single .select2-selection__arrow,
                .select2-container .select2-selection--single {
                    height: 38px !important;
                }

                .select2-container--default .select2-selection--single .select2-selection__rendered {
                    line-height: 38px;
                }

                .select2-container--default .select2-selection--multiple .select2-selection__choice__remove,
                .select2-container--default .select2-selection--multiple .select2-selection__choice__remove:hover {
                    color: #fff;
                }

                .select2-container--default .select2-selection--multiple .select2-selection__choice {
                    background-color: #5897fb;
                    border: 1px solid #5897fb;
                }

                .select2-container--default .select2-results__option[aria-selected="true"] {
                    display: none;
                }

                .select2-selection__choice {
                    max-width: 100% !important;
                    white-space: normal;
                }

                @media (min-width: 36em) {

                    /* format 190px */
                    .format-190>span[class*='col-'],
                    .format-190>label[class*='col-'] {
                        max-width: 8.75rem;
                        flex: 1 1 8.75rem;
                    }

                    .format-190>label[class*='col-']+*,
                    .format-190>span[class*='col-']+* {
                        flex: 1 1 calc(100% - 8.75rem);
                        max-width: calc(100% - 8.75rem);
                    }

                    .select2.select2-container.select2-container--default {
                        margin-left: 8.75rem;
                    }
                }


                /* Notification Section */
                .nav-tabs .nav-link {
                    border-radius: 0;
                    border-top: none;
                    border-bottom: none;
                    background-color: #fff !important;
                }

                .nav-tabs .nav-link.active {
                    border-bottom: solid 2px orange;
                }

                #notificationSubmit {
                    border-top-left-radius: 0;
                    border-bottom-left-radius: 0;
                }

                #selection-box {
                    margin-bottom: 0.5rem;
                }

                .select2.select2-container.select2-container--default {
                    margin: 0;
                    flex: 1 1 calc(100% - 56px);
                }

                .input-group .select2-selection.select2-selection--single {
                    border-top-right-radius: 0;
                    border-bottom-right-radius: 0;
                }

                #instance-wrapper .select2-selection.select2-selection--single {
                    border-radius: 4px;
                    border-radius: px;
                }

                .select2-container--default .select2-selection--single {
                    border: 1px solid #ced4da;
                }

                #selection-box .select2-search.select2-search--dropdown {
                    display: none;
                }

                .notification-p-sm {
                    padding-bottom: 2rem;
                }

                .label-wrapper {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .textarea-wrapper {
                    display: flex;
                    flex-direction: column;
                    border-radius: .25rem;
                }

                .gj-picker-bootstrap div[role="navigator"] {
                    display: flex;
                    align-items: center;
                }

                .label-wrapper .dynamic-content-btn,
                .textarea-wrapper .dynamic-content-btn {
                    margin-left: auto;
                    margin-bottom: .125rem;
                    border-radius: 50%;
                    outline: none;
                    box-shadow: none;
                }

                .button-icon-wrapper {
                    width: 1.4rem;
                    height: 1.4rem;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .gj-picker-bootstrap table tr td div,
                .gj-picker-bootstrap table tr th div {
                    width: 32px;
                }

                @media (min-width: 576px) {

                    #selection-box {
                        flex: 1 1 150px;
                        min-width: 150px;
                        margin: 0;
                    }

                    .no_outline_and_box-shadow {
                        outline: none !important;
                        box-shadow: none !important;
                    }

                    .message-inputs-wrapper {
                        display: flex;
                    }
                }

                @media (min-width: 576px) and (max-width: 1247.78px) {

                    .flexible-form {
                        display: flex;
                    }

                    .flexible-label {
                        min-width: 120px;
                    }
                }

                @media (min-width: 1248px) and (max-width: 1365.78px) {
                    .label-wrapper {
                        display: flex !important;
                    }

                    .label-wrapper .dynamic-content-btn {
                        display: inline-block !important;
                    }

                    .textarea-wrapper .dynamic-content-btn {
                        display: none !important;
                    }
                }

                @media (min-width: 1366px) {

                    .flexible-form {
                        display: flex;
                    }

                    .flexible-label {
                        min-width: 120px;
                    }
                }



                .modal-dialog {
                    max-width: 600px;
                }

                .modal-title {
                    text-transform: capitalize;
                }


                .datetime-schedules {
                    padding-top: .5rem;
                }

                .table-button-wrapper {
                    width: 4.5rem;
                    display: flex;
                    justify-content: space-between;
                }

                .th-sno {
                    width: 1rem;
                }

                .th-actions {
                    width: 5.5rem;
                }

                .table-button-wrapper>button {
                    width: 32px;
                    height: 32px;
                }

                .inactive-state-wrapper {
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(255, 255, 255, 0.875);
                    z-index: 10;
                }

                .inactive-state-wrapper,
                .inactive-state-wrapper p {
                    opacity: 0;
                    transition: opacity .3s ease-in-out;
                }

                .inactive-state-wrapper p {
                    font-size: 1rem;
                    font-weight: 600;
                }

                .inactive-state-wrapper:hover,
                .inactive-state-wrapper:hover p {
                    opacity: 1;
                }

                .state-controller {
                    z-index: 20;
                    top: 5px;
                    right: 5px;
                }

                .custom-control-input {
                    left: auto;
                    right: 0px;
                    opacity: 1;
                }
            </style>

            <script>

               /* function pageLoad() {

                    var $internalUser = $('#internal-user');
                    var $schoolAdmin = $('#school-admin');
                    var $parents = $('#parent-of');

                    $internalUser.select2();
                    $schoolAdmin.select2();
                    $parents.select2();


                    var $bank_scheduledDate = $('#scheduled');
                    var $bank_table = $('#bank_scheduledDate_table');
                    bankDatepicker.Initialize($bank_scheduledDate, $bank_table);

                    bankInstances.Initialize();
                    bankStates.Initialize();
                }


                var bankInstances = (function () {
                    function BankNotificationInstance_CLASS() {
                        this.Initialize = function () {
                            smsCheckboxHandler();
                            emailCheckboxHandler();
                        }
                    }

                    //#region Element Query Section

                    function getSmsCheckbox() {
                        return $('#bank_sms');
                    }

                    function getEmailCheckbox() {
                        return $('#bank_email');
                    }

                    function getSmsTemplateBox() {
                        return $('#sms_template_wrapper');
                    }

                    function getEmailTemplateBox() {
                        return $('#email_template_wrapper');
                    }
                    //#endregion


                    //#region Instance Animation Section

                    function instanceFadeIn($element) {
                        $element.fadeIn();
                    }

                    function instanceFadeOut($element) {
                        $element.fadeOut();
                    }

                    //#endregion


                    function smsCheckboxHandler() {
                        var $sms_checkbox = getSmsCheckbox();
                        var $sms_template = getSmsTemplateBox();

                        $sms_template.show();

                        $sms_checkbox.on('change', function () {
                            var is_checked = hasCheckedProperty($sms_checkbox);

                            if (is_checked) { instanceFadeIn($sms_template); }
                            else {

                                var $email_checkbox = getEmailCheckbox();
                                var is_email_checked = hasCheckedProperty($email_checkbox);

                                if (is_email_checked) { instanceFadeOut($sms_template); }
                                else {
                                    $sms_checkbox.prop('checked', true);
                                    alert('There must be atleast one instance selected');
                                }
                            }
                        });
                    }

                    function emailCheckboxHandler() {

                        var $email_checkbox = getEmailCheckbox();
                        var $email_template = getEmailTemplateBox();

                        $email_template.hide();

                        $email_checkbox.on('change', function () {
                            var is_checked = hasCheckedProperty($email_checkbox);

                            if (is_checked) { instanceFadeIn($email_template); }
                            else {

                                var $sms_checkbox = getSmsCheckbox();
                                var is_sms_checked = hasCheckedProperty($sms_checkbox);

                                if (is_sms_checked) { instanceFadeOut($email_template); }
                                else {
                                    $email_checkbox.prop('checked', true);
                                    alert('There must be atleast one instance selected');
                                }
                            }
                        });
                    }


                    function hasCheckedProperty($checkbox) {
                        return $checkbox[0].checked;
                    }

                    return new BankNotificationInstance_CLASS();
                }());


                var bankStates = (function () {
                    function States_CLASS() {
                        this.Initialize = function () {
                            manageIndividualStates();
                            manageGroupStates();
                        }
                    }

                    function manageIndividualStates() {
                        var $bankUsers_state_checkbox = $('#bank_internal-user_state');
                        var $schoolAdmins_state_checkbox = $('#bank_school-admin_state');
                        var $parents_state_checkbox = $('#bank_parent-of_state');

                        handleBankUsersChecking($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox);
                        handleSchoolAdminsChecking($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox);
                        handleParentsChecking($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox);
                    }

                    function manageGroupStates() {
                        var $groupState = $('#group_states');
                        var groupStatesCheckboxes = getGroupStatesCheckboxes();

                        $groupState.on('change', 'input[type=checkbox]', function () {

                            var groupStatesCheckboxesArray = $.map(groupStatesCheckboxes, function (data) { return data });

                            var hasCheckedValues = groupStatesCheckboxesArray.some(function (checkbox) {
                                return $(checkbox).prop('checked') == true;
                            });

                            var $getIndividualStatesCheckboxes = getIndividualStatesCheckboxes();

                            if (hasCheckedValues) {
                                disableIndividualStates();
                            } else {
                                enableIndividualStates();
                            }

                        })

                    }

                    function getGroupStatesCheckboxes() {
                        return $('#group_states').find('input[type = checkbox]');
                    }

                    function getIndividualStatesCheckboxes() {
                        return $('#individual_states').find('input[type = checkbox]');
                    }

                    function disableGroupStates() {
                        var $groupStatesCheckboxes = getGroupStatesCheckboxes();

                        $checkboxes = $groupStatesCheckboxes.prop('disabled', true);
                    }

                    function enableGroupStates() {
                        var $groupStatesCheckboxes = getGroupStatesCheckboxes();

                        $checkboxes = $groupStatesCheckboxes.prop('disabled', false);
                    }

                    function disableIndividualStates() {
                        var $getIndividualStatesCheckboxes = getIndividualStatesCheckboxes();

                        $getIndividualStatesCheckboxes.prop('disabled', true);
                    }

                    function enableIndividualStates() {
                        var $getIndividualStatesCheckboxes = getIndividualStatesCheckboxes();

                        $getIndividualStatesCheckboxes.prop('disabled', false);
                    }

                    function handleBankUsersChecking($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox) {
                        $bankUsers_state_checkbox.on('change', function () {
                            showOnlyBankUsersStateActive($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox);
                        });
                    }

                    function handleParentsChecking($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox) {
                        $parents_state_checkbox.on('change', function () {
                            showOnlyParentsStateActive($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox)
                        });
                    }

                    function handleSchoolAdminsChecking($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox) {
                        $schoolAdmins_state_checkbox.on('change', function () {
                            showOnlySchoolAdminsStateActive($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox)
                        });
                    }

                    function handleDefaultCheckbox($checkbox) {
                        if ($checkbox.prop('checked') == true) {
                            $checkbox.parent().prev().hide();
                            disableGroupStates();
                        } else {
                            $checkbox.parent().prev().show();
                            enableGroupStates();
                        }
                    }

                    function showOnlyBankUsersStateActive($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox) {

                        handleDefaultCheckbox($bankUsers_state_checkbox);

                        $schoolAdmins_state_checkbox.prop('checked', false)
                            .parent().prev().show();

                        $parents_state_checkbox.prop('checked', false)
                            .parent().prev().show();
                    }

                    function showOnlySchoolAdminsStateActive($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox) {

                        handleDefaultCheckbox($schoolAdmins_state_checkbox);

                        $bankUsers_state_checkbox.prop('checked', false)
                            .parent().prev().show();

                        $parents_state_checkbox.prop('checked', false)
                            .parent().prev().show();
                    }

                    function showOnlyParentsStateActive($bankUsers_state_checkbox, $schoolAdmins_state_checkbox, $parents_state_checkbox) {

                        handleDefaultCheckbox($parents_state_checkbox);

                        $schoolAdmins_state_checkbox.prop('checked', false)
                            .parent().prev().show();

                        $bankUsers_state_checkbox.prop('checked', false)
                            .parent().prev().show();
                    }


                    return new States_CLASS();
                }());


                var bankDatepicker = (function () {
                    function BankDatepicker_CLASS() {
                        this.Initialize = function ($input, $table) {
                            initializeDatepicker($input);
                            inputValidation($input);

                            addScheduledDate($input, $table);
                            editScheduledDate($input, $table);
                            deleteScheduledDate($table);

                            populateScheduledDateTable($table);
                        }
                    }


                    var scheduledDateList = ["Monday, 29 August 2022", "Tuesday, 30 August 2022"];
                    var sortedScheduledDate = [];

                    function getAddScheduleButton() { return $('button#bank_add-date'); }

                    function getEditScheduleButton() { return $('button#bank_edit-date'); }


                    function addScheduledDate($input, $table) {
                        var $addButton = getAddScheduleButton();

                        $addButton.on('click', function (e) {
                            e.preventDefault();

                            var inputValue = $input.val();

                            if (inputValue.length == 0) {
                                alert("Please enter scheduled date");
                                return;
                            }

                            if (onAdditionValidation($input, inputValue)) { return; }

                            if (onRepeatedDateValidation(inputValue, sortedScheduledDate)) {
                                $input.val('');
                                alert('You cannot repeat ' + inputValue + ' more than once.');
                                return;
                            }

                            scheduledDateList.push(inputValue);
                            $input.val('');

                            populateScheduledDateTable($table);

                            return false;
                        })
                    }


                    function editScheduledDate($input, $table) {
                        $table.find('tbody').on('click', 'button[data-btn-type="edit"]', function (e) {
                            e.preventDefault();
                            hideTooltip();

                            var scheduled_date = getCurrentScheduledDate($(this));
                            $input.val(scheduled_date).trigger('change');

                            activateEditSetup($input, $table);
                        })
                    }


                    function activateEditSetup($input, $table) {
                        var current_scheduled_date = $input.val();

                        $addButton = getAddScheduleButton();
                        $editButton = getEditScheduleButton();

                        if (current_scheduled_date.length > 0) {
                            showEditScheduleButton($addButton, $editButton);
                            handeEditScheduleDateProcess($editButton, $input, $table, current_scheduled_date);

                        } else {
                            showAddScheduleButton($addButton, $editButton);
                        }
                    }


                    function handeEditScheduleDateProcess($editButton, $input, $table, current_scheduled_date) {

                        $editButton.off().on('click', function (e) {
                            e.preventDefault();
                            hideTooltip();

                            var new_scheduled_date = $input.val();
                            $addButton = getAddScheduleButton();
                            showAddScheduleButton($addButton, $editButton);

                            if (new_scheduled_date.length == 0) {
                                alert("Please enter scheduled date");
                                return;
                            }

                            if (onAdditionValidation($input, new_scheduled_date)) { return; }

                            if (onRepeatedDateValidation(new_scheduled_date, sortedScheduledDate)) {
                                $input.val('');
                                alert('You cannot repeat ' + new_scheduled_date + ' more than once.');
                                return;
                            }

                            removeScheduledDate(current_scheduled_date);
                            scheduledDateList.push(new_scheduled_date);

                            populateScheduledDateTable($table);
                            $input.val('');
                        });

                    }


                    function showAddScheduleButton($addButton, $editButton) {
                        $addButton.show();
                        $editButton.hide();
                    }


                    function showEditScheduleButton($addButton, $editButton) {
                        $addButton.hide();
                        $editButton.show();
                    }


                    function deleteScheduledDate($table) {
                        $table.find('tbody').on('click', 'button[data-btn-type="delete"]', function (e) {
                            e.preventDefault();
                            hideTooltip();

                            var scheduled_date = getCurrentScheduledDate($(this));

                            removeScheduledDate(scheduled_date);

                            populateScheduledDateTable($table);

                            return false;
                        });
                    }


                    function getCurrentScheduledDate($this) {
                        var $tr = $this.closest('tr');
                        return $tr.children().eq(1).find('span').text();
                    }


                    function removeScheduledDate(scheduled_date) {
                        var index = scheduledDateList.indexOf(scheduled_date);

                        if (index > -1) {
                            scheduledDateList.splice(index, 1);
                        }
                    }


                    function getSortedScheduledDate(scheduledDateList) {
                        return scheduledDateList.sort(function (a, b) { return new Date(a) - new Date(b) });
                    }


                    function populateScheduledDateTable($table) {
                        $tbody = $table.find('tbody');

                        $tbody.empty();

                        sortedScheduledDate = getSortedScheduledDate(scheduledDateList);

                        if (sortedScheduledDate.length == 0) { $table.parent().addClass('d-none') };

                        if (sortedScheduledDate.length > 0) {
                            $table.parent().removeClass('d-none');

                            sortedScheduledDate.forEach(function (value, index) {
                                var sno = index + 1;
                                $tbody.append(appendToTableBody(sno, value));
                                $tbody.children().eq(index).find('input').val(value);
                            });
                        };
                    }


                    function appendToTableBody(sno, value) {
                        return '<tr>\n' +
                            '\t<td class="text-center">' + sno + '.</td>\n' +
                            '\t<td>\n' +
                            '\t\t<span>' + value + '</span>\n' +
                            '\t\t<input type = "hidden">\n' +
                            '\t</td>\n' +
                            '\t<td class="py-2">\n' +
                            '\t\t<div class="table-button-wrapper">\n' +
                            '\t\t\t<button type = "button" class="btn btn-outline-primary px-2" data-btn-type="edit" data-toggle="tooltip" data-html="true" title = "<b>Edit scheduled time</b>">\n' +
                            '\t\t\t\t<i class="fas fa-pencil-alt"></i>\n' +
                            '\t\t\t</button>\n' +
                            '\t\t\t<button type="button" class="btn btn-outline-danger px-2" data-btn-type="delete" data-toggle="tooltip" data-html="true" title="<b>Delete scheduled time</b>">\n' +
                            '\t\t\t\t<i class="fas fa-trash-alt"></i>\n' +
                            '\t\t\t</button>\n' +
                            '\t\t</div>\n' +
                            '\t</td>\n' +
                            '</tr>';
                    }





                    function hideTooltip() {
                        $('[data-toggle="tooltip"]').tooltip('hide');
                    }

                    function initializeDatepicker($input) {
                        $input.datepicker({
                            minDate: minimumDate(),
                            uiLibrary: 'bootstrap4',
                            format: 'dddd, dd mmmm yyyy',
                            iconsLibrary: 'fontawesome',
                            modal: true,
                            footer: true,
                        });
                    }


                    function inputValidation($input) {
                        $input.on('change input', function () {
                            var inputValue = new Date($(this).val());

                            var time_difference = moment().diff(inputValue, 'days');

                            backdateValidationsAlert($input, time_difference);
                        });
                    }


                    function onAdditionValidation($input, inputValue) {
                        var inputDate = moment(new Date(inputValue));
                        if (validateBackdates($input, inputDate)) { return true }

                        return false;
                    }


                    function onRepeatedDateValidation(inputValue, sortedScheduledDate) {
                        var filtered = sortedScheduledDate.filter(function (value) { return inputValue == value });
                        return filtered.length > 0;
                    }


                    function validateBackdates($input, inputDate) {
                        var todayDate = moment();
                        var time_difference = todayDate.diff(inputDate, 'days');

                        return backdateValidationsAlert($input, time_difference);
                    }


                    function backdateValidationsAlert($input, time_difference) {
                        if (time_difference > 0) {
                            $input.val('');

                            var current_date = moment().format('DD MMMM YYYY');
                            alert("Select valid date, today is " + current_date);

                            return true;
                        }

                        return false;
                    }


                    function minimumDate() {
                        var minimum_date = moment().subtract(1, 'days')._d;
                        return minimum_date;
                    }

                    return new BankDatepicker_CLASS();
                }());*/

            </script>

        </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div>
                <asp:UpdatePanel ID="upRegistration" runat="server">
                    <ContentTemplate>

                        <nav aria-label="Page breadcrumb">
                            <ol class="breadcrumb mb-1 bg-white py-1 border">
                                <li class="breadcrumb-item active" aria-current="page"><a href="HvL7a8">Home</a></li>
                                <li class="breadcrumb-item">Notifications</li>
                            </ol>
                        </nav>

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title mb-3">Notifications</h5>

                                <div class="row d-none">
                                    <div class="form-group col-sm-12 col-md-10 col-lg-8 col-xl-7 row mx-0 format-190">
                                        <label class="col-md-3 col-form-label pl-0">Description <span
                                                class="red_new">*</span></label>
                                        <asp:TextBox CssClass="col-md-9 form-control" runat="server" ID="txtDesc"
                                            TextMode="MultiLine" Rows="8" Columns="20" MaxLength="400"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-sm-12 col-md-10 col-lg-8 col-xl-7 row mx-0 format-190">
                                        <label class="col-md-3 col-form-label pl-0">Category <span
                                                class="red_new">*</span></label>
                                        <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0 flex-wrap"
                                            AutoPostBack="true" RepeatDirection="Vertical" runat="server" ID="rblCat"
                                            RepeatLayout="Flow" OnSelectedIndexChanged="rblCat_SelectedIndexChanged">
                                            <asp:ListItem class="asp-listItem col-form-label mr-3"
                                                Value="Internal Users" Selected="True">Internal Users</asp:ListItem>
                                            <asp:ListItem class="asp-listItem col-form-label mr-3"
                                                Value="University/College/School Admins">
                                                University/College/School Admins </asp:ListItem>
                                            <asp:ListItem class="asp-listItem col-form-label" Value="Parents">Parents
                                            </asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="form-group col-sm-12 col-md-10 col-lg-8 col-xl-7 row mx-0 format-190">
                                        <label class="col-md-3 col-form-label pl-0">Notify Group <span
                                                class="red_new">*</span></label>
                                        <asp:RadioButtonList CssClass="col form-check form-check-inline mx-0"
                                            AutoPostBack="true" RepeatDirection="Vertical" runat="server" ID="rblNG"
                                            RepeatLayout="Flow" OnSelectedIndexChanged="rblNG_SelectedIndexChanged">
                                            <asp:ListItem class="asp-listItem col-form-label mr-3" Value="Groups"
                                                Selected="True">Group</asp:ListItem>
                                            <asp:ListItem class="asp-listItem col-form-label" Value="Individual">
                                                Individual</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="form-group col-sm-12 col-md-10 col-lg-8 col-xl-7 row mx-0 format-190">
                                        <label class="col-md-3 col-form-label pl-0"> <span
                                                class="red_new"></span></label>
                                        <asp:ListBox CssClass="form-control select2" runat="server" ID="ddlGroup"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </div>

                                    <div
                                        class="form-group col-12 col-md-10 col-lg-8 col-xl-7 d-flex justify-content-end">
                                        <asp:Button CssClass="btn btn-sm btn-biz_logic" ID="btnReg" runat="server"
                                            Text="Submit" OnClick="btnReg_Click" />
                                        <asp:Button CssClass="btn btn-sm btn-biz_logic ml-1" runat="server"
                                            ID="btnCancel" CausesValidation="false" Text="Reset"
                                            OnClick="btnCancel_Click" />
                                    </div>
                                </div>

                                <hr>


                                <div class="row" style="max-width: 1400px;">
                                    <div class="col-md-10 col-lg-8 col-xl-6 notification-p-sm">
                                        <div class="form-group d-flex flexible-form mb-2">
                                            <label for="instance" class="flexible-label pr-4">Instance<span
                                                    class="text-danger">*</span></label>
                                            <div class="custom-control custom-checkbox mr-3">
                                                <asp:CheckBox runat="server" ID="chkS"  OnCheckedChanged="chkS_SelectedIndexChanged" AutoPostBack="true" Checked="true"  />
                                                
                                                <label class="custom-control" for="bank_sms">SMS</label>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <asp:CheckBox runat="server" ID="chkE" OnCheckedChanged="chkE_SelectedIndexChanged" AutoPostBack="true"  />
                                                <label class="custom-control" for="bank_email">Email</label>
                                                
                                            </div>
                                        </div>
                                        
                                        <div id="divS" runat="server" class="form-group flexible-form">
                                            <div class="label-wrapper d-flex d-sm-inline-block">
                                                <label for="message" class="flexible-label">SMS Template<span
                                                        class="text-danger">*</span></label>
                                                <button type="button"
                                                    class="dynamic-content-btn btn btn-secondary btn-sm p-0 d-inline-block d-sm-none"
                                                    data-toggle="modal" data-target="#sms-modal">
                                                    <span class="button-icon-wrapper" data-toggle="tooltip"
                                                        data-html="true" title="<b>Dynamic SMS data contents</b>">
                                                        <i class="fas fa-info"></i>
                                                    </span>
                                                </button>
                                            </div>
                                            <div class="textarea-wrapper w-100">
                                                <button type="button"
                                                    class="dynamic-content-btn btn btn-secondary btn-sm p-0 d-none d-sm-inline-block"
                                                    data-toggle="modal" data-target="#sms-modal">
                                                    <span class="button-icon-wrapper" data-toggle="tooltip"
                                                        data-html="true" title="<b>Dynamic SMS data contents</b>">
                                                        <i class="fas fa-info"></i>
                                                    </span>
                                                </button>
                                                <asp:TextBox runat="server" CssClass="form-control flexible-field" TextMode="MultiLine" ID="txtS" Rows="5" Columns="10"></asp:TextBox>
                                                <small class="form-text text-muted">SMS template is restricted to
                                                    maximum 160
                                                    characters</small>
                                            </div>
                                        </div>

                                        <div id="divE" runat="server" class="form-group flexible-form">
                                            <div class="label-wrapper d-flex d-sm-inline-block">
                                                <label for="message" class="flexible-label">Email Template<span
                                                        class="text-danger">*</span></label>
                                                <button type="button"
                                                    class="dynamic-content-btn btn btn-secondary btn-sm p-0 d-inline-block d-sm-none"
                                                    data-toggle="modal" data-target="#email-modal">
                                                    <span class="button-icon-wrapper" data-toggle="tooltip"
                                                        data-html="true" title="<b>Dynamic Email data contents</b>">
                                                        <i class="fas fa-info"></i>
                                                    </span>
                                                </button>
                                            </div>
                                            <div class="textarea-wrapper w-100">
                                                <button type="button"
                                                    class="dynamic-content-btn btn btn-secondary btn-sm p-0 d-none d-sm-inline-block"
                                                    data-toggle="modal" data-target="#email-modal">
                                                    <span class="button-icon-wrapper" data-toggle="tooltip"
                                                        data-html="true" title="<b>Dynamic Email data contents</b>">
                                                        <i class="fas fa-info"></i>
                                                    </span>
                                                </button>
                                                <asp:TextBox runat="server" CssClass="form-control flexible-field" TextMode="MultiLine" ID="txtE" Rows="5" Columns="10"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group flexible-form">
                                            <label for="scheduled-on" class="flexible-label col-form-label">Scheduled
                                                on</label>
                                            <div class="w-100">
                                                <div class="d-flex">
                                                    <asp:TextBox runat="server" ID="txtSch" CssClass="form-control flexible-field"></asp:TextBox>
                                                            <asp:ImageButton CssClass="input-group-text" runat="server"
                                                    CausesValidation="false" ID="iPopup1" ImageUrl="/images/calendar.png"
                                                    Height="38" />
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                                        PopupButtonID="iPopup1" TargetControlID="txtSch" Format="MM/dd/yyyy">
                                                    </ajaxToolkit:CalendarExtender>
                                                    
                                                    <asp:ImageButton runat="server" ID="btnS" CssClass="btn btn-outline-primary ml-2" ImageUrl="/images/sch.png" Height="40px" Width="40px" OnClick="btnS_Click" />
                                                 <br />
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvFDate" ControlToValidate="txtSch"
                                                        Display="Dynamic" CssClass="red_new offset-md-3"
                                                        ErrorMessage="Please select scheduled date">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:comparevalidator ID="cmpFDate" runat="server" Display="Dynamic"
                                                        errormessage="The date must be greater than or equal to today date"
                                                        CssClass="red_new offset-md-3"
                                                        valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                                                        controltovalidate="txtSch" type="date" Operator="GreaterThanEqual" />
                                                </div>
                                                
                                                <div class="datetime-schedules table-responsive ">
                                                    <asp:GridView ID="Gridview1" CssClass="table table-bordered mb-1 display" runat="server"
                                                    AutoGenerateColumns="false" Width="100%" AlternatingRowStyle-CssClass="AlternateItemStyle"
                                                    HeaderStyle-CssClass="HeaderDatagrid" AllowPaging="false" OnRowCreated="Gridview1_RowCreated">
                                                    <RowStyle HorizontalAlign="Left" CssClass="FirstItemStyle" />
                                                    <PagerStyle CssClass="gridViewPager" />
                                                    <Columns>
                                                       <asp:BoundField DataField="RowNumber" HeaderText="SNo" ItemStyle-Width="1%" />
                                                        <asp:TemplateField HeaderText="Scheduled Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblS" runat="server" CssClass="form-control">
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        
                                                    </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="1%">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"
                                                                    onclick="LinkButton1_Click">Remove</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                    </Columns>
                                                </asp:GridView>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="col-md-10 col-lg-8 col-xl-6">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <button class="nav-link active bg-white py-1" id="nav-group-tab"
                                                    data-toggle="tab" data-target="#nav-group" type="button" role="tab"
                                                    aria-controls="nav-group" aria-selected="true">Group</button>
                                                <button class="nav-link py-1" id="nav-individual-tab bg-white"
                                                    data-toggle="tab" data-target="#nav-individual" type="button"
                                                    role="tab" aria-controls="nav-individual"
                                                    aria-selected="false">Individual</button>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent">
                                            <div class="tab-pane fade show active py-2" id="nav-group" role="tabpanel"
                                                aria-labelledby="nav-group-tab">

                                                <div class="form-group m-0">
                                                    <label for="message-box" class="mb-1">Message To<span
                                                            class="text-danger">*</span></label>
                                                </div>

                                                <div id="group_states" class="jumbotron mb-0 px-3 py-3">
                                                    <div class="custom-control custom-checkbox">
                                                        <asp:CheckBox runat="server" ID="chkIU" AutoPostBack="true" OnCheckedChanged="chkIU_CheckedChanged"   />
                                                        
                                                        <label class="custom-control" for="bank_user">Internal
                                                            User</label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <asp:CheckBox runat="server" ID="chkSA" AutoPostBack="true" OnCheckedChanged="chkSA_CheckedChanged"   />
                                                        <label class="custom-control" for="super-admins">University/College/School
                                                            Admins</label>
                                                    </div>
                                                    <div class="custom-control custom-checkbox">
                                                        <asp:CheckBox runat="server" ID="chkP" AutoPostBack="true" OnCheckedChanged="chkP_CheckedChanged"  />
                                                        <label class="custom-control"
                                                            for="parents">Parents</label>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane fade py-2" id="nav-individual" role="tabpanel"
                                                aria-labelledby="nav-individual-tab">

                                                <label for="message-box" class="mb-1">Message To<span
                                                        class="text-danger">*</span></label>

                                                <div id="individual_states" class="jumbotron mb-0 px-3 py-3">
                                                    <div class="form-group mb-2 position-relative">
                                                        <label for="internal-user" class="mb-1">Internal Users</label>
                                                        <asp:ListBox CssClass="custom-select form-control px-1" runat="server" ID="lbIU" SelectionMode="Multiple"></asp:ListBox>
                                                        
                                                        <div class="state-controller position-absolute">
                                                            <asp:RadioButton runat="server" ID="rblIU" CssClass="custom-control-input" OnCheckedChanged="rblIU_CheckedChanged" AutoPostBack="true" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group mb-2 position-relative">
                                                        <label for="school-admin" class="mb-1">University/College/School Admins</label>
                                                        <asp:ListBox CssClass="custom-select form-control px-1" runat="server" ID="lbSA" SelectionMode="Multiple"></asp:ListBox>
                                                        <div class="state-controller position-absolute">
                                                            <asp:RadioButton runat="server" ID="rblSA" CssClass="custom-control-input" OnCheckedChanged="rblSA_CheckedChanged" AutoPostBack="true" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group mb-2 position-relative">
                                                        <label for="parent-of" class="mb-1">Parents</label>
                                                        <asp:ListBox CssClass="custom-select form-control px-1" runat="server" ID="lbP" SelectionMode="Multiple"></asp:ListBox>
                                                        <div class="state-controller position-absolute">
                                                            <asp:RadioButton runat="server" ID="rblP" CssClass="custom-control-input" OnCheckedChanged="rblP_CheckedChanged" AutoPostBack="true" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-10 col-lg-8 col-xl-12 text-right form-group">
                                        <asp:Button runat="server" ID="btnSend" CssClass="btn btn-primary" Text="Send"  OnClick="btnReg_Click" />
                                       
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        
                        <!-- Modal -->
                        <div class="modal fade px-1" id="sms-modal" data-backdrop="static" tabindex="-1" role="dialog"
                            aria-labelledby="modelTitleId" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">SMS Dynamic Data</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        SMS dynamic contents here

                                        <p>{Parent} gives dynamic data.</p>
                                        <p>{University/College/School} gives school name data.</p>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary btn-sm"
                                            data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade px-1" id="email-modal" data-backdrop="static" tabindex="-1" role="dialog"
                            aria-labelledby="modelTitleId" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Email Dynamic Data</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Email Dynamic Contents Here
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary btn-sm"
                                            data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Content>