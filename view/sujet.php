
<div class="crea_mess">
    <h2>Une question, un problème ou juste envie de discuter créez un sujet ici</h2>
    <form action="index.php?action=crea_sujet" method="POST">

        <input type="hidden" name="membre_id" value="<?= unserialize($_SESSION["user"])->getId() ?>">
        <input class="input" type="text" name="titre">
        <input type="submit" name="crea_sujet">
    </form>
</div>
<div class="list_sujet">
    <?php 
    if(!is_object($result["data"]["liste"])){
        $nb_sujet = count($result["data"]["liste"]);
    }
    else{
        $nb_sujet = 0;
    }
    
    ?>
    <h2>Sujet en cours actuellement : <?php echo $nb_sujet ?></h2>
    <ul class="list">
        <?php 
            $user = unserialize($_SESSION["user"]);
            if(isset($result["data"]["liste"]) && !is_object($result["data"]["liste"]) ){
                $i = 0;
                foreach ($result["data"]["liste"] as $key => $value) {
                    $date = new \DateTime($value->getDate());
                    $sujet_id = $value->getId();
                    $membre_id = $user->getId();
                    $date = $date->format('d/m/Y H:i');
                    $by = $value->getMembre()->getPseudo();
                    $titre = $value->getTitre();
                    $author = $value->getMembre()->getId();
                    if(array_key_exists($value->getId(),$result["data"]["mess"])){
                        $nb_post = $result["data"]["mess"][$value->getId()];
                    }
                    else{
                        $nb_post = 0;
                    }
                    include('liste_sujet.php');
                }
            }
            else if(is_object($result["data"]["liste"])){
                $nb_sujet = 1;
                $sujet_id = $result["data"]["liste"]->getId();
                $date = new \DateTime($result["data"]["liste"]->getDate());
                $sujet_id = $result["data"]["liste"]->getId();
                $membre_id = $user->getId();
                $date = $date->format('d/m/Y H:i');
                $by = $result["data"]["liste"]->getMembre()->getPseudo();
                $titre = $result["data"]["liste"]->getTitre();
                $message_id = $result["data"]["liste"]->getId();
                $author = $result["data"]["liste"]->getMembre()->getId();
                if(array_key_exists($result["data"]["liste"]->getId(),$result["data"]["mess"])){
                    $nb_post = $result["data"]["mess"][$result["data"]["liste"]->getId()];
                }
                else{
                    $nb_post = 0;
                }
                include('liste_sujet.php');
            }
            else{
                echo "Soyez le premier à créer un sujet de conversation";
            }
        ?>
    </ul>
</div>