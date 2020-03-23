<?php 
session_start();
//  var_dump($_SESSION);
?>
<div class="crea_sujet">
    <form action="" method="POST">
        <input type="hidden" name="id" value="<?= $_SESSION["user"]->getId()?>">
        <input type="text" name="titre_sujet">
        <input type="submit" name="crea_sujet">
    </form>
</div>