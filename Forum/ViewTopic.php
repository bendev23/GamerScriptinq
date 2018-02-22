<?
	include "../global.php";
?>
		<div class="lander">
			<?php
				$ID = $_GET['ID'];
				
				$forumcheck = $mysqli->query("SELECT * FROM `forums` WHERE `id`='$ID'");
				$forum = $forumcheck->fetch_array();
				
				if(!$_GET['ID']){
					die("<div class='alert'>No ID was specified.</div>");
				}
			?>
						
			<h1><?php echo $forum['name']; ?></h1>
			<?php echo $forum['description']; ?>
			<br /><br />
			
			<div style="float: left;">
				<a class="btn" href="compose.php?ID=<?php echo $ID; ?>">Create Thread</a>
			</div>
						
			<br /><br>
			<table style="width: 100%;">
				<tr>
					<td class="forumheader">
						<table style="width: 100%;">
							<tr>
								<td style="width: 60%;">
									Lorias Forum
								</td>
								<td style="width: 20%;">
									Author
								</td>
								<td style="width: 20%;">
									Views
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<?php
					$result = $mysqli->query("SELECT * FROM `threads` WHERE `category`='$ID' ORDER BY `id`");
					
					while($row = $result->fetch_array()){
						
						$authorid = $row['posterID'];
						$authorcheck = $mysqli->query("SELECT * FROM `accounts` WHERE `id`='$authorid'");
						$author = $authorcheck->fetch_array();
				?>
				<tr>
					<td class="forumboard">
						<table style="width: 100%;">
							<tr>
								<td style="width: 60%;"> 
									<a href="/Forum/ViewThread.php?ID=<?php echo $row['id'] ?>"><?php echo $row['title']; ?></a><br>
								</td>
								<td style="width: 20%;">
									<a href="/User/?id=<?php echo $author['id']; ?>"><?php echo $author['username']; ?></a>
								</td>
								<td style="width: 20%;">
									<?php echo $row['view']; ?>
								</td>
							</tr>
						</table>
				<?php
					}
				?>