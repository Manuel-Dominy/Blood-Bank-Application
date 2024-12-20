<?php
	$conn=mysqli_connect("localhost","root","","manu");
	if($conn){
		if(isset($_POST['hosname']))$hospital = $_POST['hosname'];
		else return;
		if(isset($_POST['bloodtype']))$blood = $_POST['bloodtype'];
		else return;
		$response = array();
		$sql="SELECT * FROM donor WHERE DiD in(SELECT bid from blood WHERE bno in (SELECT b_no FROM bloodbank WHERE bloodtype = '$blood' AND hname = '$hospital'))";
		$res = mysqli_query($conn,$sql);
		if($res){
			$i=0;
			while($row=mysqli_fetch_assoc($res)){
				$response[$i]['name']=$row['Name'];
				$response[$i]['address']=$row['address'];
				$response[$i]['phno']=$row['phno'];
				$response[$i]['sex']=$row['sex'];
				$response[$i]['age']=$row['age'];
				$i++;
			}echo json_encode($response,JSON_PRETTY_PRINT);
		}else{
			echo "Unsuccessfull";
		}
	}
?>