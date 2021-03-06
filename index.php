<?php require_once("includes/connection.php"); ?>
<?php require_once("includes/functions.php"); ?>

<?php find_selected_page(); ?>
<?php include("includes/header.php"); ?>
<table id="structure">
	<tr>
		<td id="navigation">
			<?php echo public_navigation($sel_subject, $sel_page); ?>
			<li><a href="login.php">Login</a></li>
			<li><a href="add_user.php">Add User</a></li>
		</td>
		<td id="page">
			<?php if ($sel_page) { ?>
				<h2><?php echo htmlentities($sel_page['survey_menu_name']); ?></h2>
				<div class="page-content">
					<?php echo strip_tags(nl2br($sel_page['content']), "<b><br><p><a>"); ?>
				</div>
			<?php } else { ?>
				<h2>Welcome to survey systems</h2>
			<?php } ?>
		</td>
	</tr>
</table>
<?php include("includes/footer.php"); ?>