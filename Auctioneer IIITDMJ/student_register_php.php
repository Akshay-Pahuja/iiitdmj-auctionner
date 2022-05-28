<?php
session_start();

// initializing variables
$roll = "";
$name = "";
$email    = "";
$phone = "";
$errors = array(); 

// connect to the database
$db = mysqli_connect('localhost', 'pmauser', 'password_here', 'auctioneer_iiitdmj');

// REGISTER USER
if (isset($_POST['reg_user'])) {
  // receive all input values from the form
  $roll = mysqli_real_escape_string($db, $_POST['roll']);
  $name = mysqli_real_escape_string($db, $_POST['name']);
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $phone = mysqli_real_escape_string($db, $_POST['phone']);
  $password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
  

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  if (empty($roll)) { array_push($errors, "Username is required"); }
  if (empty($email)) { array_push($errors, "Email is required"); }
  if (empty($password_1)) { array_push($errors, "Password is required"); }


  // first check the database to make sure 
  // a user does not already exist with the same username and/or email
  $user_check_query = "SELECT * FROM users WHERE roll_number='$roll' OR phone_number='$phone' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);
  
  if ($user) { // if user exists
    if ($user['roll_number'] === $roll) {
      array_push($errors, "Username already exists");
    }

    if ($user['phone_number'] === $phone) {
      array_push($errors, "user already exists");
    }
  }

  // Finally, register user if there are no errors in the form
  if (count($errors) == 0) {
  	$password = md5($password_1);//encrypt the password before saving in the database

  	$query = "INSERT INTO users (roll_number, user_name, email,phone_number,user_password) 
  			  VALUES('$roll', '$name', '$email','$phone','$password');
  	mysqli_query($db, $query);
  	$_SESSION['name'] = $name;
  	$_SESSION['success'] = "You are now logged in";
  	header('location: welcome.php');
  }
}
