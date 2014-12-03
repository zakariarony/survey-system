<?php require_once("includes/session.php"); ?>
<?php require_once("includes/connection.php"); ?>
<?php require_once("includes/functions.php"); ?>
<?php confirm_logged_in(); ?>

<?php 
	include_once("includes/form_functions.php");
	include("includes/header.php"); ?>
<table id="structure">
	<tr>
		<td id="navigation">
			<a href="index.php">Return to Public Site</a><br />
			<br />
		</td>
		<td id="page">
<?php
	
	// START FORM PROCESSING
	if (isset($_POST['submit'])) { // Form has been submitted.
		$errors = array();

		// perform validations on the form data
		$required_fields = array('username', 'password','email');
		$errors = array_merge($errors, check_required_fields($required_fields, $_POST));

		$fields_with_lengths = array('username' => 30, 'password' => 30, 'email' => 30 );
		$errors = array_merge($errors, check_max_field_lengths($fields_with_lengths, $_POST));

		$username = trim(mysql_prep($_POST['username']));
		$password = trim(mysql_prep($_POST['password']));
		$email = trim(mysql_prep($_POST['email']));
		//$email_address=filter_var($email);
		$hashed_password = sha1($password);

		if ( empty($errors) ) {
			$query = "INSERT INTO users (
							username, hashed_password,email
						) VALUES (
							'{$username}', '{$hashed_password}','{$email}'
						)";
			$result = mysql_query($query, $connection);
			if ($result) {
				$message = "The user was successfully created.";
			} else {
				$message = "The user could not be created.";
				$message .= "<br />" . mysql_error();
			}
		} 

		else {
			if (count($errors) == 1) {
				$message = "There was 1 error in the form.";
			} else {
				$message = "There were " . count($errors) . " errors in the form.";
			}
		}

	} 
	else { // Form has not been submitted.
		$username = "";
		$password = "";
		$email = "";
	}
?>

			<h2>Create New User</h2>
			<?php if (!empty($message)) {echo "<p class=\"message\">" . $message . "</p>";} ?>
			<?php if (!empty($errors)) { display_errors($errors); } ?>
			<form action="add_user.php" method="post">
			<table>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" maxlength="30" required 	value="<?php echo htmlentities($username); ?>" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" maxlength="30" required value="<?php echo htmlentities($password);  ?>" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" maxlength="30" required value="<?php echo htmlentities($email); ?>" /></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" name="submit" value="Create user" /></td>
				</tr>
			</table>
			</form>
			<a href="login.php">Login</a>
		</td>
	</tr>
</table>
<?php include("includes/footer.php"); ?>