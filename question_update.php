<?php require_once("includes/session.php"); ?>
<?php require_once("includes/connection.php"); ?>
<?php require_once("includes/functions.php"); ?>
<?php confirm_logged_in(); ?>
<?php is_admin(); ?>
<?php 
	include_once("includes/form_functions.php");
	include("includes/header.php"); ?>
   <table id="structure">
	<tr>
		<td id="navigation">
			<a href="content.php">Return to Menu</a><br />
			<br />
		</td>
		<td id="page">
   <?php 
	// START FORM PROCESSING
	if (isset($_POST['submit'])) { // Form has been submitted.
		$errors = array();

		// perform validations on the form data
		$required_fields = array('question');
		$errors = array_merge($errors, check_required_fields($required_fields, $_POST));

		$fields_with_lengths = array('question' => 300 );
		$errors = array_merge($errors, check_max_field_lengths($fields_with_lengths, $_POST));

		$question = trim(mysql_prep($_POST['question']));
        
       
		if ( empty($errors) ) {
             $question_set = mysql_query("SELECT * FROM survey_field", $connection);
		if (!$question_set) {
			die("Database query failed: " . mysql_error());
		}while ($question_final = mysql_fetch_array($question_set)) {
			$id_value=$question_final["survey_id"];
        }
			$query = "UPDATE survey_question SET survey_name = '{$question}', type = '{$_POST['type']}' WHERE question_id = {$_POST['question_id']}";
			//echo $query; exit;
			$result = mysql_query($query, $connection);

			$query = "DELETE FROM survey_question_answers WHERE question_id = {$_POST['question_id']}";
			$result = mysql_query($query, $connection);
			//echo '<pre/>';
            //print_r($_POST); exit;
            foreach ($_POST['answer'] as $key => $value) {
            	if (!empty($value)) {
            		$query = "INSERT INTO survey_question_answers (
							question_id,answer,ans_type
						) VALUES (
							'{$_POST['question_id']}','{$value}', '{$_POST['type']}'
						) ";
                    $result = mysql_query($query, $connection);
            	}
            }
            


			if ($result) {
				$message = "The Question was update successfully.";
				//$message = "<a href="content.php">Return to Menu</a>";

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
	
      if (!empty($message)) {echo "<p class=\"message\">" . $message . "</p>";}
	  if (!empty($errors)) { display_errors($errors); }


 } 

        else { // Form has not been submitted.
                $question = "";
?>

		
			<h2>Create New Question</h2>
			
			<form action="question_update.php" method="post">
			<table>
			    <?php $question = mysql_query("SELECT * FROM survey_question WHERE question_id = {$_GET['question_id']}", $connection);
				      $question = mysql_fetch_array($question);

				      $answers_set = mysql_query("SELECT * FROM survey_question_answers WHERE question_id = {$question['question_id']}", $connection);
				 ?>
				<tr>
					<td>Question title:</td>
					<td><input type="text" name="question" maxlength="300" value="<?php echo htmlentities($question['survey_name']); ?>" />
					    <input type="hidden" name="question_id" value="<?php echo $question['question_id']; ?>" />
					</td>
				</tr>
                <tr><td>question type: </td>
					<td><select name="type">
					<?php foreach (['radio' => 'Radio Button', 'checkbox' => 'CheckBox'] as $key => $value) : ?>
					  <option value="<?php echo $key?>" <?php if ($question['type'] == $key) echo 'selected'; ?>><?php echo $value?></option>
					 <?php endforeach; ?>
					</select> if see radio button just type "yes" or "no":</td>
				</tr>
				
				<?php  $answer_no = 1;
				    while ($answer = mysql_fetch_array($answers_set)) : ?>
				<tr>
					<td>Possible Answer <?php echo $answer_no++ ;?>:</td>
					<td><input type="text" name="answer[]" maxlength="300" value="<?php echo $answer['answer']; ?>" /></td>
				</tr>
			   <?php endwhile; ?>
				<tr>
					<td>Possible Answer <?php echo $answer_no++ ;?> </td>
					<td><input type="text" name="answer[]" maxlength="300" value="<?php //echo htmlentities($question); ?>" /></td>
				</tr>
				<tr>
					<td>Possible Answer <?php echo $answer_no++ ;?></td>
					<td><input type="text" name="answer[]" maxlength="300" value="<?php //echo htmlentities($question); ?>" /></td>
				</tr>
				<tr>
					<td>Possible Answer <?php echo $answer_no++ ;?></td>
					<td><input type="text" name="answer[]" maxlength="300" value="<?php //echo htmlentities($question); ?>" /></td>
				</tr>
				<tr>
					<td>Possible Answer <?php echo $answer_no++ ;?></td>
					<td><input type="text" name="answer[]" maxlength="300" value="<?php //echo htmlentities($question); ?>" /></td>
				</tr>
				<tr>
					<td colspan="5"><input type="submit" name="submit" value="Edit question" /></td>
				</tr>
			</table>
			</form>
			<?php } ?>
		</td>
	</tr>
</table>

<?php include("includes/footer.php"); ?>