<?php include "../global.php";
$_GET['tab'];
if(!$_GET){
	header('Location: /Catalog/ViewItem.php?tab=main');
}
?>
<?php if($logged) { ?>
	<div class="lander">
		<h1>Catalog</h1>
				<table>
					<tr>
						<td style="vertical-align:text-top;padding:14px;">
							<div class="verticaloptionpanel">
							<span class="verticaltitle">Item Menu</span>
								<a class="verticaloption" href="?tab=purchase">Purchase</a>
								<a class="verticaloption" href="?tab=report">Report</a>
								<a class="verticaloption last" href="?tab=sellers">Private Sellers</a>
								<?php if($usr['Admin'] == "true"){ ?>
								<span class="verticalbreak"></span>
								<span class="verticalsmalltitle">Moderation Related</span>
								<a class="verticaloption">Delete</a>
								<a class="verticaloption">Edit</a>
								<a class="verticaloption last">Scrub Description</a>
								<? } ?>
						
							</div>
						</td>
							<td style="vertical-align: text-top;">
							<?php if($_GET['tab'] == 'main') { ?>
							<img src="http://placehold.it/110x150" style="float:right;">
								<span style="float:right:width:90%;margin-right:200px;">
									<h2>Sample Item</h2>
										This is a sample description.
								</span>
								<br /><br>
									<h3>Comments</h3>
										<form method="post" action="">
											<table border="0">
												<tr>
													<td><textarea class="input-texta" name="comment" rows="4" cols="40" placeholder="Type your comment here."></textarea></td>
												</tr>
											</table>
										</form>
									<? } ?>
									
									<?php if($_GET['tab'] == 'purchase') { ?>
										<h2>Purchase</h2>
											Are you sure you want to purchase <b>item name</b> for <b>item cost?</b>
									<? } ?>
									
									<?php if($_GET['tab'] == 'report') { ?>
										<h2>Report</h2>
											Report this item.
											<form method="post" action="">
												<table border="0">
													<tr>
														<td><textarea class="input-texta" name="comment" rows="4" cols="40" placeholder="Type your report here."></textarea></td>
													</tr>
													<tr>
														<td><input type="submit" class="btn" name="report" value="Report"></td>
													</tr>
												</table>
											</form>
									<? } ?>
									
									<?php if ($_GET['tab'] == 'sellers') { ?>
										<h2>Private Sellers</h2>
											View all private sellers.
									<? } ?>
							</td>
					</tr>
				</table>
			
	</div>
<? } ?>
</html>
	<?php include "../footer.php"; ?>