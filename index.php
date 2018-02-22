<?php include "global.php"; 

if(!$logged){
	if($_POST){
	  if($_POST["username"] && $_POST["password"] && $_POST["email"]){
		$username = $mysqli->real_escape_string(strip_tags($_POST["username"]));
 	 	$password = $mysqli->real_escape_string(md5(strip_tags($_POST["password"])));
 	 	$email = $mysqli->real_escape_string(strip_tags($_POST["email"]));
	
		if($username && $password && $email){
				$checkquery = $mysqli->query("SELECT * FROM `accounts` WHERE `username`='$username'");
				$check = $checkquery->fetch_array();
				
				$checkquery2 = $mysqli->query("SELECT * FROM `accounts` WHERE `email`='$email'");
				$check2 = $checkquery2->fetch_array();
			
					if($check != 0){
						die("<div style='margin:10px;padding:4px;color:red;'>That username has been taken.");
					}elseif($check2 != 0){
						die("<div style='margin:10px;padding:4px;color:red;'>That email is already in use. Please login.");
						
					}else{
							$mysqli->query("INSERT INTO `accounts` (`username`, `password`, `email`) VALUES ('$username', '$password', '$email')");
	
						 	setcookie("username", hash("sha512", $username), time() + 24 * 60 * 60, "/");
      							setcookie("password", $password, time() + 24 * 60 * 60, "/");	
	
						 	die("<div style='margin:10px;padding:4px;'>Your account has been created.</div><META http-equiv=refresh content=1;URL=/signin.php>");
       						}
       					}	
				}	 
			}	
		}
	
?>
	<body>
		<?php if(!$logged) { 
			echo '<div class="lander">
				<span style="font-size:25px;">Sign Up</span> / <small><a href="signin.php">Sign In</a></small><br />
					In order to access the website, you have to sign up or sign in.
					<br /><br>
						<form method="post" action="">
							<table border="0">
								<tr>
									<td><b>Username:</b></td>
									<td><input type="text" name="username" class="input-box"></td>
								</tr>
								<tr>
									<td><b>Password:</b></td>
									<td><input type="password" name="password" class="input-box"></td>
								</tr>
								<tr>
									<td><b>Email:</b></td>
									<td><input type="email" name="email" class="input-box" style="margin-bottom:15px;"></td>
								</tr>
								<tr>
									<td style="border-right:1.5px solid #EAEAEA;width:50%;text-align:center"><input type="submit" class="input-btn-green"></td>
									<td style="width:50%;text-align:center"><input type="submit" class="input-btn-red"></td>
								</tr>
							</table>
						</form>
			</div>
			
			';
			}
			?>
			<?php if($logged) { ?>
			<div class="lander">
					<h1>Welcome</h1>
						Thank you for creating an account.
							<h2>Account Details</h3>
								<b>Username:</b> <?php echo $usr['username']; ?><br />
								<b>Email:</b> <?php echo $usr['email']; ?><br /><br>
								<a href="/Forum/">Chat on the forum</a><br />
								<a href="#">Create Items</a><br />
								<a href="#">Trade Items</a><br /><br>	
								What will you do?
				</div>
			<? } ?>
		
			<?php include "footer.php"; ?>
	</body>
</html>
	