<?php
    include 'connection.php';      
    session_start();    
    $user_check = $_SESSION['login_user'];
    $sql = "SELECT username from roles where username = '$user_check' ";
    $stmt = $conn->query($sql);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $login_session = $row['username'];
    if(!isset($_SESSION['login_user'])){
        header("location:login.php");
    }
?>