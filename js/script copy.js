$(document).ready(function () {
    var dropDownLinks = $('.app-link__dropdown');
    var arrayDropDownLinks = dropDownLinks.toArray();

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


    // 3#################################################################################################################
    // 3#################################################################################################################
    // 3#################################################################################################################

    // DataTable
    $('#memberContributions').DataTable();
    $('#example').DataTable();
    // $('#example').DataTable({
    //     "columnDefs": [{
    //         "orderable": false,
    //         "targets": -1
    //     }],
    // });
    $('#memberTable').DataTable({
        // "pageLength": 5,
        // lengthMenu: [[5, 10, 20, -1], [5, 10, 20, 'All']],
        "columnDefs": [{
            "orderable": false,
            "targets": -1
        }],
    });
    $('#familyMemberTable').DataTable({
        "columnDefs": [{
            "orderable": false,
            "targets": -1
        }],
    });
    $('#tblchruch').DataTable({
        "bPaginate": false,
        "bLengthChange": false,
        "bFilter": false,
        "bInfo": false,
        "bAutoWidth": false
    });
    $('#beliverContributionsTable').DataTable({
        "columnDefs": [{
            "orderable": false,
            "targets": -1
        }],
    });
    $('#pendingContributionTable').DataTable();
    $('#paidContributionTable').DataTable();

    // Datepicker

    function TodaysDate() {
        var todaysDate = new Date();
        var dd = todaysDate.getDate();

        var mm = todaysDate.getMonth() + 1;
        var yyyy = todaysDate.getFullYear();
        if (dd < 10) {
            dd = '0' + dd;
        }

        if (mm < 10) {
            mm = '0' + mm;
        }

        return todaysDate = dd + '/' + mm + '/' + yyyy;
    }

    var today = TodaysDate();

    $('#dob').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd/mm/yyyy',
        iconsLibrary: 'fontawesome',
        weekStartDay: 1,
    });

    $('#txtDate').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd/mm/yyyy',
        iconsLibrary: 'fontawesome',
        weekStartDay: 1,
        maxDate: today,
    });
    $('#memberDate').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd/mm/yyyy',
        iconsLibrary: 'fontawesome',
        weekStartDay: 1,
        maxDate: today,
    });
    $('#effDate').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd/mm/yyyy',
        iconsLibrary: 'fontawesome',
        weekStartDay: 1,
        value: today,
        minDate: today,
    });
    $('#expDate').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd/mm/yyyy',
        iconsLibrary: 'fontawesome',
        weekStartDay: 1,
        minDate: today,
    });

    var believerChart = document.getElementById('believerChart');
    var contributionChart = document.getElementById('contributionChart');
    var userLogs = document.getElementById('userLogs');

    // Font family defaults in ChartJs
    Chart.defaults.global.defaultFontFamily = "-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Helvetica Neue',Arial,'Noto Sans',sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol','Noto Color Emoji'";

    Chart.defaults.global.defaultFontColor = "#343a40";

    // Exception Handling
    if (believerChart) {
        believerChart.getContext('2d');
        var myChart = new Chart(believerChart, {
            type: 'bar',
            data: {
                labels: ['Children', 'Youth', 'Adult', 'Elders', ],
                datasets: [{
                        label: 'Male',
                        data: [10, 23, 15, 22, ],
                        backgroundColor: '#3869AE',
                        borderColor: 'rgba(1, 12, 23, 0.35)',
                        borderWidth: 0,
                        hoverBackgroundColor: '#3869C0',

                    },
                    {
                        label: 'Female',
                        data: [13, 15, 17, 6, ],
                        backgroundColor: '#E8E737',
                        borderWidth: 0,
                        borderColor: 'rgba(1, 12, 23, 0.35)',
                        hoverBackgroundColor: '#E8F600',

                    }
                ],
            },
            options: {
                title: {
                    display: true,
                    text: 'Number of Believers',
                    fontStyle: "bold",
                    fontSize: 18,
                },
                scales: {
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Believers',
                            fontSize: 14,
                            fontStyle: "bold",
                        },
                        ticks: {
                            beginAtZero: true,

                        }
                    }],
                    xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Age group',
                            fontSize: 14,
                            fontStyle: "bold",
                        },
                        // maxBarThickness: 50,
                        categoryPercentage: 0.7,
                        barPercentage: 1,
                    }]
                },
                responsive: true,
                maintainAspectRatio: false

            }
        });
    }

    // Exception Handling
    if (contributionChart) {
        contributionChart.getContext('2d');
        var myChart = new Chart(contributionChart, {
            type: 'pie',
            data: {
                labels: ['Ahadi', 'Jengo', 'Bell Tower', 'Fungu la Kumi', 'General'],
                datasets: [{
                    label: 'Contributions in TZS',
                    data: [12500000, 4950000, 5250000, 7250000, 1665500],
                    // borderColor: 'rgba(32, 179, 66, 0.85)',
                    fill: true,
                    hoverOffset: 4,
                    backgroundColor: ['#E5E326', '#032B8B', '#00BDE8', '#EFAE22', '#936E6E', '#2D5D69',
                        '#2D5D69', '#2D5D69', '#87A878', '#F18805', '#A22522', '#DBF9B8',
                        '#C7CCB9', '#2F2235', '#FE5F55', '#6E2594', '#091E05', '#004F2D',
                    ],
                }]
            },
            options: {
                legend: {
                    display: true,
                    position: 'bottom',
                },
                responsive: true,
                maintainAspectRatio: false

            }
        });

        $('#todayContributions').click(function (e) {
            e.preventDefault();
            updateContributionsDay();
        });
        $('#weekContributions').click(function (e) {
            e.preventDefault();
            updateContributionsWeek();
        });
        $('#monthContributions').click(function (e) {
            e.preventDefault();
            updateContributionsMonth();
        });
        $('#yearContributions').click(function (e) {
            e.preventDefault();
            updateContributionsYear();
        });

        var durationSettings = $('#todayContributions').next();

        function updateContributionsDay() {
            $(durationSettings).find('span:first').removeClass('d-none').next().removeClass('d-none').next().removeClass('d-none');
            myChart.data.datasets[0].data = [12000, 50000, 59200, 7250, 16600];
            // myChart.options.scales.xAxes[0].scaleLabel.labelString = "Contribution Type (in a day)";
            myChart.update();
        }

        function updateContributionsWeek() {
            myChart.data.datasets[0].data = [12500, 49000, 52000, 72000, 66500];
            $(durationSettings).find('span:first').addClass('d-none').next().addClass('d-none').next().removeClass('d-none');
            // myChart.options.scales.xAxes[0].scaleLabel.labelString = "Contribution Type (in a week)";
            myChart.update();
        }

        function updateContributionsMonth() {
            $(durationSettings).find('span:first').addClass('d-none').next().addClass('d-none').next().removeClass('d-none');
            myChart.data.datasets[0].data = [25000, 1490000, 520000, 172000, 166550];
            // myChart.options.scales.xAxes[0].scaleLabel.labelString = "Contribution Type (in a month)";
            myChart.update();
        }

        function updateContributionsYear() {
            $(durationSettings).find('span:first').addClass('d-none').next().addClass('d-none').next().addClass('d-none');
            myChart.data.datasets[0].data = [8250000, 2300000, 440000, 6400000, 7845500];
            // myChart.options.scales.xAxes[0].scaleLabel.labelString = "Contribution Type (in a year)";
            myChart.update();
        }
    }

    // Exception Handling
    if (userLogs) {
        userLogs.getContext('2d');
        var myChart = new Chart(userLogs, {
            type: 'line',
            data: {
                labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                datasets: [{
                    label: 'Institutions',
                    data: [125, 49, 52, 72, 149, 52, 172, 12],
                    borderColor: '#E8E737',
                    fill: true,
                    lineTension: 0.2,
                    pointHoverRadius: 10,
                    backgroundColor: 'rgba(246, 246, 246, 0.4)',
                }, {
                    label: 'Bank Staff',
                    data: [25, 149, 52, 172, 19, 2, 72, 102],
                    borderColor: '#3869AE',
                    fill: true,
                    lineTension: 0.2,
                    pointHoverRadius: 10,
                    backgroundColor: 'rgba(246, 246, 246, 0.4)',
                }, {
                    label: 'Believers',
                    data: [12, 23, 44, 64, 85, 94, 64],
                    borderColor: 'green',
                    fill: true,
                    lineTension: 0.2,
                    pointHoverRadius: 10,
                    backgroundColor: 'rgba(246, 246, 246, 0.4)',
                }],
            },
            options: {
                title: {
                    // ! Disable title {Shilloh}
                    display: false,
                    fontStyle: "bold",
                    fontSize: 18,
                },
                scales: {
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Users',
                            fontSize: 14,
                            fontStyle: "bold",
                        },
                        ticks: {
                            min: 0,
                            beginAtZero: true,
                            // stepSize: 1,
                            callback: function (value, index, values) {
                                if (Math.floor(value) === value) {
                                    return value;
                                }
                            }
                        },
                    }],
                    xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Time (Days)',
                            fontSize: 14,
                            fontStyle: "bold",
                        },
                        maxBarThickness: 60,
                    }]
                },
                legend: {
                    display: true,
                },
                responsive: true,
                maintainAspectRatio: false

            }
        });

        $('#todayLogs').click(function (e) {
            e.preventDefault();
            updateLogDay();
        });

        $('#weekLogs').click(function (e) {
            e.preventDefault();
            updateLogWeek();
        });

        $('#monthLogs').click(function (e) {
            e.preventDefault();
            updateLogMonth();
        });

        $('#yearLogs').click(function (e) {
            e.preventDefault();
            updateLogYear();
        });

        var durationSettings = $('#todayLogs').next();

        function updateLogDay() {
            $(durationSettings).find('span:first').removeClass('d-none').next().removeClass('d-none').next().removeClass('d-none');
            myChart.data.labels = ['12am - 5am', '6am - 11am', '12pm - 5pm', '12pm - 5pm', ];
            myChart.data.datasets[0].data = [0, 0, 2, 0];
            myChart.data.datasets[1].data = [0, 1, 0, 0];
            myChart.data.datasets[2].data = [0, 0, 0, 2];
            myChart.options.scales.xAxes[0].scaleLabel.labelString = "Time (Hours)";
            myChart.update();
        }

        function updateLogWeek() {
            $(durationSettings).find('span:first').addClass('d-none').next().addClass('d-none').next().removeClass('d-none');
            myChart.data.labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
            myChart.data.datasets[0].data = [125, 49, 52, 72, 149, 52, 172, 12];
            myChart.data.datasets[1].data = [25, 149, 52, 172, 19, 2, 72, 102];
            myChart.data.datasets[2].data = [12, 23, 44, 64, 85, 94, 64];
            myChart.options.scales.xAxes[0].scaleLabel.labelString = "Time (Days)";
            myChart.update();
        }

        function updateLogMonth() {
            $(durationSettings).find('span:first').addClass('d-none').next().addClass('d-none').next().removeClass('d-none');
            myChart.data.labels = ['1 - 5', '6 - 10', '10 - 15', '16-20', '21-25', '26-30'];
            myChart.data.datasets[0].data = [125, 49, 52, 72, 149, 52, 172];
            myChart.data.datasets[1].data = [25, 149, 52, 172, 19, 2, 72];
            myChart.data.datasets[2].data = [12, 23, 44, 64, 85, 94];
            myChart.options.scales.xAxes[0].scaleLabel.labelString = "Time (Date)";
            myChart.update();
        }

        function updateLogYear() {
            $(durationSettings).find('span:first').addClass('d-none').next().addClass('d-none').next().addClass('d-none');
            myChart.data.labels = ['January', 'February', 'March', 'April', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
            myChart.data.datasets[0].data = [125, 49, 52, 72, 149, 52, 172, 49, 52, 72, 149, 52, 172, 12];
            myChart.data.datasets[1].data = [25, 149, 52, 172, 19, 2, 72, 102, 52, 172, 19, 2, 72, 102];
            myChart.data.datasets[2].data = [12, 23, 44, 64, 85, 44, 64, 85, 94, 64, 94, 64];
            myChart.options.scales.xAxes[0].scaleLabel.labelString = "Time (Months)";
            myChart.update();
        }
    }


    var feesCollection = document.getElementById('feesCollections');

    // Exception Handling
    if (feesCollection) {
        feesCollection.getContext('2d');
        var myChart = new Chart(feesCollection, {
            type: 'bar',
            data: {
                labels: ['Fees', 'Transport', 'Library', 'Hostel', 'Meals'],
                datasets: [{
                    label: 'Collections in TZS',
                    data: [12500000, 1950000, 650000, 5250000, 780000],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.75)',
                        'rgba(54, 162, 235, 0.75)',
                        'rgba(255, 206, 86, 0.75)',
                        'rgba(75, 192, 192, 0.75)',
                        'rgba(153, 102, 255, 0.75)',
                        'rgba(255, 159, 64, 0.75)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                tooltips: {
                    callbacks: {
                        label: function(tooltipItem, data) {
                            return 'TZS '+ numeral(tooltipItem.yLabel).format('0,0');
                        }
                    }
                },
                title: {
                    display: true,
                    text: 'Collections',
                    fontStyle: "bold",
                    // fontStyle: "normal",
                    fontSize: 24,
                },
                scales: {
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Amount',
                            fontSize: 16,
                            fontStyle: "bold",
                        },
                        ticks: {
                            beginAtZero: true,

                            // Include a dollar sign in the ticks
                            callback: function (value) {
                                // return 'TZS ' + value;
                                // return 'TZS ' + new Intl.NumberFormat().format(value);
                                return 'TZS ' + numeral(value).format('0,0');
                            }
                        }
                    }],
                    xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Collection Type',
                            fontSize: 16,
                            // defaultFontColor: 'black',
                            fontStyle: "bold",
                            // defaultFontFamily: "Segoe UI Semibold",
                        },
                        maxBarThickness: 70,
                    }]
                },
                legend: {
                    display: false,
                },
                responsive: true,
                maintainAspectRatio: false

            }
        });
    }


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