function showPopup(id) {
    window.location.href = "dashboard.php?cat=appointments-setting&subcat=view-appointment&view=" + id;


}

function showAddEvent(day, month, year) {
    window.location.href = "dashboard.php?cat=client-setting&subcat=clientlist";
    /*
    $.ajax({
            method: "POST",
            url: "scripts/addNewEvent.inc.php",
            data: {
                year: year,
                month: month,
                day: day
            }
        })
        .done(function(response) {
            $("#AddNewEvent").html(response);
            $('.hover_bkgr_fricc2').show();
        });
    return false;
*/
}

$("#AddClientForm").submit(function(e) {
    e.preventDefault();
    $('#NameError').html("");
    $('#SurnameError').html("");
    $('#EmailError').html("");
    $('#Phone1Error').html("");
    $('#Phone2Error').html("");
    $('#AddressError').html("");
    $('#ReferenceError').html("");
    $('#BussinesNameError').html("");
    $('#CommentError').html("");
    var myform = document.getElementById("AddClientForm");
    var fd = new FormData(myform);
    $.ajax({
            url: "scripts/add-client.inc.php",
            data: fd,
            cache: false,
            processData: false,
            contentType: false,
            method: 'POST'
        })
        .done(function(response) {
            $message = "";
            switch (response) {
                case "1":
                    $message = "Emri duhet te permbaje vetem shkronja dhe nuk mund te jete i zbrazet!";
                    $('#NameError').html($message);
                    document.getElementById('Name').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "2":
                    $message = "Mbiemri duhet te permbaje vetem shkronja!";
                    $('#SurnameError').html($message);
                    document.getElementById('Surname').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "3":
                    $message = "Format i gabuar i emailit!";
                    $('#EmailError').html($message);
                    document.getElementById('Email').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "4":
                    $message = "Kjo fushe eshte e obligueshme!";
                    $('#Phone1Error').html($message);
                    document.getElementById('phone').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                default:
                    window.scrollTo(0, 0);
                    $('#AddClientForm')[0].reset();

                    $('#alertBox').html(response).fadeIn();
            }
        });
    return false;
});
$('.popupCloseButton1').click(function() {
    $('.hover_bkgr_fricc1').hide();
});
$("#SearchForm").submit(function(e) {
    e.preventDefault();
    $('#NameError').html("");
    var myform = document.getElementById("SearchForm");
    var fd = new FormData(myform);
    e.preventDefault();
    name = $('#Name').val();
    table = 'clients';
    $.ajax({
            method: "POST",
            url: "scripts/search.inc.php",
            data: {
                name: name,
                table: table
            }
        })
        .done(function(response) {
            $message = "";
            switch (response) {
                case "1":
                    $message = "Emri duhet te permbaje vetem shkronja dhe nuk mund te jete i zbrazet!";
                    $('#NameError').html($message);
                    document.getElementById('Name').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                default:
                    window.scrollTo(0, 0);
                    $('#SearchForm')[0].reset();
                    $('#ClientList').html(response);
            }
        });
    return false;
});
$("#SearchFormMyApp").submit(function(e) {
    e.preventDefault();
    $('#NameError').html("");
    var myform = document.getElementById("SearchFormMyApp");
    var fd = new FormData(myform);
    e.preventDefault();
    name2 = $('#Name').val();
    table = 'myApp';
    $.ajax({
            method: "POST",
            url: "scripts/search.inc.php",
            data: {
                name: name2,
                table: table
            }
        })
        .done(function(response) {
            $message = "";
            switch (response) {
                case "1":
                    $message = "Emri duhet te permbaje vetem shkronja dhe nuk mund te jete i zbrazet!";
                    $('#NameError').html($message);
                    document.getElementById('Name').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                default:
                    window.scrollTo(0, 0);
                    $('#SearchFormMyApp')[0].reset();
                    $('#ClientList').html(response);
            }
        });
    return false;
});
$("#SearchFormMyApp2").submit(function(e) {
    e.preventDefault();
    $('#NameError').html("");
    var myform = document.getElementById("SearchFormMyApp2");
    var fd = new FormData(myform);
    e.preventDefault();
    name2 = $('#Name').val();
    table = 'myAppCanceled';
    $.ajax({
            method: "POST",
            url: "scripts/search.inc.php",
            data: {
                name: name2,
                table: table
            }
        })
        .done(function(response) {
            $message = "";
            switch (response) {
                case "1":
                    $message = "Emri duhet te permbaje vetem shkronja dhe nuk mund te jete i zbrazet!";
                    $('#NameError').html($message);
                    document.getElementById('Name').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                default:
                    window.scrollTo(0, 0);
                    $('#SearchFormMyApp2')[0].reset();
                    $('#ClientList').html(response);
            }
        });
    return false;
});


