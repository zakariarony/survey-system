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
			<a href="new_subject.php">+ Add a new subject</a>
		</td>
		<td id="page">
		<?php if (!is_null($sel_subject)) { // subject selected ?>
			<h2><?php echo $sel_subject['survey_menu_name']; ?></h2>
		<?php } elseif (!is_null($sel_page)) { // page selected ?>
			<h2><?php echo $sel_page['survey_menu_name']; ?></h2>
			<h3> <a href="question_update.php">Add new question</a></br></h3>
			<div class="page-content">
			<?php if($_GET['page']){
                       $question_set = mysql_query("SELECT * FROM survey_question WHERE page_id = {$_GET['page']}", $connection);

				      while ($question = mysql_fetch_array($question_set)) {
                         echo $question['survey_name'] ?>
                         <a href="question_update.php?question_id=<?php echo $question['question_id']; ?>">Edit</a></br>
				     <?php }
				}?>
			
				
			</div>
			<br />
			<a href="edit_page.php?page=<?php echo urlencode($sel_page['id']); ?>">Edit page</a>
			<a href="view_survey_questions.php?page=<?php echo urlencode($sel_page['id']); ?>">view survey page</a>
		<?php } else { // nothing selected ?>
			<h2>Select a subject or page to edit</h2>
		<?php } ?>
		</td>
	</tr>
</table>
<?php require("includes/footer.php"); ?>
