
<br></br>
<div class="content-box">
<div class="row">
  <div class="col">
    <h4>Detajet e kompanise</h4>
  </div>
</div>
<br>
<br>
<?php
  $sql1="SELECT * FROM companydetails where id='1'";
  $res1= $con->query($sql1);
  $data=$res1->fetch_assoc();
   $id=!empty($data['id'])?$data['id']:'';
  $name=!empty($data['name'])?$data['name']:'';
  $initials=!empty($data['initials'])?$data['initials']:'';
  $state=!empty($data['state'])?$data['state']:'';
  $city=!empty($data['city'])?$data['city']:'';
  $street_address=!empty($data['street_address'])?$data['street_address']:'';
  $logo=!empty($data['logo'])?$data['logo']:'';
  
  $lastUpdate=!empty($data['lastUpdate'])?$data['lastUpdate']:'';
  $userId=!empty($data['userId'])?$data['userId']:'';
?>
<div class="row">
  <div class="col-sm-12">
    <h6>Hera e fundit e përditësimit: <strong><?php echo $lastUpdate; ?> </strong></h6>
  </div>
</div>
<br>
<form id="updateForm" name="website_setting" rel="<?php echo $id;?>">
  <div class="row">
    <div class="col">
      <div class="form-group">
      <label>Emri i kompanise<span style="color:red">*</span></label>
      <input type="text" name="website_title" value="<?php echo $name ?>" class="form-control" placeholder="Emri i kompnaise">
    </div>
  </div>
  
    <div class="col">
      <div class="form-group">
      <label>Inicialet</label>
      <input type="text" name="website_name" value="<?php echo $initials ?>" class="form-control" placeholder="Inicialet e kompanise">
     </div>
    </div>
  </div>

    <div class="row">
    <div class="col">
      <label>Website Logo <span style="color:red">*</span></label>

      <div class="custom-file mb-3">
      <input type="file" class="custom-file-input" id="customFile" name="website_logo">
      <label class="custom-file-label" for="customFile">Choose file</label>
    </div>
    <div class="form-group">
    <?php
    if(empty($logo))
    {
      ?>
      
      <?php
    }else{
      ?>
      <img src="../images/<?php echo $logo; ?>" width="50px" height="50px">

      <?php
    }
    ?>
    </div>
    </div>
  </div>
  <div class="row">
     <div class="col">
       <div class="form-group">
        <label>Shteti</label>
        <input type="text" name="state" id="State" value="<?php echo $state; ?>" class="form-control" placeholder="Shteti">
       </div>
     </div>
     <div class="col">
       <div class="form-group">
        <label>Qyteti</label>
        <input type="text" name="city" id="City" value="<?php echo $city; ?>" class="form-control"  placeholder="Qyteti">
       </div>
     </div>
     <div class="col">
       <div class="form-group">
        <label>Rruga</label>
        <input type="text" name="streetaddress" id="Streetaddress" value="<?php echo $street_address; ?>" class="form-control" placeholder="Adresa e rruges">
       </div>
     </div>
  </div>
   <div class="row">
     <div class="col">
         <div class="form-group">
         <button class="btn btn-secondary">Ruaj</button>
     </div>
     </div>

  </div>
</form>

</div>