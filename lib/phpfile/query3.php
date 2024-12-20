<?php
	$conn= mysqli_connect("localhost","root","","manu");
	if($conn){
		if(isset($_POST['name'])) $nam = $_POST['name'];
		else return;
		$sql="Select cost from blood where bid in (Select DiD from donor where Name = '$nam')";
		$res = mysqli_query($conn,$sql);
		if($res){
			$i=0;
			while($row=mysqli_fetch_assoc($res)){
				$response=$row['cost'];
			}echo json_encode($response , JSON_PRETTY_PRINT);
		}
		else echo "unsuccess";
			
	}
?>