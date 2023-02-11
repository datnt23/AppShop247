<?php
    include "connect.php";
    $email =  $_POST['email'];
    $pass =  $_POST['pass'];

    //Lấy 5 sản phẩm cuối loại 3
    // $query = "SELECT * FROM `sanphammoi` WHERE `loai` = 3 LIMIT 5,5";
    //Lấy 5 sản phẩm đầu tiên loại 3
    $query = 'SELECT * FROM `user` WHERE `email`= "'.$email.'" AND `pass`="'.$pass.'"';
    $data = mysqli_query($conn, $query);
    $result = array();
    while($row = mysqli_fetch_assoc($data)){
        $result[] = ($row);
        //code...
    }

    if(!empty($result)){
        $arr = [
            'success' => true,
            'message' => "Thanh Cong",
            'result' => $result
        ];  
    }else{
        
        $arr = [
            'success' => false,
            'message' => "Khong Thanh Cong",
            'result' => $result
        ];  
    }

    print_r(json_encode($arr));
 
?>