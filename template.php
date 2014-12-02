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
		<?php if (!is_null($sel_subject)) { // subject selected ?>
			<h2><?php echo $sel_subject['menu_name']; ?></h2>
		<?php } elseif (!is_null($sel_page)) { // page selected ?>
			<h2><?php echo $sel_page['menu_name']; ?></h2>
			<div class="page-content">
				<?php echo $sel_page['content']; ?>
			</div>
			<br />
			<a href="edit_page.php?page=<?php echo urlencode($sel_page['id']); ?>">Edit page</a>
		<?php } else { // nothing selected ?>
			<h2>Select your question and answer all of question</h2>
          <?php 
                      
      
        $question_set = mysql_query("SELECT * FROM survey_question", $connection);
		if (!$question_set) {
			die("Database query failed: " . mysql_error());
		}

		while ($question = mysql_fetch_array($question_set)) {
			echo "{$question["survey_name"]}</br>";
			$ans_set = mysql_query("SELECT * FROM survey_question_answers WHERE question_id = {$question["question_id"]}" , $connection);
			if (!$ans_set) {
				die("Database query failed: " . mysql_error());
			}

			//echo "<ul class=\"pages\">";
			while ($ans = mysql_fetch_array($ans_set)) {
                if($ans["ans_type"]=="chechkbox"){
                 echo "{$ans["answer"]}</br>";
                }
				elseif($ans["ans_type"]=="radiobutton"){
                echo "{$ans["answer"]}</br>";
                }
                else{
                echo "{$ans["answer"]}</br>";
                }
			}
    
        }

		?>
            
		<?php } ?>
		</td>
	</tr>
</table>
<?php require("includes/footer.php"); ?>