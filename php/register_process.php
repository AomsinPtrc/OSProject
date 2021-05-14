<?php 
    require_once('connect.php');
    require_once('../includes/function.php');
    if(isset($_POST['submit'])){
        $mem_fname = $_POST['mem_fname'];
        $mem_lname = $_POST['mem_lname'];
        $mem_email = $_POST['mem_email'];
        $mem_tel = $_POST['mem_tel'];
        $mem_username = $_POST['mem_username'];
        $mem_password = $_POST['mem_password'];

        $mem_address = $_POST['mem_address'];
        $mem_create_at = date('Y-m-d');
        if(isset($_POST['submit'])){ 
                // local->6LfCw8oaAAAAAMRxC6JgF7_5pc79SqSSBReuZEXf
                // domain->6LfCw8oaAAAAAOOZe0NtFiRbb5dIKvi2kJyR2P5X
                $secretKey = "6LfCw8oaAAAAAOOZe0NtFiRbb5dIKvi2kJyR2P5X";
                $responseKey = $_POST['g-recaptcha-response'];
                $remoteIP = $_SERVER['REMOTE_ADDR'];
                $url = "https://www.google.com/recaptcha/api/siteverify?secret=$secretKey&response=$responseKey&remoteip=$remoteIP";
                $response = json_decode(file_get_contents($url));

                if($mem_password == $_POST['mem_password']) {
                    $check_sql="SELECT * FROM members WHERE mem_username= '".$mem_username."' ";
                    $check_username= $conn->query($check_sql) or die($conn->error);
                
                    if(!$check_username->num_rows){
                        $hash_password= password_hash($mem_password, PASSWORD_DEFAULT);
                        $sql="INSERT INTO `members` VALUES (null,'$mem_fname','$mem_lname','$mem_email','$mem_tel','$mem_address','$mem_username','$hash_password','$mem_create_at','user')";
                        $res=mysqli_query($conn,$sql);
                            echo "<script> alert('Register Sucess');</script>";
                            redirect('index');
                    }else{
                            echo "<script> alert('ชื่อผู้ใช้นี้ ถูกใช้ไปแล้ว! โปรดกรอกข้อมูลใหม่อีกครั้ง');</script>";
                            redirect('index');
                    }

                }else{
                    echo "<script> alert('Verification Failed');</script>";
                    redirect('index');
                }
            } else{
                redirect('index');
        }

    }else{
        redirect('index');
    }
   
?>