$("#PaswordUserForm").submit(function(e) {
    e.preventDefault();
    $('#OldPasError').html("");
    $('#NewPasError').html("");
    $('#New2PasError').html("");
    var myform = document.getElementById("PaswordUserForm");
    var fd = new FormData(myform);
    $.ajax({
            url: "scripts/change-password.inc.php",
            data: fd,
            cache: false,
            processData: false,
            contentType: false,
            method: 'POST'
        })
        .done(function(response) {
            $message = "";
            switch (response) {
                case "1":
                    $message = "Shenoni paswordin e vjeter!";
                    $('#OldPasError').html($message);
                    document.getElementById('Old_password').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "2":
                    $message = "Pasword jo korrekt!";
                    $('#OldPasError').html($message);
                    document.getElementById('Old_password').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "3":
                    $message = "Paswordi duhet t'i permbaje 4 karaktere, se paku nje shkronje dhe nje numer.";
                    $('#NewPasError').html($message);
                    document.getElementById('New_password').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "4":
                    $message = "Paswordat nuk perputhen.";
                    $('#New2PasError').html($message);
                    document.getElementById('New2_password').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                default:
                    window.scrollTo(0, 0);
                    $('#PaswordUserForm')[0].reset();

                    message = "<span class='success'>Paswordi u ndryshua me sukses.</span>";
                    $('#alertBox').html(message).fadeIn();
                    //window.location = 'dashboard.php?cat=website-admin&subcat=change-password';

            }
        });
    return false;
});






function showAddAppointmentForm() {
    window.scrollTo(0, 0);
    $('.hover_bkgr_fricc2').show();
}
$('.popupCloseButton2').click(function() {
    $('.hover_bkgr_fricc2').hide();
});



$("#AddAppointmentsForm").submit(function(e) {
    e.preventDefault();
    $('#ShDescError  ').html("");
    $('#DateError').html("");
    $('#StartTimeError').html("");
    $('#EndTimeError').html("");
    $('#Conditionerror').html("");
    $('#CommentError').html("");
    var myform = document.getElementById("AddAppointmentsForm");
    var fd = new FormData(myform);
    $.ajax({
            url: "scripts/add-appointment.inc.php",
            data: fd,
            cache: false,
            processData: false,
            contentType: false,
            method: 'POST'
        })
        .done(function(response) {
            $message = ""
            error = response.substring(0, 2);
            switch (error) {
                case "11":
                    $message = "Përshkrimi nuk mund te jete i zbrazet!";
                    $('#ShDescError').html($message);
                    document.getElementById('ShortDescription').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "12":
                    $message = "Përshkrimi nuk mund te permbaje me shume se 30 karaktere!";
                    $('#ShDescError').html($message);
                    document.getElementById('ShortDescription').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "13":
                    $message = "Data nuk mund te jete e zbrazet!";
                    $('#DateError').html($message);
                    document.getElementById('Date').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "14":
                    $message = "Kjo date ka kaluar!";
                    $('#DateError').html($message);
                    document.getElementById('Date').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "15":
                    $message = "Ora nuk mund te jete e zbrazet!";
                    $('#StartTimeError').html($message);
                    document.getElementById('StrtTime').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "16":
                    $message = "Kjo ore ka kaluar!";
                    $('#StartTimeError').html($message);
                    document.getElementById('StrtTime').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "26":
                    $message = "Tashme egziston nje termin ne kete ore!<br> Termini me i afert i mundshem lidhur me oren e dhene eshte:  <strong>" + response.substring(2, response.length) + "</strong>";
                    $('#StartTimeError').html($message);
                    document.getElementById('StrtTime').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "17":
                    $message = "Ora nuk mund te jete e zbrazet!";
                    $('#EndTimeError').html($message);
                    document.getElementById('EndTime').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "18":
                    $message = "Ora e e perfundimit dhe e fillimit nuk perputhen!";
                    $('#EndTimeError').html($message);
                    document.getElementById('EndTime').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "28":
                    $message = "Tashme egziston nje termin ne kete ore!<br> Maksimumi sa mund te zgjat termini eshte deri ne oren: <strong>" + response.substring(2, response.length) + "</strong>";
                    $('#EndTimeError').html($message);
                    document.getElementById('EndTime').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;

                default:
                    window.scrollTo(0, 0);
                    $('.hover_bkgr_fricc2').hide();
                    message = "<span class='success'>Termini u ruajt me sukses</span>";
                    $('#alertBox').html(message).fadeIn();
            }
        });
    return false;
});

