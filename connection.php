<?php 

$driver = 'mysql';
$database = "dbname=epiz_21223681_vc35photography";
$dsn = "$driver:host=sql100.epizy.com;$database";
$username = 'epiz_21223681';
$password = 'Varun123';
try {
$conn = new PDO($dsn, $username, $password);
}catch(PDOException $e){
echo $e->getMessage();
}

?>