$(document).ready(function () {
    var dropDownLinks = $('.app-link__dropdown');
    var arrayDropDownLinks = dropDownLinks.toArray();

    // Click ellipsisBtn on small screen
    var ellipsisBtn = $('#btn-ellipsis');
    var backDrop = document.querySelector('.back-drop');
    var accountInfo = document.querySelector('.account-info');
    var linkLogout = document.getElementById('linkLogout');
    var dropDownDiv = document.querySelector('.account-info .dropdown-menu');


    var loginTime = document.querySelector('[id$=lbl_Time]');
    $('#loginTime').text(loginTime.textContent);

    $(ellipsisBtn).click(function (e) {
        e.preventDefault();
        if ($('.sidebar').hasClass('show')) {
            $('.sidebar').removeClass('show');
            $('body').removeClass('modal-open');
            $('.hamburger').removeClass('is-active');
            accountInfo.classList.toggle('active');
        } else {
            backDrop.classList.toggle('show');
            accountInfo.classList.toggle('active');
        }
    });

    // Remove backdrop and account info from the display
    $(linkLogout).click(function (e) {
        backDrop.classList.remove('show');
        accountInfo.classList.remove('active');
    });

    // click on backdrop to remove the account info
    $(backDrop).click(function (e) {
        e.preventDefault();
        if ($(accountInfo).hasClass('active')) {
            accountInfo.classList.remove('active');
        }
    });

    $(window).resize(function () {
        if (window.innerWidth < 768) {
            if ($(accountInfo).hasClass('active')) {
                $(dropDownDiv).removeClass('show');
            }
        }

        if (window.innerWidth >= 768) {
            $(accountInfo).removeClass('active');
            $(backDrop).removeClass('show');
        }
    });

    //Make sidebar menu to be full visible for user using Tablets

    var theSidebar = $('.sidebar');
    var dropdownLists = $('.app-nav__dropdown');
    var dropDownLinks = $('.app-link__dropdown');

    $('.links.app-link').click(function () {

        if (window.innerWidth >= 992 && window.innerWidth < 1248) {
            if ($(theSidebar).hasClass('show-lite')) {

            } else {
                $(theSidebar).addClass('show-lite')
                return false;
            }

        }

    });

    // if (condition) {
    window.addEventListener('click', function (e) {
        if ($(theSidebar).hasClass('show-lite')) {
            if (e.target.classList.contains('link-thumbnail') ||
                e.target.classList.contains('app-link__text') ||
                e.target.classList.contains('dropdown-icon') ||
                e.target.classList.contains('fa-angle-down') ||
                e.target.classList.contains('app-link') ||
                e.target.classList.contains('app-nav__item') ||
                e.target.classList.contains('app-menu') ||
                e.target === $(theSidebar)
            ) {
                return true;
            } else {
                $(theSidebar).removeClass('show-lite');

                if ($(theSidebar).hasClass("show-lite") ===
                    false) {
                    $(dropdownLists).css('display', 'none');
                    $(dropDownLinks).removeClass('active');
                }
            }
        }
    });

    // }

    arrayDropDownLinks.forEach(function (dropDownLink) {
        $(dropDownLink).click(function () {
            compareLinks(dropDownLink, arrayDropDownLinks);
        });
    });

    var notificationBell = $('#notifyID');
    var notificationBox = document.getElementById('notificationBox');
    $(notificationBell).click(function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
    });


    $(document).mouseup(function (e) {
        if ($(notificationBell).hasClass('active')) {
            if ((e.target != notificationBox) &&
                (e.target.parentNode != notificationBox) &&
                (e.target.parentNode.parentNode != notificationBox) &&
                (e.target.parentNode.parentNode.parentNode != notificationBox)) {
                $(notificationBell).removeClass('active');
            }
        }
    });


    $('#contTarget').dropdown();
    $('#my-select').dropdown();
    $('.family_member').dropdown();
    $('#mySelect').dropdown({
        // maxSelections: 1000
    });

    jQuery('.ui.dropdown').dropdown({
        clearable: true,
    });


    var inputNumeral = document.querySelector('.input-numeral');

    if (inputNumeral) {
        var cleaveNumeral = new Cleave(inputNumeral, {
            numeral: true,
            numeralThousandsGroupStyle: 'thousand'
        });
    }




    // #############################################################################################################
    // #############################################################################################################
    // #############################################################################################################
    // #############################################################################################################
    // #############################################################################################################
    var addContributionBtn = $('#addBtn');

    $(addContributionBtn).click(function (e) {
        e.preventDefault();
        $(this).next().fadeOut();
        var contrForm = $('#contrForm');
        var clone = $(contrForm).find('.row').clone();
        $('#cLists').html(clone);

    });




    // #############################################################################################################
    // #############################################################################################################
    // #############################################################################################################
    // #############################################################################################################
    // #############################################################################################################
    $('[data-toggle="tooltip"]').tooltip();


    var dateField = $('#dateField');

    function fullYearField() {
        var todaysDate = new Date();
        var dd = todaysDate.getDate();
        var mm = todaysDate.getMonth();
        var yyyy = todaysDate.getFullYear();
        var monthArray = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

        var dateTh = '';
        switch (dd) {
            case 1:
            case 21:
            case 31:
                dateTh = 'st';
                break;
            case 2:
            case 22:
                dateTh = 'nd';
                break;
            case 3:
            case 23:
                dateTh = 'rd';
                break;
            default:
                dateTh = 'th';
                break;
        }

        return '<span>' + dd + '</span><sup>' + dateTh + '&nbsp;</sup><span>' + monthArray[mm] + '&nbsp;</span>' + yyyy;
    }
    $(dateField).append(fullYearField());

    


    var calendarEl = document.getElementById('calendar');

    //Make initial date becomes today
    // var today = moment().day();


    // Exception Handling
    if (calendarEl) {
        var calendar = new FullCalendar.Calendar(calendarEl, {
            firstDay: 1,
            themeSystem: 'bootstrap',
            aspectRatio: 2,
            height: '100%',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            // initialDate: currentDate,
            navLinks: true, // can click day/week names to navigate views
            selectable: true,
            selectMirror: true,
            select: function (arg) {
                var title = prompt('Event Title:');
                if (title) {
                    calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay
                    })
                }
                calendar.unselect()
            },
            eventClick: function (arg) {
                if (confirm('Are you sure you want to delete this event?')) {
                    arg.event.remove()
                }
            },
            editable: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: [{
                    title: 'All Day Event',
                    start: '2020-07-07'
                },
                {
                    title: 'Long Event',
                    start: '2020-06-07',
                    end: '2020-06-10'
                },
                {
                    groupId: 999,
                    title: 'Repeating Event',
                    start: '2020-06-09T16:00:00'
                },
                {
                    groupId: 999,
                    title: 'Repeating Event',
                    start: '2020-06-16T16:00:00'
                },
                {
                    title: 'Conference',
                    start: '2020-06-11',
                    end: '2020-06-13'
                },
                {
                    title: 'Meeting',
                    start: '2020-06-12T10:30:00',
                    end: '2020-06-12T12:30:00'
                },
                {
                    title: 'Lunch',
                    start: '2020-06-12T12:00:00'
                },
                {
                    title: 'Meeting',
                    start: '2020-06-12T14:30:00'
                },
                {
                    title: 'Happy Hour',
                    start: '2020-06-12T17:30:00'
                },
                {
                    title: 'Dinner',
                    start: '2020-06-12T20:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2020-06-13T07:00:00'
                },
                {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2020-06-28'
                }
            ]
        });

        calendar.render();
    }

    // ! add [.table-responsive]

    $(".table-responsive.mb-1>div").addClass("table-responsive");

    // Mobile number format
    //  var inputTel = $('[type=tel]');
    var inputTel = document.querySelector('input[type=tel]');
    if (inputTel) {
        var input = $(inputTel);
        input.mobilePhoneNumber({
            allowPhoneWithoutPrefix: '+255'
        });
        input.bind('country.mobilePhoneNumber', function (e, country) {
            $('.country').text(country || '');
        });
    }

    var inputPhoneTel = document.querySelector('.phone_num');
    if (inputPhoneTel) {
        var input1 = $(inputPhoneTel)
        input1.mobilePhoneNumber({
            allowPhoneWithoutPrefix: '+255'
        });
        input1.bind('country.mobilePhoneNumber', function (e, country) {
            $('.country').text(country || '')
        });
    }

    var inputMobileTel = document.querySelector('.phone_num1');
    if (inputMobileTel) {
        var input2 = $(inputMobileTel);
        input2.mobilePhoneNumber({
            allowPhoneWithoutPrefix: '+255'
        });
        input2.bind('country.mobilePhoneNumber', function (e, country) {
            $('.country1').text(country || '')
        });
    }


});

function compareLinks(link, array) {
    for (let i = 0; i < array.length; i++) {

        if (link == array[i]) {
            $(link.nextElementSibling).slideToggle();
            $(link).toggleClass('active');
            // console.log($(link).text());
        } else {
            $(array[i].nextElementSibling).slideUp();
            $(array[i]).removeClass('active');
            // console.log('Inactive: ' + array[i]);
        }
    }
}

// ! Datatable Function
function DateTableFunction(TableID) {
    $(TableID + '>tbody>tr').click(function () {
        if ($(this).find(' input[type=radio]')[0]) {
            $(this).find(' input[type=radio]')[0].click();
        }
    });

    $(TableID).prepend($("<thead></thead>").append($(this).find("tr:first")))
        .DataTable({
            "responsive": true,
            "stateSave": true,
            "lengthMenu": [
                [10, 20, 30, 50, -1],
                [10, 20, 30, 50, "All"]
            ],
            "sPaginationType": "full_numbers"
        });
}