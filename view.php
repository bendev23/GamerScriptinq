<?php
include($_SERVER['DOCUMENT_ROOT']."/Header.php");
if ($forumDisabled == "true") {
	header('location:http://www.avatarhub.tk/Forum/forumDisabled.php');
}
	if (!$User) {
		header("Location: /loginrequired.php");
			exit;
	}
		$getTopics = mysql_query("SELECT * FROM Topics ORDER BY ID");
			echo "
			<table>
				<tr>
					<td width='800'>
						<h3>Forum</h3>
					</td>
				<td width='150'>
					<h3>Number of Posts</h3>
				</td>
			</tr>
			</table>
			";
				while ($gT = mysql_fetch_object($getTopics)) {
					echo "
			<table>
				<tr>
					<td width='800'><div id='topBar'>
						<a href='/Forum/ViewTopic.php?ID=$gT->ID' style='font-size:13px;'><font color='white'><b>".$gT->TopicName."</font></b></a>
					</div>
							<div id='aB'>
								<font style='font-size:8pt'>".$gT->TopicDescription."</font>	
					</td>
				<td width='50'><div id='aB' style='height:50px;text-align:center;line-height:50px;'>
						";
							$Posts = mysql_num_rows($Posts = mysql_query("SELECT * FROM Threads WHERE tid='".$gT->ID."'"));
								echo "
									".number_format($Posts)."		
							</div>	
								</div>
									</td>
				</tr>
			</table>
				<br />
					";
				}
					include($_SERVER['DOCUMENT_ROOT']."/Footer.php");