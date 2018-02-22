<?php
include "../global.php";
	$getid = $_GET['ID'];
	$FID = $_GET['ID'];
	$uID = $usr['id'];
	
	$fetchreply = $mysqli->query("SELECT * FROM `replies` WHERE `threadID`='$FID'");
		$frow = mysqli_fetch_array($fetchreply);
		
		$rid = $frow['id'];
	
			$forum = $mysqli->query("SELECT * FROM `threads` WHERE `ID`='$FID'");
				$frow = mysqli_fetch_array($forum);
				
					$authorid = $frow['posterID'];
						$authorcheck = $mysqli->query("SELECT * FROM `accounts` WHERE `id`='$authorid'");
						$author = $authorcheck->fetch_array();
	
						
					if($_POST["Delete"]){
						$mysqli->query("DELETE FROM `threads` WHERE `ID`='$FID'");
							die("<META http-equiv=refresh content=1;URL=/Forum/>");
							}
							
							$body = $mysqli->real_escape_string(strip_tags(stripslashes($_POST['body'])));	
							
							if($_POST["Reply"]){
								$mysqli->query("INSERT INTO `replies` (body, threadID, replyID) VALUES ('$body', '$FID', '$uID')");
									die("<META http-equiv=refresh content=1;URL=/Forum/");
									}	
										if($_POST["rdelete"]){
											$mysqli->query("DELETE FROM `replies` WHERE `id`='$FID'");
												die("<META http-equiv=refresh content=1;URL=/Forum/");
											}
											
												
							/*
								if($_POST["Scrub"]){
									$mysqli->query("UPDATE `threads` SET `title`='Deleted' AND `body`='Deleted' WHERE `ID`='$FID'");
										die("<META http-equiv=refresh content=1;URL=/Forum/>");
										}
							*/
?>
<div class="lander">
<table border="0">
	<tr style="float:left;height:250px;width:130px;border-right:1.5px solid #A6A6A6;">
		<td style="float:left;">
		<center><a href="/User/?id=<?php echo $author['id']; ?>"><?php echo "" . $author['username'] . ""; ?></a><br /></center>
			<img src="http://placehold.it/110x150"><br />
			<b>Status:</b> <?php if($author['isstatus'] == 'true'){ echo "<font color='green'>Online</font>"; } else { echo "<font
			color='red'>Offline</font>"; } ?>
		</td>
	</tr>
		<tr style="float:left;margin-left:20px;width:400px;">
			<td style="float:left;height:200px;width:400px;">
				<b><font size='5'><?php echo "" .$frow['title'] . ""; ?></font></b><br /><br>
			<?php 
				echo "" . $frow['body'] . "";
			?>
				<?php if($usr['Admin'] == "true"){ ?>
					<br /><br>
						<form method="post" action="">
							<input type="submit" name="Delete" value="Delete" class="btn">
							<input type="submit" name="Scrub" value="Scrub" class="btn">
						</form>
				<? } ?>
			</td>
		</tr>
		<tr>
			<td><h3>Replies</h3></td>
		</tr>
		<?php	
		
			
				
				$fetchreply = $mysqli->query("SELECT * FROM `replies` WHERE `threadID`='$FID'");
					while($row = mysqli_fetch_array($fetchreply)) {
				
					$ID = $row['replyID'];	
					
					$fetchuserr = $mysqli->query("SELECT * FROM `accounts` WHERE `id`='$ID'");
						$ruser = mysqli_fetch_array($fetchuserr);
		?>
		<tr>
			<td></td>
		</tr>
		<tr style="float:left;height:250px;width:130px;border-right:1.5px solid #ccc;">
		<td>
		<center><a href="/User/?id=<?php echo $ruser['id']; ?>"><?php echo "" . $ruser['username'] . ""; ?></a><br /></center>
			<img src="http://placehold.it/110x150"><br />
			<b>Status:</b> <?php if($ruser['isstatus'] == 'true'){ echo "<font color='green'>Online</font>"; } else { echo "<font
			color='red'>Offline</font>"; } ?>
		</td>
		</tr>
			<tr style="float:left;margin-left:20px;width:400px;">
			<td style="float:left;height:200px;width:400px;">
			<td>
			<h3>RE: <?php echo "" .$frow['title'] . ""; ?></h3>
			<?php echo $row['body']; ?>
			<br /><br>
			<?php if($usr['Admin'] == "true"){ ?>
			<form method="post" action="">
				<input type="submit" name="rdelete" class="btn" value="Delete">
			</form>
			<? } ?>
			</td>
		</tr>	
		<? } ?>
			<form method="post" action="">
				<tr>
					<td><br /><br><textarea class="input-texta" name="body" rows="5" cols="50" placeholder="Reply to this thread here."></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" class="btn" name="Reply" value="Reply"></td>
				</tr>
			</form>
</table>
</div>
	

	