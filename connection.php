<?php 

$driver = 'mysql';
$database = "dbname=epiz_21223681_vc35photography";
$dsn = "$driver:host=localhost;$database";
$username = 'root';
$password = 'root';
try {
$conn = new PDO($dsn, $username, $password);
}catch(PDOException $e){
echo $e->getMessage();
}

?>