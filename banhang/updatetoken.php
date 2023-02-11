<?php
    include "connect.php";

    $token = $_POST['token'];
    $id = $_POST['id'];

    
    //check data
    $query = 'UPDATE `user` SET `token`="'.$token.'" WHERE `id`= '.$id;
    $data = mysqli_query($conn, $query);
    if($data == true){
        $arr = [
            'success' => true,
            'message' => "Thành Công"
        ]; 
    }else{
        $arr = [
            'success' => false,
            'message' => "Không Thành Công"
        ];  
    }

    print_r(json_encode($arr));
?>