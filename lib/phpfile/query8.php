<?php
	$conn=mysqli_connect("localhost","root","","manu");
	if($conn){
		if(isset($_POST['hname'])) $hname=$_POST['hname'];
		else return ;
		if(isset($_POST['phno'])) $phno=$_POST['phno'];
		else return ;
		$sql="Select * from hospital Where Hname = '$hname' and Hph_no = $phno";
		$res=mysqli_query($conn,$sql);
		$count=mysqli_num_rows($res);
		if($count==1){
			$response = "true";
		}else{
			$response="false";
		}echo json_encode($response,JSON_PRETTY_PRINT);
		
	}

 
?>