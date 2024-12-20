<?php
	$conn=mysqli_connect("localhost","root","","manu");
	if($conn){
		$response = array();
		$sql="SELECT * FROM hospital";
		$res=mysqli_query($conn,$sql);
		if($res){
			$i=0;
			while($row=mysqli_fetch_assoc($res)){
				$response[$i]['hname']=$row['Hname'];
				$response[$i]['hphono']=$row['Hph_no'];
				$response[$i]['haddress']=$row['Haddress'];
				$i++;
			}echo json_encode($response,JSON_PRETTY_PRINT);
		}else{
			echo "database connection failed";
		}
	}
?>