<?php
include_once 'config.php';
$con=new clscon();
function GetData()
{
    if(isset($_REQUEST["bid"]))
    {
        $bid=$_REQUEST["bid"];
        $qry="select * from tbbook where bookid='$bid'";
        $res= mysql_query($qry);
        $output[]="<table border=5>";
        if($r=  mysql_fetch_array($res))
        {
            $output[]="<tr>";
            $output[]="<td>";
            $output[]="<img src=$r[5] height=50 width=50/>";
            $output[]="</td>";
            $output[]="<td>";
            $output[]="Title :$r[1]<br>";
            $output[]="Author :$r[2]<br>";
            $output[]="Pub :$r[3]<br>";
            $output[]="Price :$r[4]<br>";
            $output[]="<a href=cart.php?bid=$r[0]&action=add><img src=add.jpg height=80 width=80/></a><br>";
            $output[]="</td>";
            $output[]="</tr>";
        }
        $output[]="</table>";
        echo join('',$output);
    }
}
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <form action="detail.php" method="POST">
            <?php
          GetData();
            ?>
        </form>
    </body>
</html>
