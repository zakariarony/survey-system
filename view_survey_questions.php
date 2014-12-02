<?php// require_once("includes/session.php"); ?>
<?php require_once("includes/connection.php"); ?>
<?php require_once("includes/functions.php"); ?>
<?php// confirm_logged_in(); ?>
<?php find_selected_page(); ?>
<?php include("includes/header.php"); ?>
<table id="structure">
	<tr>
		<td id="navigation">
			<?php echo navigation($sel_subject, $sel_page); ?>
			<br />
			
		</td>
		<td id="page">
		
			<h2>Select your question and answer all of question</h2>
          <?php 
                      
      
        $question_set = mysql_query("SELECT * FROM survey_question WHERE 
        	page_id ={$sel_page['id']}" , $connection);
		if (!$question_set) {
			die("Database query failed: " . mysql_error());
		}

		while ($question = mysql_fetch_array($question_set,  MYSQL_ASSOC)) {
			echo "<h2>{$question["survey_name"]} </h2></br>";
			$ans_set = mysql_query("SELECT * FROM survey_question_answers WHERE question_id = {$question["question_id"]}" , $connection);
			if (!$ans_set) {
				die("Database query failed: " . mysql_error());
			}?>

			<form action="">
			<?php
			while ($answers = mysql_fetch_array($ans_set, MYSQL_ASSOC)) {?>

			     if($type_value=$answers['ans_type']=="chechkbox"){

			     
				
                	<input type="<?php echo $type_value?>" name="<?php echo $answers['survey_question_ans_id']?>" value="<?php echo $answers['survey_question_ans_id']?>">
                	<?php }
                    //if ($answers['ans_type'] == 'checkbox') {
                    	echo $answers['answer'];
                    //}
                	
               
               
              
                }
				
              
           
            echo "</form>";
		
    

		?>
            
		<?php  ?>
		</td>

	</tr>
</table>
<?php require("includes/footer.php"); ?>