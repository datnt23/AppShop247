<?php  
include "connect.php";
$target_dir = "images/";  
//name
$query = "select max(id) as id from sanphammoi";
$data = mysqli_query($conn, $query);
$result = array();
    while($row = mysqli_fetch_assoc($data)){
        $result[] = ($row);
        //code...
    }
    if($result[0]['id'] == null){
        $name = 1;
    }else{
        $name = ++$result[0]['id'];
    }
    $name = $name. ".jpg";  
    $target_file_name = $target_dir .$name;  

if (isset($_FILES["file"]))  
   {  
   if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file_name))  
      {  
        $arr = [
            'success' => true,
            'message' => "Thành Công",
            "name" => $name
        ];  
      }  
   else  
      {  
        $arr = [
            'success' => false,
            'message' => "Không thành Công"
        ];   
      }  
   }  
else  
   {  
    $arr = [
        'success' => false,
        'message' => "Lỗi"
    ];  
   }  
   echo json_encode($arr);  
?>