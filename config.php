<?php
define("SERVER","localhost");
define("UNAME","root");
define("PWD","");
define("PORT","8081");
define("DNAME","dbemployee1030");

class clscon 
{
function __construct()
{
mysql_connect(SERVER,UNAME,PWD,PORT)or die('unable to connect to server'.mysql_error());
mysql_select_db(DNAME)or die('unable to connect to database'.mysql_error());
 }
 function Show_Data()
 {
     if(isset($_SESSION["Cart"]))
     {
         if($_SESSION["Cart"]!="")
         {
             $items=explode(',',$_SESSION["Cart"]);
             $contents=array();
             foreach($items as $item)
             {
                 $contents[$item]= isset($contents[$item])?$contents[$item]+1:1;
               // print_r($contents);
         }
         $output[]="<form action=Cart.php?action=update method=POST>";
         $output[]="<table border=5>";
         $output[]="<tr><th></th><th>Books details</th><th>Price</th><th>Qty</th><th>Amount</th></tr>";
         $total=0;
         foreach ($contents as $id=>$qty)
             {
             $qry="select * from tbbook where id='$id'";
             $res=  mysql_query($qry)or die (mysql_error());
             if($r= mysql_fetch_array($res))
             {
                 $output[]="<tr>";
                 $output[]="<td>";
                 $output[]="<a href=Cart.php?bid=$r[0]&action=delete>Delete</a>";
                 $output[]="</td>";
                 $output[]="<td>";
                 $output[]="$r[1] by $r[2]";
                 $output[]="</td>";
                 $output[]="<td>";
                 $output[]="$r[4]";
                 $output[]="</td>";
                 $output[]="<td>";
                 $output[]="<input type=text name=qty$id value=$qty />";
                 $output[]="</td>";
                 $amt=$r[4]*$qty;
                 $total+=$amt;
                 $output[]="<td>";
                 $output[]=$amt;
                 $output[]="</td>";
                 $output[]="</tr>";
   }
   }
    $output[]="</table><br>";
    $output[]="Total :$total <br>";
    $output[]="<input type=submit name=b1 value=update /><br>";
    $_SESSION["totamt"]=$total;
    $output[]="<a href=pay.php>Pay Now</a><br>";
    $output[]="</form>";
    echo join($output);
     }
 }
}
function Save_Data()
{
    if(isset($_SESSION["Cart"]))
    {
        $items=  explode(',', $_SESSION["Cart"]);
        $contents=array();
        foreach ($items as $item)
        {
            $contents[$item]=  isset($contents[$item])?$contents[$item]+1:1;
        }
        $d=date('y/m/d');
        $qry="insert tbord values(null,'$d')";
        $res=  mysql_query($qry);
        $ordcod=  mysql_insert_id();
        foreach($contents as $id=>$qty)
        {
            $qry="insert tborddet values('$ordcod','$id','$qty')";
            $res=  mysql_query($qry);
        }
        session_unset();
    }
}
}
?>
