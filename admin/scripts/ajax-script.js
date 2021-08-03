// ============= admin rol ==============//

$(document).on('click', '.adminRole', function(e) {

    var el = $(this);
    var name = $(this).attr('name');
    var id = $(this).attr('rel');
    $.ajax({
        method: "GET",
        url: "scripts/backend-script.php",
        data: { tableName: name, id: id, role: 'admin' },

        success: function(data) {

            switch (data) {
                case 'fas fa-user-alt-slash iconRole':
                    el.attr('class', 'text-secondary adminRole');
                    break;
                case 'fas fa-user-alt iconRole':
                    el.attr('class', 'text-success adminRole');
                    break;
            }

            el.find('.iconRole').attr('class', data);


        }
    });
});

//======= Insert data through admin form==========// 

$(document).on('submit', '#adminForm', function(e) {
    e.preventDefault();
    var name = $(this).attr('name');
    $.ajax({
        method: "POST",
        url: "scripts/backend-script.php?name=" + name,
        data: $(this).serialize(),
        beforeSend: function() {
            $('button[type="submit"]').attr('disabled', 'disabled').text('Saving..');
        },
        success: function(data) {

            $('#adminForm').find('input').val('')
            $('#adminForm').find('textarea').val('');
            $('button[type="submit"]').removeAttr('disabled').text('Save');

            $('#alertBox').html(data).fadeIn();

        }
    });

});


//========= update data through update form============ //


$(document).on('submit', '#updateForm', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var name = $(this).attr('name');
    var id = $(this).attr('rel');
    $.ajax({
        method: "POST",
        url: "scripts/backend-script.php?name=" + name + "&id=" + id,
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
            $('button[type="submit"]').attr('disabled', 'disabled');
        },
        success: function(data) {

            $('button[type="submit"]').removeAttr('disabled');

            $('#alertBox').html(data).fadeIn();
        }

    });
});



// ============= delete data from database============= //
$(document).on('click', '.delete', function(e) {

    var el = $(this);
    var id = $(this).attr('id');
    var name = $(this).attr('name');
    if (name === 'users') {
        if ($('#Boxbox3').css("display") == "none") {
            $('#Boxbox3').fadeIn();

            $('#confirmBox2').fadeIn();
            $('#confirmBox2').find('button').on('click', function() {

                if ($(this).val() == 1) {

                    $.ajax({
                        type: "GET",
                        url: "scripts/backend-script.php",
                        data: { deleteId: id, deleteData: name },
                        dataType: "html",
                        success: function(data) {
                            $("#showTable").html(data);
                            $('#alertBox').html(data).fadeIn();
                            el.parents('tr').remove();
                        }

                    });

                }

                $('#confirmBox2').fadeOut();
                $('#Boxbox3').fadeOut();
            })

        }





    } else {
        if ($('#Boxbox3').css("display") == "none") {
            $('#Boxbox3').fadeIn();
            $('#confirmBox').fadeIn();
            $('#confirmBox').find('button').on('click', function() {

                if ($(this).val() == 1) {

                    $.ajax({
                        type: "GET",
                        url: "scripts/backend-script.php",
                        data: { deleteId: id, deleteData: name },
                        dataType: "html",
                        success: function(data) {
                            if (data === "111") {
                                data = "<span class='success'>Kompania nuk mund te fshihet sepse ka perdorues aktiv.</span>";
                                $("#showTable").html(data);
                                $('#alertBox').html(data).fadeIn();
                            } else {
                                $("#showTable").html(data);
                                $('#alertBox').html(data).fadeIn();
                                el.parents('tr').remove();
                            }


                        }

                    });

                }

                $('#confirmBox').fadeOut();
                $('#Boxbox3').fadeOut();

            })

        }
    }
});
// ============= update data from database============= //
$(document).on('click', '.cancel', function(e) {

    var el = $(this);
    var id = $(this).attr('id');
    var name = $(this).attr('name');

    if ($('#Boxbox3').css("display") == "none") {
        $('#Boxbox3').fadeIn();
        $('#confirmBox2').fadeIn();

        $('#confirmBox2').find('button').on('click', function() {

            if ($(this).val() == 1) {

                $.ajax({
                    type: "GET",
                    url: "scripts/backend-script.php",
                    data: { cancelId: id, cancelData: name },
                    dataType: "html",
                    success: function(data) {

                        $("#showTable").html(data);
                        $('#alertBox').html(data).fadeIn();
                        el.parents('tr').remove();

                    }

                });

            }

            $('#confirmBox2').fadeOut();
            $('#Boxbox3').fadeOut();

        })

    }

});


// === display alert message within a time interval ====== //
window.setInterval(function() {
    if ($('#alertBox').css("display") == "block") {
        $('#alertBox').fadeOut();
    }
}, 3000);


// ====== open page  by clicking links ==============//
$(document).on('click', 'a.content-link', function(e) {
    e.preventDefault();
    history.pushState(null, '', $(this).attr('href'));
    var cat = getUrlParameter('cat');
    var subcat = getUrlParameter('subcat');
    var view = getUrlParameter('view');
    var edit = getUrlParameter('edit');
    var addApp = getUrlParameter('addApp');

    if (cat != '' && subcat != '') {
        $.ajax({
            type: "GET",
            url: "scripts/dynamic-page.php",
            data: {
                cat: cat,
                subcat,
                view: view,
                edit: edit,
                addApp: addApp
            },
            dataType: "html",
            success: function(data) {

                $('#dynamic-page').html(data);



            }


        });
    } else {
        $('#dynamic-page').html("This file does not exist");
    }

});


// get query string value from url
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};