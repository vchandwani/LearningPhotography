<?php
    include("connection.php");
    session_start();   
    $error = '';
    $successInfo = '';
    $hideLogin = false;
    $hideChangePassword = true;
    $hideNewUser = true;
    
    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
   if($_SERVER["REQUEST_METHOD"] == "POST") {
        
        $error = '';
        $successInfo = '';
        if(isset($_POST['displayLogin']) && $_POST['displayLogin'] == true){
            $hideLogin = false;
        } else {
            $hideLogin = true;
        }
        if(isset($_POST['displayChangePassword']) && $_POST['displayChangePassword'] == true){
            $hideChangePassword = false;
        } else {
            $hideChangePassword = true;
        }
        if(isset($_POST['displayNewUser']) && $_POST['displayNewUser'] == true){
            $hideNewUser = false;
        } else {
            $hideNewUser = true;
        }
        if(isset($_POST['changePassword']) && $_POST['changePassword'] == true){
            // Change Password

            // Check New and Confirm Password same
            if($_POST['newpassword'] != $_POST['confirmnewpassword']){
                $error = "New Password and Confirm Password should be same";
                $hideLogin = true;
                $hideChangePassword = false;
                $hideNewUser = true;
            } else {
                // CHeck old Password for username
                $myusername = $_POST['existingUsername'];
                $mypassword = $_POST['oldpassword'];

                $sql = "SELECT * FROM roles WHERE username = '$myusername' AND active = TRUE";
                $stmt = $conn->query($sql);
                $stmt->execute();
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                
                $salt = $row['salt'];

                // Hash salt and password together
                $md5 = md5($salt.$mypassword);
                $mypassword = sha1($md5);
                if($mypassword != $row['passWord1']) {
                    $error = "Username and Password provided are not correct";
                    $hideLogin = true;
                    $hideChangePassword = false;
                    $hideNewUser = true;
                } else {
                    // Update New password
                    $md5 = md5($salt.$_POST['newpassword']);
                    $newpassword = sha1($md5);

                    $sql = "UPDATE roles SET passWord1 = :newpassword
                    WHERE username = :username";
                    $stmt = $conn->prepare($sql);									 
                    $stmt->bindParam(':newpassword', $newpassword, PDO::PARAM_STR);
                    $stmt->bindParam(':username', $myusername, PDO::PARAM_STR);
                    $stmt->execute();
                    $successInfo = "Password Updated successfully.";
                    $hideLogin = false;
                    $hideChangePassword = true;
                    $hideNewUser = true;
                }
            }
        } if(isset($_POST['newUser']) && $_POST['newUser'] == true){
                // New User

                // CHeck with existing usernames
                $myusername = $_POST['newUsername'];
                $mypassword = $_POST['newUserPassword'];

                $sql = "SELECT id FROM roles WHERE username = '$myusername'";
                $stmt = $conn->query($sql);
                $stmt->execute();
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                if(!$row) {
                    // Create random Salt
                    $salt = generateRandomString();
                    // Hash salt and password together
                    $md5 = md5($salt.$mypassword);
                    $mypassword = sha1($md5);                   
                    
                    // Save new entry with active as false
                    $statement = $conn->prepare("INSERT INTO roles(username,passWord1,salt,active)  VALUES(:usernameVal,:passwodVal,:saltVal,:activeVal)");
                    $statement->execute(array(
                        "usernameVal" => $myusername,
                        "passwodVal" => $mypassword,
                        "saltVal" => $salt,
                        "activeVal" => 0
                    ));
                    $successInfo = "User Added successfully.";
                    $hideLogin = false;
                    $hideChangePassword = true;
                    $hideNewUser = true;
                } else {
                    $error = "Username already exist";
                    $hideLogin = true;
                    $hideChangePassword = true;
                    $hideNewUser = false;
                }            
        } else if(isset($_POST['username']) && isset($_POST['password'])){
            // username and password sent from form       
            $myusername = $_POST['username'];
            $mypassword = $_POST['password'];

            $sql = "SELECT * FROM roles WHERE username = '$myusername' AND active = TRUE";
            $stmt = $conn->query($sql);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $salt = $row['salt'];

            // Hash salt and password together
            $md5 = md5($salt.$mypassword);
            $mypassword = sha1($md5);

            // If result matched $myusername and $mypassword
            if($mypassword == $row['passWord1']) {
                $_SESSION['login_user'] = $myusername;
                if($myusername == 'admin'){
                    $_SESSION['admin'] = true;
                }                
                header("location: index.php");
            } else {
                $error = "Your Username or Password is invalid";
                $hideLogin = false;
                $hideChangePassword = true;
                $hideNewUser = true;
            }
        }  
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <?php include 'header.html'; ?>
    </head>
    <body> 
        
        <div class="container-fluid">
            <div class="row text-center">
                <img class="icon-rotate img-rounded big-img" alt="VC35Photography" src="favicon.png">
            </div>
            <div class="row text-center">
                <h3>VC35Photography Learnings</h3>
            </div>
            <div class="row text-center">
                <h6>
                    <span>
                        <a href="https://www.instagram.com/vc35photography/" target="blank"><i class="fa fa-instagram"></i></a>
                        <a href="https://www.facebook.com/vc35photography/" target="blank"><i class="fa fa-facebook"></i></a>
                    </span>
                </h6>
            </div>            
            <?php if(!empty($error)){  ?>
                <div class="row alert alert-danger text-center">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                    <?php echo $error; ?>
                </div>
            <?php } ?>
            <?php if(!empty($successInfo)){ ?>
                <div class="alert alert-success text-center">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                    <strong><?php echo $successInfo ;?></strong>
                </div>
            <?php } ?>
                
            <div class="row text-center margin-top10 <?php if(isset($hideLogin) && $hideLogin){ echo "hidden"; }?>" id="loginDiv">
                <input type="hidden" value="true" id="displayLogin" name="displayLogin">        
                <div class="col-xs-12 text-center"><div class="row"><h2>Kindly Login</h2></div></div>
                <form action="" method="post">
                    <div class="col-xs-12">
                        <div class="row">
                            <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 col-xs-4 text-right" for="username">Username:</label>
                            <input class="col-sm-2 col-xs-7" type="username" id="username" name="username">
                            <p class="col-sm-5 hidden-xs"></p>
                        </div>
                    </div>
                    <div class="col-xs-12 margin-top10">
                        <div class="row">
                            <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 text-right col-xs-4" for="password">Password:</label>
                            <input class="col-sm-2 col-xs-7" type="password" id="password" name="password">
                            <p class="col-sm-3 hidden-xs"></p>
                        </div>
                    </div>
                    <div class='col-xs-12 text-center margin-top10'>
                        <div class="row">
                            <div class="col-sm-push-4 col-sm-4 col-xs-push-2 col-xs-8">
                                <button type="submit" class="btn btn-primary btn-md">Submit</button> 
                            </div>
                        </div>
                    </div>                    
                </form>               
            </div>        
            <div class="row margin-top10">
                <div class="col-sm-3 col-xs-1"></div>
                <div class="col-sm-3 col-xs-5">
                    <button type="button" class="btn btn-default btntransparent" id="changePasswordButton">Change Password</button>
                </div>
                <div class="col-sm-3 col-xs-5">
                    <button type="button" class="btn btn-default btntransparent" id="newUserButton">New User</button>
                </div>
                <div class="col-sm-3 col-xs-1"></div>
            </div> 
            
            <div id="changePasswordDiv" class="row <?php if(isset($hideChangePassword) && $hideChangePassword){ echo "hidden"; }?>">
                <input type="hidden" value="true" id="displayChangePassword" name="displayChangePassword">
                <div class="col-xs-12 text-center"><div class="row"><h2>Change Password</h2></div></div>
                <form action="" method="post">
                    <input type="hidden" name="changePassword" id="changePassword" value="true">                    
                    <div class="col-xs-12">
                        <div class="row">
                            <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 col-xs-5 text-right" for="username">Username:</label>
                            <input class="col-sm-2 col-xs-6" type="username" id="existingUsername" name="existingUsername" required>
                    </div>
                    </div>
                    <div class="col-xs-12 margin-top10">
                        <div class="row">
                            <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 col-xs-5 text-right" for="password">Old Password:</label>
                            <input class="col-sm-2 col-xs-6" type="password" id="oldpassword" name="oldpassword" required>
                        </div>
                    </div>
                    <div class="col-xs-12 margin-top10">
                        <div class="row">
                            <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 col-xs-5 text-right" for="password">New Password:</label>
                            <input class="col-sm-2 col-xs-6" type="password" id="newpassword" name="newpassword" required>
                        </div>
                    </div>
                    <div class="col-xs-12 margin-top10">
                        <div class="row">
                          <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 col-xs-5 text-right padding-left-0" for="password">Confirm Password:</label>
                            <input class="col-sm-2 col-xs-6" type="password" id="confirmnewpassword" name="confirmnewpassword" required>
                        </div>
                    </div>
                    <div class='col-xs-12 text-center margin-top10'>
                        <div class='row'>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-3 col-xs-6">
                                <button type="submit" class="btn btn-primary btn-md">Submit</button> 
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <button type="button" class="btn btn-default btn-md btntransparent" id="cancelChangePassword">Close</button> 
                            </div>
                        </div>                    
                    </div>                    
                </form>
            </div>   
            <div id="newUserDiv" class="row <?php if(isset($hideNewUser) && $hideNewUser){ echo "hidden"; }?>">
                <input type="hidden" value="true" id="displayNewUser" name="displayNewUser">
                <div class="col-xs-12 text-center"><div class="row"><h2>New User</h2></div></div>
                <form action="" method="post">
                    <input type="hidden" name="newUser" id="newUser" value="true">                    
                    <div class="col-xs-12">
                        <div class="row">
                            <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 col-xs-5 text-right" for="username">Username:</label>
                            <input class="col-sm-2 col-xs-6" type="username" id="newUsername" name="newUsername" required>
                        </div>
                    </div>
                    <div class="col-xs-12 margin-top10">
                        <div class="row">
                            <p class="col-sm-3 hidden-xs"></p>
                            <label class="col-sm-2 col-xs-5 text-right" for="password">Password:</label>
                            <input class="col-sm-2 col-xs-6" type="password" id="newUserPassword" name="newUserPassword" required>
                        </div>
                    </div>
                    <div class='col-xs-12 text-center margin-top10'>
                        <div class='row'>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-3 col-xs-6">
                                <button type="submit" class="btn btn-primary btn-md">Submit</button> 
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <button type="button" class="btn btn-default btn-md btntransparent" id="cancelNewUser">Close</button> 
                            </div>
                        </div>                    
                    </div>                    
                </form>
            </div>     
        </div>
        <?php include 'footer.html'; ?>
    </body>
</html>