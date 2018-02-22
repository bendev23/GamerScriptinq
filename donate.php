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
		<div class="lander">
			<h1>Donate To Lorias</h1>
				Donating keeps us alive. Until we establish an income, we rely on loyal users
				to keep the servers running. We run all donations through our friends, <a href="http://infernohost.co/index.php"><font color="red">Inferno Web Media</font></a>, for security purposes.
				<br /><br>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
					<input type="hidden" name="cmd" value="_s-xclick">
						<input type="hidden" name="hosted_button_id" value="XXFEXLM5NXWGC">
							<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online.">
								<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
				</form>
					<small>By donating, you acknowledge that all donations are non-refundable. Exceptions may be made, but
					we are not obliged to refund your donation. If you seek support for payments, please contact sales@loriasnetwork.tk.</small>
		
			<?php include "footer.php" ;?>
	</body>
</html>
	 