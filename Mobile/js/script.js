$(document).ready(function () {
    var dropDownLinks = $('.app-link__dropdown');
    var arrayDropDownLinks = dropDownLinks.toArray();

    arrayDropDownLinks.forEach(function (dropDownLink) {
        $(dropDownLink).click(function () {
            compareLinks(dropDownLink, arrayDropDownLinks);
        });
    });


    // DataTable
    $('#example').DataTable();

    // Datepicker
    $('#dob').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'dd/mm/yyyy',
    });
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