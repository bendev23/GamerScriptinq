<?php include "../global.php"; 
$userscheck = $mysqli->query("SELECT * FROM `accounts`");
	$users = $userscheck->num_rows;
	
$onlinecheck = $mysqli->query("SELECT * FROM `accounts` WHERE `isstatus` = 'true'");
	$online = $onlinecheck->num_rows;
	
$staffcheck = $mysqli->query("SELECT * FROM `accounts` WHERE `Admin` = 'true'");
	$staff = $staffcheck->num_rows;
		
	if($logged) { 
?>
		<div class='lander'>
			<h1>Browse</h1>
				Browse all current users. There are currently <b><?php echo $users; ?></b> users. | <a href='online.php'>Online Users (<?php echo $online; ?>)</a> | <a 	 href='offstaff.php'>All Staff Members (<?php echo $staff; ?>)</a> <br><br>
				
					<?php 
					$con=mysqli_connect("localhost","loriasne_user","chez1","loriasne_main");
						$result = mysqli_query($con,"SELECT * FROM accounts WHERE `banned`='0' ORDER BY id");
							while($row = mysqli_fetch_array($result)) {
					?>
					
						<a href='/User/?id=<?php echo $row["id"] ?>'><?php echo $row["username"]; ?></a>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
					<? } 
						} ?>
	
<style>
td {
border-width: 1px;
border-style: solid;
border-color: #000000;
background-color: #ffffff;
vertical-align: top;
text-align: center;
}
</style>
</div>

		<?php include "../footer.php"; ?>