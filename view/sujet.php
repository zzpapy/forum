<div class="list_sujet">
    <h2>Sujet en cours actuellement</h2>
    <ul class="list">
        <?php 
        // var_dump(unserialize($_SESSION["user"]));
            $user = unserialize($_SESSION["user"]);
            // var_dump($result);
            foreach ($result["data"]["liste"] as $key => $value) {
               echo "<li><a href='index.php?action=crea_mess&sujet_id=".$value->getId()."&membre_id=".$user->getId()."'>".$value->getTitre()."</a></li>";
            }
        ?>
    </ul>
</div>
<!-- <div class="home_page">
    <a href="index.php?action=crea_sujet">sujet</a>
    <a href="index.php?action=crea_mess">mess</a>
</div> -->