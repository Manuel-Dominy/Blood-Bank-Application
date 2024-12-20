<?php
	$conn = mysqli_connect("localhost","root","","manu");
	if($conn){
		if(isset($_POST['bloodtype'])) $type = $_POST['bloodtype'];
		else return;
		if(isset($_POST['amount'])) $amount = $_POST['amount'];
		else return;
		if(isset($_POST['hospital'])) $hospital = $_POST['hospital'];
		else return;
		if(isset($_POST['b_no'])) $bno = $_POST['b_no'];
		else return;
		$sql="INSERT INTO bloodbank(amount,b_no,hname,bloodtype) VALUES ($amount,$bno,'$hospital','$type');";
		$res = mysqli_query($conn,$sql);
		$arr = [];
		if($res){
			$arr["Success"]="Success";
		}else $arr["Success"]="Failure";
		echo json_encode($arr,JSON_PRETTY_PRINT);
	}

?>