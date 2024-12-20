<?php
	$conn=mysqli_connect("localhost","root","","manu");
	if($conn){
		if(isset($_POST['name'])) $nam = $_POST['name'];
		else return;
		if(isset($_POST['address'])) $addres = $_POST['address'];
		else return;
		if(isset($_POST['phono'])) $phon = $_POST['phono'];
		else return;
		if(isset($_POST['sex'])) $se = $_POST['sex'];
		else return;
		if(isset($_POST['id'])) $id = $_POST['id'];
		else return;
		if(isset($_POST['age'])) $ag = $_POST['age'];
		else return;
		$sql="INSERT INTO donor (Name,address,phno,sex,DiD,age)Values('$nam','$addres','$phon','$se',$id,$ag)";
		$res=mysqli_query($conn,$sql);
		$arr=[];
		if($res){
			$arr["success"]="true";
		}
		else $arr["success"]="false";
		echo json_encode($arr,JSON_PRETTY_PRINT);
		
	}



?>