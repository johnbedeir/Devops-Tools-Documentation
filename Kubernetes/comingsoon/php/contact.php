<?php
$to = 'info@johnydesigns.com';
$subject = 'You subject';
$headers = 'From: johnydev.com' . "\r\n" . 'Content-type: text/html; charset=utf-8';
$message = '
<html>
	<head>
		<title>Your Site Contact Form</title>
	</head>
	<body>
		<h3>Name: <span style="font-weight: normal;">' . $_POST['name'] . '</span></h3>
		<h3>Email: <span style="font-weight: normal;">' . $_POST['email'] . '</span></h3>
		<div>
			<h3 style="margin-bottom: 5px;">Comment:</h3>
			<div>' . $_POST['comment'] . '</div>
		</div>
	</body>
</html>';

if (!empty($_POST['name']) && !empty($_POST['email']) && !empty($_POST['comment'])) {
	if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
		mail($to, $subject, $message, $headers) or die('<span class="text-danger">Error sending Mail</span>');
	  echo '<span class="text-success send-true">Your email was sent!</span>';
	}
} else {
	echo '<span class="text-danger">All fields must be filled!</span>';
}
?>