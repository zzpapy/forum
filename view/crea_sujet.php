<?php 
session_start();
//  var_dump($result);
?>
<div class="list_sujet">
    <ul class="list">
        <?php 
            foreach ($result["data"] as $key => $value) {
                echo "<li><a href=''>".$value->getTitre()."</a>";
                // var_dump($value);
            }
        ?>
    </ul>
</div>
<div class="crea_sujet">
    <form action="" method="POST">
        <input type="hidden" name="user_id" value="<?= $_SESSION["user"]->getId()?>">
        <input type="text" name="titre">
        <input type="submit" name="crea_sujet">
    </form>
</div>