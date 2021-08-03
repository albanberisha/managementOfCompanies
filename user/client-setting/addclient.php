<br><br>
<div class="content-box">
<div class="row">
		<div class="col">
			<h3></h3>
		</div>
		<div class="col text-right">
			<a href="dashboard.php?cat=client-setting&subcat=clientlist" class="btn btn-secondary btn-back content-link" name="save_button_color"> Shiko klientet</a>
		</div>
	</div>
    <form id="AddClientForm" enctype="multipart/form-data">
        <div class="row">
            <div class="col">
                <h4>Detajet e klientit</h4>
            </div>
            <div class="col">
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label><strong>Emri: <span  style="color: red;">*</span></strong></label>
                    <input type="text" id="Name" name="name" class="form-control" placeholder="Emri">
                    <span id="NameError" style="color: red;"></span>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                <label><strong>Mbiemri:</strong></label>
                    <input type="text" id="Surname" name="surname" class="form-control" placeholder="Mbiemri">
                    <span id="SurnameError" style="color: red;"></span>
                </div>
            </div>
            
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label><strong>Email:</strong></label>
                    <input type="text" id="Email" name="email" class="form-control" placeholder="Emaili">
                    <span id="EmailError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label><strong>Numri kontaktues (1): <span  style="color: red;">*</span></strong></label>
                    <input type="text"  name="mobile1" id="phone" class="form-control" placeholder="(383) 44-555-555"/>
                    <span id="Phone1Error" style="color: red;"></span>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label><strong>Numri kontaktues (2):</strong></label>
                    <input type="text"  name="mobile2" id="phone2" class="form-control" placeholder="(383) 44-555-555"/>
                    <span id="Phone2Error" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label><strong>Adresa:</strong></label>
                    <input type="text" name="address" class="form-control" placeholder="Adresa">
                    <span id="AddressError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label><strong>Referenca:</strong></label>
                    <input type="text" name="reference" class="form-control" placeholder="Referenca">
                    <span id="ReferenceError" style="color: red;"></span>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label><strong>Emri i biznesit:</strong></label>
                    <input type="text" name="bussinesName" class="form-control" placeholder="Emri i biznesit">
                    <span id="BussinesNameError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
        <div class="col">
                <div class="form-group">
                    <label><strong>Komenti:</strong></label>
                    <textarea type="text" rows="4" name="comment" class="form-control" placeholder="Sheno komentin..."></textarea>
                    <span id="CommentError" style="color: red;"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <button class="btn btn-secondary" name="save_button_color" type="submit">Ruaj</button>
                    
                </div>
            </div>
        </div>
    </form>
</div>
</br>
<script type="text/javascript">
document.getElementById('phone').addEventListener('input', function (e) {
  var x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,2})(\d{0,3})(\d{0,3})/);
  e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '')+(x[4] ? '-' + x[4] : '');
});
document.getElementById('phone2').addEventListener('input', function (e) {
  var x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,2})(\d{0,3})(\d{0,3})/);
  e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '')+(x[4] ? '-' + x[4] : '');
});
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
                    });                    break;
                case "3":
                    $message = "Format i gabuar i emailit!";
                    $('#EmailError').html($message);
                    document.getElementById('Email').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });                    break;
                    case "4":
                    $message = "Kjo fushe eshte e obligueshme!";
                    $('#Phone1Error').html($message);
                    document.getElementById('phone').scrollIntoView({
                        behavior: 'auto',
                        block: 'center',
                        inline: 'center'
                    });                    break;
                default:
                window.scrollTo(0, 0);
                    $('#AddClientForm')[0].reset();

                    $('#alertBox').html(response).fadeIn();
            }
        });
    return false;
});
</script>
