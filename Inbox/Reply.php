<?php
include "../global.php";
?>
<div class="lander">
	<?php
	if($logged){
		$getMessage = $_GET['id'];
		$MessageQUERY = $mysqli->query("SELECT * FROM `messages` WHERE `id`='$getMessage'");
		$Message = $MessageQUERY->fetch_array();
		$senderRaw = $Message['senderID'];
		$senderQUERY = $mysqli->query("SELECT * FROM `accounts` WHERE `id`='$senderRaw'");
		$sender = $senderQUERY->fetch_array();
		
		if(!$getMessage){
			die("You have not specified any message ID.");
		}
		
		if(!$Message){
			die("That message is not found.");
		}
		
		if($Message['recieverID'] != $uID){
			die("That message is not for you.");
		}
		
		if($_POST){
			if($_POST["subject"] && $_POST["message"]){
						$subject = $mysqli->real_escape_string(strip_tags($_POST["subject"]));
 	 					$message = $mysqli->real_escape_string(strip_tags($_POST["message"]));
 	 					
 	 					if($subject == "" || $message == ""){
 	 						die("You cannot leave any fields blank.");
 	 					}elseif(strlen($subject) > 50 || strlen($message) > 1000){
 	 						die("The subject or the message character count is too high.");
 	 					}else{
 	 						$mysqli->query("INSERT INTO `messages` (`senderID`, `recieverID`, `subject`, `message`) VALUES ('$uID', '$senderRaw', '$subject', '$message')");
 	 						die("Sent!");
 	 					}
			}
		}
		
		
		?>
		<h3>You are replying to a message by <b><?php echo $sender['username']; ?></b></h3>
		<form method="post" action="">
								<table border="0">
									<tr>
										<td><b>Subject:</b></td>

										<td>
										<input type="text" name="subject" maxlength="50" value="RE: <?php echo $Message['subject']; ?>" class="input-box"></td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td><b>Message:</b></td>

										<td>
										<textarea name="message" maxlength="1000" rows="7" cols="50" class="input-text" style="padding-top:15px;">
																
--------------------------------------------
Sent on: <?php echo $Message['date']; ?>
Sent by: <?Php echo $sender['username']; ?>										
									
<?php echo $Message['message']; ?>						
										
										
										</textarea></td>
									</tr>
									<tr>
										<td><input type="submit" value="Reply" name="wot" class="btn"></td>
									</tr>
								</table>
							</form>
	
	
		<?php
		
	
		
		
	}
	
	
	?>
	
	</div>

		<?php include "../footer.php"; ?>