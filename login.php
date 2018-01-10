<?php
   include("connection.php");
   session_start();   
   $error = '';
   if($_SERVER["REQUEST_METHOD"] == "POST") {
        // username and password sent from form       
        $myusername = $_POST['username'];
        $mypassword = $_POST['password'];

        $sql = "SELECT * FROM roles WHERE username = '$myusername'";
        $stmt = $conn->query($sql);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        
        $salt = $row['salt'];

        // Hash salt and password together
        $md5 = md5($salt.$mypassword);
        $mypassword = sha1($md5);

        // If result matched $myusername and $mypassword
        if($mypassword == $row['password']) {
            $_SESSION['login_user'] = $myusername;
            header("location: index.php");
        } else {
            $error = "Your Login Name or Password is invalid";
        }
    }
?>
<html lang="en">
    <head>
        <?php include 'header.html'; ?>
    </head>
    <body> 
        <div class="container-fluid">
            <div class="row text-center">
                <img class="img-rounded big-img" alt="VC35Photography" src="favicon.png">
            </div>
            <div class="row text-center">
                <h3>VC35Photography Learnings</h3>
            </div>
            <div class="row text-center"><h2>Kindly Login</h2></div>
            <div class="row text-center margin-top10">
                <form action="" method="post">
                    <div class="row">
                        <p class="col-sm-3"></p>
                        <label class="col-sm-2 text-right" for="username">Username:</label>
                        <input class="col-sm-2" type="username" id="username" name="username">
                    </div>
                    <div class="row margin-top10">
                        <p class="col-sm-3"></p>
                        <label class="col-sm-2 text-right" for="password">Password:</label>
                        <input class="col-sm-2" type="password" id="password" name="password">
                    </div>
                    <div class='row text-center margin-top10'>
                        <div class="col-sm-push-4 col-sm-4 ">
                            <button type="submit" class="btn btn-primary btn-md">Submit</button> 
                        </div>
                    </div>                    
                </form>               
            </div>        
            <?php if($error) { ?>
                <div class="row alert alert-danger"><?php echo $error; ?></div>
            <?php } ?>
        </div>
        <?php include 'footer.html'; ?>
    </body>
</html>