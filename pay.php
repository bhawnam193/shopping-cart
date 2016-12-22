<?php
//header("location:confirm.php");
session_start();
include_once 'config.php';
$amt=$_SESSION["totamt"];
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body onload="document.getElementById('btntest').click();">
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="POST">
      <input type="hidden" name="cmd" value="_xclick"/>
      <input type="hidden" name="business" value="khasij_1295851963_biz@cskknowledgehub.com"/>
      <input type="hidden" name="item_name" value='book purchase payment'/>
      <input type="hidden" name="amount" value="<?php echo $amt;?>"/>
      <input type="hidden" name="return" value="confirm.php"/>
      <input type="hidden" name="cancel_return" value="cancel_confirm.php"/>
      <input type="hidden" name="rm" value="2"/>
      <input type="submit" style="display:none;" id="btntest" value="buy with additional parameters!"/>
      please wait.......
       </form>
      </body>
</html>
