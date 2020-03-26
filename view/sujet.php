<div class="crea_message">
    <h2>Une question, un problème ou juste envie de discuter créez un sujet ici</h2>
    <form action="index.php?action=crea_sujet" method="POST">
        <input type="hidden" name="membre_id" value="<?= unserialize($_SESSION["user"])->getId() ?>">
        <input class="input" type="text" name="titre">
        <input type="submit" name="crea_sujet">
    </form>
</div>
<div class="list_sujet">
    <h2>Sujet en cours actuellement</h2>
    <ul class="list">
        <?php 
        // var_dump(unserialize($_SESSION["user"]));
            $user = unserialize($_SESSION["user"]);
            // var_dump($result);
            if(isset($result["data"]["liste"] )){
                foreach ($result["data"]["liste"] as $key => $value) {
                   echo "<a href='index.php?action=crea_mess&sujet_id=".$value->getId()."&membre_id=".$user->getId()."'><li class='message'>".$value->getTitre()."</li></a>";
                }
            }
            else{
                echo "Soyez le premier à créer un sujet de conversation";
            }
        ?>
    </ul>
</div>
<!-- <div class="home_page">
    <a href="index.php?action=crea_sujet">sujet</a>
    <a href="index.php?action=crea_mess">mess</a>
</div> -->