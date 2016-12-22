<?php
session_start();
include_once 'config.php';
$con=new clscon();
if(isset($_SESSION["Cart"]))
    
  $Cart=$_SESSION["Cart"];
if(isset($_REQUEST["bid"]))
$bid=$_REQUEST["bid"];

$action=$_REQUEST["action"];
switch ($action)
{
    case 'add':
        if(isset($Cart))
            $Cart.=",".$bid;
        else 
         $Cart=$bid;
        break;
        case 'update':
            foreach ($_POST as $key=>$value)
        {
            if (strstr($key,'qty'))
            {
                $bid=  str_replace('qty','',$key);
                for($i=1;$i<=$value;$i++)
                {
                    if(isset($newCart))
                    {
                        $newCart.=",".$bid;
                    }
                    else
                        $newCart=$bid;
                    }
            }
            }
            if(isset($newCart))
            {
             $Cart=$newCart;   
            }
                
            else
                $Cart="";
            break;
            case 'delete':
                if(isset($_SESSION["Cart"]))
                {
                    $items=  explode(',', $_SESSION["Cart"]);
                    $bid=$_REQUEST["bid"];
                    foreach ($items as $item) 
                        {
                        if($bid!=$item)
                        {
                            if(isset($newCart))
                                $newCart.=",".$item;
                            else 
                                $newCart=$item;
                        }
                    }
                }
              if(isset($newCart))
                  $Cart=$newCart;
              else
                  $Cart="";
              break;
}
$_SESSION["Cart"]=$Cart;
//echo $Cart;
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
       $con->Show_Data();
        ?>
    </body>
</html>
