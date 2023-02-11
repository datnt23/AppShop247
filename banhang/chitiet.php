<?php
    include "connect.php";
    $page =  $_POST['page'];
    $total = 5; // cần lấy 5 sản phẩm trên 1 trang.
    $pos = ($page-1)*$total; //0,5 5,5
    $loai = $_POST['loai'];

    //Lấy 5 sản phẩm cuối loại 3
    // $query = "SELECT * FROM `sanphammoi` WHERE `loai` = 3 LIMIT 5,5";
    //Lấy 5 sản phẩm đầu tiên loại 3
    $query = 'SELECT * FROM `sanphammoi` WHERE `loai` = '.$loai.' LIMIT '.$pos.','.$total.'';
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