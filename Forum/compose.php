<?php
	include "../global.php";

		
?>

<div class="lander">
	<?php
		$boardid = $_GET['ID'];
		$boardcheck = $mysqli->query("SELECT * FROM `forums` WHERE `id`='$boardid'");
		$board = $boardcheck->fetch_array();
		
		if(!$_GET['ID']){
			die("<div class='alert'>You didn't specify an ID.</div>");
		}

		if($_POST["post"]){
			if($_POST['title'] && $_POST['content']){
				$title = $mysqli->real_escape_string(strip_tags(stripslashes($_POST["title"])));
				$content = $mysqli->real_escape_string(strip_tags(nl2br(stripslashes($_POST["content"]))));			
			
				if(strlen($title) < 5){
					die("<div class='alert'>That title is too short.</div>");
				}
				if(strlen($title) > 30){
					die("<div class='alert'>That title is too long.</div>");
				}
				if(strlen($content) < 10){
					die("<div class='alert'>Your content is too short.</div>");
				}
				if(strlen($content) > 5000){
					die("<div class='alert'>Your content is too long.</div>");
				}
				
				$mysqli->query("INSERT INTO `threads` (title, body, category, posterid, lastPoster) VALUES ('$title', '$content', '$board[id]', '$usr[id]', '$usr[username]')");
				$mysqli->query("UPDATE `forums` SET `lastPoster`='$usr[username]' WHERE `id`='$board[id]'");
				$mysqli->query("UPDATE `forums` SET `posts`=`posts` + 1 WHERE `id`='$board[id]'");
				$mysqli->query("UPDATE `forums` SET `threads`=`threads` + 1 WHERE `id`='$board[id]'");

				
				die("<META http-equiv=refresh content=1;URL=/Forum/>");
			}
		}	
	?>
	
	<h1>Posting in <?php echo $board['name']; ?></h1>
	Don't want to post anymore? Click back to go back! Simple.
	<br /><br />

		<table style="width: 100%;">
			<tr>
				<td class="forumheader">
					<table>
						<tr>
							<td>
								Creating a New Thread
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="forumboard">			
					<form method="post" action="">
						<table style="width: 100%;" border="0">
							<tr>
								<td>Subject</td>
								<td><input type="text" class="input-box" name="title" style="width: 100%"></td>
							</tr>
							<tr>
								<td>Content:</td>
								<td><textarea class="input-texta" name="content" rows="10" cols="70" style="width: 100%;"></textarea></td>			
							</tr>
							<tr>
								<td>
									<input type="submit" name="post" class="btn" value="Create Thread"> or
									<a onclick="history.go(-1)">Go Back</a>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
</div>

<?
	echo $newrecord
?>