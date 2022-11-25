<?php 
include('includes/dbconnection.php');
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if(isset($_POST['submit']))
  {

    $name=$_POST['name'];
    $email=$_POST['email'];
    $services=$_POST['services'];
    $adate=$_POST['adate'];
    $atime=$_POST['atime'];
    $phone=$_POST['phone'];
    $aptnumber = mt_rand(100000000, 999999999);
  
    $query=mysqli_query($con,"insert into tblappointment(AptNumber,Name,Email,PhoneNumber,AptDate,AptTime,Services) value('$aptnumber','$name','$email','$phone','$adate','$atime','$services')");
    if ($query) {
$ret=mysqli_query($con,"select AptNumber from tblappointment where Email='$email' and  PhoneNumber='$phone'");
$result=mysqli_fetch_array($ret);
$_SESSION['aptno']=$result['AptNumber'];
 echo "<script>window.location.href='thank-you.php'</script>";  
  }
  else
    {
     echo "<script>alert('Something Went Wrong. Please try again.');</script>"; 
    }

  
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
   
    <title> Salon Management System || Appointments Form</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i%7cMontserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- Style -->
    <link href="css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/jquery.min.js"></script>
</head>

<body>
    <?php include_once('includes/header.php');?>
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">Book Appointment</h2>
                        <div class="page-breadcrumb">
                            <ol class="breadcrumb">
                                <li><a href="index.php">Home</a></li>
                                <li class="active">Book Appointment</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h1>Appointment Form</h1>
                            <p> Book your appointment to save salon rush.</p>
                            <form method="post" >
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label" for="name">Name</label>
                                        <input type="text" class="form-control" id="name" placeholder="Name" name="name" required="true">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label" for="phone">phone</label>
                                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" required="true" maxlength="10" pattern="[0-9]+">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label" for="email">email</label>
                                         <input type="email" class="form-control" id="appointment_email" placeholder="Email" name="email" required="true">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label" for="Subject">Services</label>
                                        <select name="services" id="services" required="true" class="form-control">
                                <option value="">Select Services</option>
                                <?php $query=mysqli_query($con,"select * from tblservices");
              while($row=mysqli_fetch_array($query))
              {
              ?>
                               <option value="<?php echo $row['ServiceName'];?>"><?php echo $row['ServiceName'];?></option>
                               <?php } ?> 
                              </select>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label" for="textarea">Appointment Date</label>
                                            <input type="date" class="form-control appointment_date" placeholder="Date" name="adate" id='inputdate' required="true">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label" for="textarea">Appointment Time</label>
                                            <input type="time" class="form-control appointment_time" placeholder="Time"  max='20:30' min='10:30' name="atime" id='time' required="true">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <button type="submit" id="submit" name="submit" class="btn btn-default">Book</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include_once('includes/footer.php');?>




    <script> 


$(function(){
    var dtToday = new Date();
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
     day = '0' + day.toString();
     var minDate = year + '-' + month + '-' + day;
     
     var maxMonth;
     var maxYear;
     if(month===11){
        maxMonth = '01';
        maxYear = year + 1;
     }else if(month === 12){
        maxMonth = '02';
        maxYear = year + 1;
     }else{
        maxMonth = dtToday.getMonth() + 2;
        maxYear = year;
     }
    var maxDate = maxYear + '-' +maxMonth+ '-' + day;
    $('#inputdate').attr('min', minDate);
    $('#inputdate').attr('max', maxDate);
});



</script>
    <!-- /.footer-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/menumaker.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/sticky-header.js"></script>
</body>

</html>
