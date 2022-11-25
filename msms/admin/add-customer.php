<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['bpmsaid']==0)) {
  header('location:logout.php');
  } else{

if(isset($_POST['submit']))
  {
    $name=$_POST['name'];
    $email=$_POST['email'];
   $mobilenum=$_POST['mobilenum'];
    $gender=$_POST['gender'];
$details=$_POST['details'];
 
     
    $query=mysqli_query($con, "insert into  tblcustomers(Name,Email,MobileNumber,Gender,Details) value('$name','$email','$mobilenum','$gender','$details')");
    if ($query) {
echo "<script>alert('Customer has been added.');</script>"; 
echo "<script>window.location.href = 'add-customer.php'</script>"; 
 } else {
echo "<script>alert('Something Went Wrong. Please try again.');</script>";  	
} }
  ?>
<!DOCTYPE HTML>
<html>
<head>
<title>SMS | Add Customers</title>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		 <?php include_once('includes/sidebar.php');?>
		<!--left-fixed -navigation-->
		<!-- header-starts -->
	 <?php include_once('includes/header.php');?>
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<div class="forms">
					<h3 class="title1">Add Customer</h3>
					<div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
						<div class="form-title">
							<h4>Salon Customers:</h4>
						</div>
						<div class="form-body">
							<form method="post">
								
							 <div class="form-group"> <label for="exampleInputEmail1">Name</label> <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" value="" required="true"> </div> <div class="form-group"> <label for="exampleInputPassword1">Email</label> <input type="email" id="email" name="email" class="form-control" placeholder="Email" value="" required="true"> </div>
							 <div class="form-group"> <label for="exampleInputEmail1">Mobile Number</label> <input type="text" class="form-control" id="mobilenum" name="mobilenum" placeholder="Mobile Number" value="" required="true" maxlength="10" pattern="[0-9]+"> </div>
							 <div class="radio">

                               <p style="padding-top: 20px; font-size: 15px"> <strong>Gender:</strong> 
                                <label>
                                    <input type="radio" name="gender" id="gender" value="Male">
                                    Male
                                </label>
                                 <label>
                                    <input type="radio" name="gender" id="gender" value="Female">
                                    Female
                                </label>
                                <label>
                                    <input type="radio" name="gender" id="gender" value="Transgender">
                                   Transgender
                                </label></p>
                            </div>
							 	<div class="form-group"> <label for="exampleInputEmail1">Details</label> <textarea type="text" class="form-control" id="details" name="details" placeholder="Details" required="true" rows="12" cols="4"></textarea> </div>
							
							  <button type="submit" name="submit" class="btn btn-default">Add</button> </form> 
						</div>
						
					</div>
				
				
			</div>
		</div>
		 <?php include_once('includes/footer.php');?>
	</div>
	<!-- Classie -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			
			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.js"> </script>
</body>
</html>
<?php } ?>