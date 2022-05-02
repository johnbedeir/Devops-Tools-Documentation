<?php
  if ($_POST['']);
	$file = fopen('../emails.txt','a+');
	if (!empty($_POST['email'])) {
	  if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
		fputs($file,$_POST['email'].PHP_EOL);
		fclose($file);
		echo '<span class="text-success send-true">Your email was sent!</span>';
	  } else {
		echo '<span class="text-danger">The input is not a valid email address!</span>';
	  }
	} else {
	  echo '<span class="text-danger">All fields must be filled!</span>';
	}
?>