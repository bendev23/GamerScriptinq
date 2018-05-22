<?php
if($usr['Admin'] == "false"){
	header('location:/maintenance.html');
}

ob_start();
	$mysqli = new mysqli("localhost","loriasne_user","chez1","loriasne_main");
		global $mysqli;	
		

	
	$shoutquery = $mysqli->query("SELECT * FROM `shout`");
		$shout = $shoutquery->fetch_array();
			$shoutmsg = $shout['shout'];
				$shouterid = $shout['shouter'];
					$shouterquery = $mysqli->query("SELECT * FROM `accounts` WHERE `id`='$shouterid'");
       						 $shouter = $shouterquery->fetch_array();
 
		function thetime()
			{
				$thetime = getdate();
				print_r($thetime);
			}

  				$logged = false;
  					 if($_COOKIE['username'] && $_COOKIE['password']){
     			 			 $username = strip_tags($_COOKIE['username']);
        		 				 $password = strip_tags($_COOKIE['password']);
        							$usrquery = $mysqli->query("SELECT * FROM `accounts` WHERE `password`='$password'");
        							$usr = $usrquery->fetch_array();
        								if($usr != 0){
             								 $logged = true;
             									}
    									}
    										$uID = $usr['id'];
    										$timey = time();
    										$timer = $timey -  $usr['status'];
    										$mysqli->query("UPDATE `accounts` SET `status`='$timey' WHERE `id`='$uID'");
    										if($timer < 20) {
    											$mysqli->query("UPDATE `accounts` SET `isstatus`='true' WHERE `id`='$uID'");
    										}
    										else{	
    											$mysqli->query("UPDATE `accounts` SET `isstatus`='false' WHERE `id`='$uID'");
    										}
    											
    											
    											
    	$numpmcheck = $mysqli->query("SELECT * FROM `messages` WHERE `recieverID`='$uID' AND `read`='0'");
	$numpm = $numpmcheck->num_rows;
    										
    										
    											
    											

							

?>
<html>
	<head>
		<title>Lorias</title>
		<link href="/img/favicon.ico" rel="icon" type="image/x-icon" />
		<!-- <script src="/snowstorm.js"></script> -->

		<link rel="stylesheet" type="text/css" href="/major.css">
		<link rel="stylesheet" type="text/css" href="/major2.css">

	</head>
	<?php
    						if($usr['banned'] == "1"){
    							header('Location: /banned.php');
    						}

    	?>
	<?php if($logged) { ?>
		<div class="account-bar">
			
			<span style="position:absolute;left:15%;">
				<b>Hello,</b> <?php echo $usr['username']; ?>!
				<a href="/Settings/">Settings</a>
				<a href="/User/">My Profile</a>
				<a href="/Account/FR/">Friend Requests</a>
				<a href="/Inbox/">Inbox (<?php echo $numpm; ?>)</a>
				<b>Lors:</b> <font color="green"><?php echo $usr['Lors']; ?></font>
				<a href="/logout.php">Logout</a>
			</span>
			<? } ?>
		</div>
			<div class="nav">
				<span style="position:absolute;left:7%;font-size:30px;">Lorias</span>
					<?php if($logged) { ?>
					<span style="margin-left:300px;">
						<a href="https://yoursite.com">Home</a>
						<a href="/Forum/">Forum</a>
						<a href="/Browse/">Browse</a>
						<a href="/Catalog/">Catalog</a>
						<a href="/Blog/">Blog</a>
						
							<?php if($usr['Admin'] == "true" || $usr['forumMod'] == "1" || $usr['imageMod'] == "1" || $usr['globalMod'] == "1" ) { ?>
								<a href="/Admin/" style="font-weight: bold;">Admin</a>
							<? } ?>
					<? } ?>
			</div>	
			
			<?php if($shoutmsg == ''){
			?>
			<br><br>
			<?php
			}else{
			?>
				<div class="shout">
				<?php echo $shoutmsg . " - " . $shouter['username']; ?>
				</div>
			<?php } ?>
		
</html>
