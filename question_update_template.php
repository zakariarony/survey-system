<?php //require_once("includes/session.php"); ?>
<?php require_once("includes/connection.php"); ?>
<?php require_once("includes/functions.php"); ?>
<?php// confirm_logged_in(); ?>
<?php 
	include_once("includes/form_functions.php");
	
	// START FORM PROCESSING
	if (isset($_POST['submit'])) { // Form has been submitted.
		$errors = array();

		// perform validations on the form data
		$required_fields = array('question');
		$errors = array_merge($errors, check_required_fields($required_fields, $_POST));

		$fields_with_lengths = array('question' => 300 );
		$errors = array_merge($errors, check_max_field_lengths($fields_with_lengths, $_POST));

		$question = trim(mysql_prep($_POST['question']));
        
       
		if ( !empty($errors) ) {
             $question_set = mysql_query("SELECT * FROM survey_field", $connection);
		if (!$question_set) {
			die("Database query failed: " . mysql_error());
		}while ($question_final = mysql_fetch_array($question_set)) {
			$id_value=$question_final["survey_id"];
        }
			$query = "INSERT INTO survey_question (
							survey_name,survey_id
						) VALUES (
							'{$question}','{$id_value}'
						) ";
			$result = mysql_query($query, $connection);
			if ($result) {
				$message = "The Question was successfully created.";
			} else {
				$message = "The Question could not be created.";
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
                $question = "";}
?>
<?php include("includes/header.php"); ?>
<table id="structure">
	<tr>
		<td id="navigation">
			<a href="staff.php">Return to Menu</a><br />
			<br />
		</td>
		<td id="page">
			<h2>Create New Question</h2>
			<?php if (!empty($message)) {echo "<p class=\"message\">" . $message . "</p>";} ?>
			<?php if (!empty($errors)) { display_errors($errors); } ?>
			<form action="question_update.php" method="post">
			<table>
				<tr>
					<td>Question:</td>
					<td><input type="text" name="question" maxlength="30" value="<?php //echo htmlentities($question); ?>" /></td>
				</tr>
                
				<tr>
					<td colspan="1"><input type="submit" name="submit" value="Create question" /></td>
				</tr>
               
                
			</table>
			</form>
		</td>
	</tr>
</table>
<?php include("includes/footer.php"); ?>