$("#CommentsForm").submit(function(e) {
    e.preventDefault();
    $('#Commenteerror').html("");
    var myform = document.getElementById("CommentsForm");
    var fd = new FormData(myform);
    $.ajax({
            url: "scripts/add-comment.inc.php",
            data: fd,
            cache: false,
            processData: false,
            contentType: false,
            method: 'POST'
        })
        .done(function(response) {
            $message = "";

            switch (response) {
                case "2":
                    $message = "Komenti nuk mund te jete i zbrazet!.";
                    $('#Commenteerror').html($message);
                    document.getElementById('Comment34').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                default:
                    $('#CommentsForm')[0].reset();
                    message = "<span class='success'>Komenti u shtua me sukses</span>";
                    $('#alertBox').html(message).fadeIn();
                    $('#ClientList').html(response);
            }

        });
    return false;
});

function showAddAppointmentForm() {
    window.scrollTo(0, 0);
    $('.hover_bkgr_fricc2').show();
}
$('.popupCloseButton2').click(function() {
    $('.hover_bkgr_fricc2').hide();
});

$("#UpdateUSerForm").submit(function(e) {
    e.preventDefault();
    $('#Nameerror').html("");
    $('#Surnameerror').html("");
    $('#Usernameerror').html("");
    $('#Emailerror').html("");
    $('#Pswerror').html("");
    $('#Psw2error').html("");
    var myform = document.getElementById("UpdateUSerForm");
    var fd = new FormData(myform);
    $.ajax({
            url: "scripts/updateUser.inc.php",
            data: fd,
            cache: false,
            processData: false,
            contentType: false,
            method: 'POST'
        })
        .done(function(response) {
            $message = ""
            switch (response) {
                case "1":
                    $message = "Emri duhet te permbaje vetem shkronja dhe nuk mund te jete i zbrazet!";
                    $('#Nameerror').html($message);
                    document.getElementById('Name').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "2":
                    $message = "Mbiemri duhet te permbaje vetem shkronja!";
                    $('#Surnameerror').html($message);
                    document.getElementById('Surname').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "4":
                    $message = "Username nuk mund te jete i zbrazet!";
                    $('#Usernameerror').html($message);
                    document.getElementById('Username').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "5":
                    $message = "Ky username egziston!";
                    $('#Usernameerror').html($message);
                    document.getElementById('Username').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "6":
                    $message = "Format i gabuar i emailit!";
                    $('#Emailerror').html($message);
                    document.getElementById('Email').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "7":
                    $message = "Paswordi duhet t'i permbaje 4 karaktere, se paku nje shkronje dhe nje numer.";
                    $('#Pswerror').html($message);
                    document.getElementById('Password').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                case "8":
                    $message = "Paswordat nuk perputhen.";
                    $('#Psw2error').html($message);
                    document.getElementById('Cpassword').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });
                    break;
                default:
                    document.getElementById("Password").value = '';
                    document.getElementById("Cpassword").value = '';
                    window.scrollTo(0, 0);
                    message = "<span class='success'>Te dhenat u perditesuan me sukses!.</span>";
                    $('#alertBox').html(message).fadeIn();

            }
        });
    return false;
});