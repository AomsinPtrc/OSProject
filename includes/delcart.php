<?php 
    require_once('../php/connect.php');
    $cart_id=$_GET['cart_id'];
    $sql="DELETE FROM `cart` WHERE cart_id = $cart_id";

    if (mysqli_query($conn, $sql)) {
        header('Refresh:0; url=../index.php');
        echo '<script> alert("ลบข้อมูลเสร็จสิ้น!")</script>'; 
    } else {
        header('Refresh:0; url=../index.php');
        echo "Error deleting record: " . mysqli_error($connect);
    }
    mysqli_close($conn);
?>