<?
	include "../global.php";
?>
	<div class="lander">
		<h1>The Lorias Forums</h1>
		Talk about specific topics here. Read the <a href="/Rules">forum rules</a> before posting.
		
		<br /><br />
		
		<table style="width: 100%;">
			<tr>
				<td class="forumheader">
					<table style="width: 100%;">
						<tr>
							<td style="width: 60%;">
								Lorias Forum
							</td>
							<td style="width: 20%;">
								Last Poster
							</td>
							<td style="width: 20%;">
								Threads
							</td>
						</tr>
					</table>
				</td>
			</tr>
		<?php
			$result = $mysqli->query("SELECT * FROM `forums` ORDER BY id");
			while($row = $result->fetch_array()){
		?>
		
			<tr>
				<td class="forumboard">
					<table style="width: 100%;">
						<tr>
							<td style="width: 60%;">
								<a href="/Forum/ViewTopic.php?ID=<?php echo $row['id']; ?>" style="font-size: 16px; font-weight: bold;"><?php echo $row['name']; ?></a><br />
								<span style="font-size: 15px;"><?php echo $row['description']; ?></span>
							</td>
							<td style="width: 20%;">
								<?php
									echo $row['lastPoster'];
								?>
							</td>
							<td style="width: 20%;">
								<?php
									$threadcheck = $mysqli->query("SELECT * FROM `threads` WHERE `category`='$row[id]'");
									$thread = $threadcheck->num_rows;
									
									echo $thread;
								?>
							</td>
						</tr>
					</table>
				</td>	
			</tr>
		<?php
			}
		?>
		</table>
	</div>

<?php include "../footer.php"; ?>