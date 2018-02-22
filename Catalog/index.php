<?php include "../global.php";
$_GET['tab']; 
$_GET['type'];

if(!$_GET){
	header('Location: /Catalog/?tab=hats');
}
?>
<?php if($logged) { ?>
	<div class="lander">
		<h1>Catalog</h1>
			View and purchase official items here.
				<table>
					<tr>
						<td style="vertical-align:text-top;padding:14px;">
							<div class="verticaloptionpanel">
							<span class="verticaltitle">Catalog Menu</span>
								<a class="verticaloption" href="?tab=hats">Hats</a>
								<a class="verticaloption" href="?tab=shirts">Shirts</a>
								<a class="verticaloption" href="?tab=t-shirts">T-Shirts</a>
								<a class="verticaloption" href="?tab=shorts">Shorts</a>
								<a class="verticaloption" href="?tab=pants">Pants</a>
								<a class="verticaloption" href="?tab=accessories">Accessories</a>
							<span class="verticalbreak"></span>
							<span class="verticalsmalltitle">Types</span>
								<a class="verticaloption" href="?type=limited">Limiteds</a>
								<a class="verticaloption last" href="?type=featured">Featured</a>
							</div>
						</td>
							<td style="vertical-align: text-top;">
								<?php if($_GET['tab'] == 'hats') { ?>
									<h3>Hats</h3>
								<? } ?>
								
								<?php if($_GET['tab'] == 'shirts') { ?>
									<h3>Shirts</h3>
								<? } ?>
								
								<?php if($_GET['tab'] == 't-shirts') { ?>
									<h3>T-Shirts</h3>
								<? } ?>
								
								<?php if($_GET['tab'] == 'shorts') { ?>
									<h3>Shorts</h3>
								<? } ?>
								
								<?php if($_GET['tab'] == 'pants') { ?>
									<h3>Pants</h3>
								<? } ?>
								
								<?php if($_GET['tab'] == 'accessories') { ?>
									<h3>Accessories</h3>
								<? } ?>
								
								<?php if($_GET['type'] == 'limited') { ?>
									<h3>Limited</h3>
								<? } ?>
								
								<?php if($_GET['type'] == 'featured') { ?>
									<h3>Featured</h3>
								<? } ?>

							</td>
					</tr>
				</table>
			
	</div>
<? } ?>
</html>
	<?php include "../footer.php"; ?>