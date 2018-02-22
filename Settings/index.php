<?php include "../global.php";
$_GET['tab'];

if(!$_GET) {
	header('Location: /Settings/?tab=info');
}

$uid = $usr['id'];
$uDesc = $usr['description'];

$description = $mysqli->real_escape_string(strip_tags(stripslashes($_POST['description']))); 
$nemail = $mysqli->real_escape_string(strip_tags(stripslashes($_POST['nemail']))); 
$npassword = $mysqli->real_escape_string(strip_tags(stripslashes($_POST['npassword'])));

	if($_POST["desc"]){ 
			$mysqli->query("UPDATE `accounts` SET `description`='$description' WHERE `id`='$uid'");
				die("<META http-equiv=refresh content=1;URL=/Settings/>");
		}
			if($_POST["email"]){
				$mysqli->query("UPDATE `accounts` SET `email`='$nemail' WHERE `id`='$uid'");
					die("<META http-equiv=refresh content=1;URL=/Settings/>");
			}
						
					if($_POST["emailDis"]){
						if($usr['showemail'] == '0'){
							$mysqli->query("UPDATE `accounts` SET `showemail`='1' WHERE `id`='$uID'");
								echo("The public cannot see your email now.");
									die("<META http-equiv=refresh content=1;URL=/Settings/>");
									}
						else if($usr['showemail'] == '1'){
							$mysqli->query("UPDATE `accounts` SET `showemail`='0' WHERE `id`='$uid'");
								echo("<div style='padding:4px;margin:9px;'>The public can see your email now.</div>");
									die("<META http-equiv=refresh content=1;URL=/Settings/>");	
									}
								}	
									if($_POST["status"]) {
										if($usr['showstatus'] == '0'){
									$mysqli->query("UPDATE `accounts` SET `showstatus`='1' WHERE `id`='$uid'");
										}
											else if($usr['showstatus'] == '1'){
												$mysqli->query("UPDATE `accounts` SET `showstatus`='0' WHERE `id`='$uid'");	
												}
											}
?>
	<body>
		<div class="lander">
			<?php if($logged) { ?>
				<h1>Settings</h1>
					<table>
						<tr>
							<td style="vertical-align:text-top:padding:14px;">
								<div class="verticaloptionpanel">
									<div class="verticaltitle">Settings Menu</div>
									<a class="verticaloption" href="?tab=info">My Info</a>
									<a class="verticaloption" href="?tab=email">Update Email</a>
									<a class="verticaloption" href="?tab=password">Update Password</a>
									<a class="verticaloption" href="?tab=desc">Update Description</a>
									<a class="verticaloption last" href="?tab=toggle">Enable/Disable Settings</a>
								</div>
							</td>
								<td style="vertical-align:text-top;padding:14px;">
									<?php if($_GET['tab'] == 'info') { ?>
									<h3>Account Info</h3>
										Current Email: <i><?php echo $usr['email'] ?></i><br />
										Current Username: <i><?php echo $usr['username'] ?></i><br />
										Hidden Email: <i><?php if($usr['showemail'] == '0'){ echo "False"; }else{ echo "True"; } ?></i>
									<? } ?>
									
									<?php if($_GET['tab'] == 'email'){ ?>
									<h3>Email Settings</h3>
									<form method="post" action="">
										<table border="0">
											<tr>
												<td>
												<b>Update Email:</b><br /></td>
												<td><input type="text" name="nemail" class="input-box"></td>
											</tr>
											<tr>
												<td><input type="submit" value="Update" name="email" class="btn"></td>
											</tr>
										</table>
									</form>
									<? } ?>
									
									<?php if($_GET['tab'] == 'password') { ?>
									<h3>Password Settings</h3>
									<form method="post" action="">
										<table border="0">
											<tr>
												<td><b>New Password:</b></td>
												<td><input type="password" name="npassword" class="input-box" disabled></td>
											</tr>	
											<tr>
												<td><input type="submit" value="Update" name="pass" class="btn" disabled></td>
											</tr>
										</table>
									</form>
									<? } ?>
									
									<?php if($_GET['tab'] == 'desc') { ?>
									<h3>Account Description</h3>
									<form method="post" action="">
									<table border="0">
										<tr>
											<td><b>Description:</b></td>
											<td>
												<textarea name="description" rows="3" cols="40" class="input-text"><?php echo $uDesc; ?></textarea></td>
										</tr>
										<tr>
											<td><input type="submit" value="Update" name="desc" class="btn"></td>
										</tr>
									</table>
									</form>
									<? } ?>
									
									<?php if($_GET['tab'] == 'toggle') { ?>
									<h3>Toggle Settings</h3>
									<form method="post" action="">
										<table border="0">
											<tr>
												<td><b>Disable</b></td>
											<tr>
												<td>Show my email on my profile:</td>
												<td><td><input type="submit" value="<?php if($usr['showemail'] == '0'){ echo "Enable"; }else{ echo "Disable"; } ?>" name="emailDis" class="btn"></td>
											</tr>
										</table>
									</form>
									<? } ?>
							</tr>
						</table>
					</table>	
				<? } ?>
			</div>
		</body>
	</div>
		<?php include "../footer.php"; ?>
</html>
	