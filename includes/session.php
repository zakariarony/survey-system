<?php
	session_start();
	
	function logged_in() {
		return isset($_SESSION['user_id']);
		/*if($_SESSION['user_type']=='admin') {
			return true
		} else if($_SESSION['user_type']=='normal') {
			return true;
		}
		return false;*/
	}
	
	function confirm_logged_in() {
		if (!logged_in()) {
			redirect_to("login.php");
		}
	}

	function is_admin()
	{		
		if($_SESSION['user_type']=='admin') {
			return true;
		}
		redirect_to("content.php");
	}
?>
