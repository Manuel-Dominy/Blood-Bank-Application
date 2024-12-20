<?php
	$conn=mysqli_connect("localhost","root","","manu");
	if($conn){
		if(isset($_POST['cost'])) $cost = $_POST['cost'];
		else return;
		if(isset($_POST['code'])) $code = $_POST['code'];
		else return;
		if(isset($_POST['bid'])) $bid = $_POST['bid'];
		else return;
		if(isset($_POST['b_no'])) $b_no = $_POST['b_no'];
		else return;
		$sql="INSERT into blood (cost,cod,bid,bno) VALUES($cost,$code,$bid,$b_no);";
		$res=mysqli_query($conn,$sql);
		$arr=[];
		if($res){
			$arr["bool"]="true";
		}else $arr["bool"]="false";
		echo json_encode($arr,JSON_PRETTY_PRINT);
	}
?>