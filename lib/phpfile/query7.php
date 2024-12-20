<?php
	$conn=mysqli_connect("localhost","root","","manu");
	if($conn){
		if(isset($_POST['hname'])) $hname = $_POST['hname'];
		else return;
		if(isset($_POST['phone'])) $phone = $_POST['phone'];
		else return;
		if(isset($_POST['haddress'])) $haddress = $_POST['haddress'];
		else return;
		$sql="INSERT into hospital (Hname,Hph_no,Haddress) VALUES('$hname',$phone,'$haddress');";
		$res=mysqli_query($conn,$sql);
		$arr=[];
		if($res){
			$arr["hey"]="manu";
		}else $arr["bool"]="false";
		echo json_encode($arr,JSON_PRETTY_PRINT);
	}
?>