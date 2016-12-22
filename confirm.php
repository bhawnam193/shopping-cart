<?php
session_start();
include_once 'config.php';
$con=new clscon();
$con->Save_Data();
echo'data saved';
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        ?>
    </body>
</html>
