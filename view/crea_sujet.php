<?php 
// session_start();
 var_dump($result["data"]);
?>
<div class="list_sujet">
    <ul class="list">
        <?php 
        if(isset($data["liste"])){
            foreach ($result["data"]["liste"] as $key => $value) {
                // var_dump($_GET);die;
                echo "<li><a href='index.php?action=crea_mess&sujet_id=".$value->getId()."&membre_id=".$value->getMembre()->getId()."'>".$value->getTitre()."</a>";
            }
        }
        ?>
    </ul>
</div>
<div class="crea_sujet">
    <form action="" method="POST">
        <input type="hidden" name="membre_id" value="<?= $result["data"]["user"]->getId() ?>">
        <input type="hidden" name="sujet_id" value="<?= $value->getId() ?>">
        <input type="text" name="titre">
        <input type="submit" name="crea_sujet">
    </form>
</div>