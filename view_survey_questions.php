<?php require_once("includes/session.php"); ?>
<?php require_once("includes/connection.php"); ?>
<?php require_once("includes/functions.php"); ?>
<?php confirm_logged_in(); ?>
<?php find_selected_page(); ?>
<?php include("includes/header.php"); ?>


<table id="structure">
	<tr>
		<td id="navigation">
			<?php echo navigation($sel_subject, $sel_page); ?>
			<br />
			
		</td>
		<td id="page">              
<?php
          /* Submit query */
		if (isset($_POST['submit'])) { // Form has been submitted.
				$errors = array();
//echo '<pre/>'; print_r($_SESSION); exit;
				// perform validations on the form data
				/*$required_fields = array('question');
				$errors = array_merge($errors, check_required_fields($required_fields, $_POST));

				$fields_with_lengths = array('question' => 300 );
				$errors = array_merge($errors, check_max_field_lengths($fields_with_lengths, $_POST));

				$question = trim(mysql_prep($_POST['question']));*/
		        
		       
				if ( empty($errors) ) {
		            //echo "<pre>"; print_r($_POST);exit;
		            foreach ($_POST as $question_id => $answers) {
                        if (is_int($question_id) && isset($_SESSION['user_id'])) {
                        	$answerString = implode($answers, ',');
                            $query = "INSERT INTO user_answers (
									question_id,user_id,answer, page_id
								) VALUES (
									'{$question_id}','{$_SESSION['user_id']}', '{$answerString}', '{$_POST['page_id']}'
								) ";
		                    $result = mysql_query($query, $connection);
                        }
		            }

		            echo "<h2> Your survey answers are saved! </h2>";
			    }

        } else {
?>

		
			<h2>Select your question and answer all of question</h2>
          <?php 
                      
      
        $question_set = mysql_query("SELECT * FROM survey_question WHERE 
        	page_id ={$sel_page['id']}" , $connection);
		if (!$question_set) {
			//die("Database query failed: " . mysql_error());
			echo 'No questions found!'; exit;
		}
		else {
			$survey_completed = mysql_query("SELECT * FROM user_answers WHERE 
        	page_id ={$sel_page['id']} AND user_id = {$_SESSION['user_id']}" , $connection);
        	
        	$survey = mysql_fetch_array($survey_completed,  MYSQL_ASSOC);
        	
        	if($survey) {
        		echo "You have done it already";
        	} else {
        		while ($question = mysql_fetch_array($question_set,  MYSQL_ASSOC)) {
			echo "<h2>{$question["survey_name"]} </h2></br>";
			$ans_set = mysql_query("SELECT * FROM survey_question_answers WHERE question_id = {$question["question_id"]}" , $connection);
			if (!$ans_set) {
				//die("Database query failed: " . mysql_error());
			}?>

			<form action="view_survey_questions.php" method="post">
			<?php
			while ($answers = mysql_fetch_array($ans_set, MYSQL_ASSOC)) {?>
					<input type="hidden" value="<?php echo $sel_page['id']?>" name="page_id">
                	<input type="<?php echo $answers['ans_type']?>" name="<?php echo $answers['question_id'] . '[]'?>" value="<?php echo $answers['survey_question_ans_id']?>">
                	<?php
                    //if ($answers['ans_type'] == 'checkbox') {
                    	echo $answers['answer'];
                    //}
                    	if (strtolower($answers['answer']) == 'other') {
                    	echo "<span id='other_option_{$answers['survey_question_ans_id']}' class='other_option'><input type=\"text\" name=\"{$answers['question_id']}[]\"></span>";
                    	}
                	
               
               
              
                }
				
            
            }
            echo "</br>";
            echo "</br>";
            echo "<input type=\"submit\" name=\"submit\"  value=\"submit\"/>";
            echo "</form>";
        	}
		}
		
            
		
    
         }
		?>
            
		<?php  ?>
		</td>

	</tr>
</table>
<?php require("includes/footer.php"); ?>