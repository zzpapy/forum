<div class="list_sujet">
    <?php 
    // var_dump($_SESSION);
    if(isset($_SESSION["user"])){ 
        echo '<div class="crea_mess">
        <p>Une question, un problème ou juste envie de discuter créez un sujet ici</p>
        <form action="index.php?action=crea_sujet" method="POST">
        
        <input type="hidden" name="membre_id" value='.$_SESSION["user"]->getId().'>
        <input class="input" type="text" name="titre">
        <input type="submit" name="crea_sujet">
        </form>
        </div>';
    } 
    ?>
    <?php 
    if(!is_object($_SESSION["data"]["liste"])){
        $nb_sujet = count($_SESSION["data"]["liste"]);
    }
    else{
        $nb_sujet = 0;
    }
    // var_dump($nb_sujet);die;
    
    
    ?>
    <p>Sujet en cours actuellement : <?php echo $nb_sujet ?></p>
    <ul class="list">
        <?php 
            if(isset($_SESSION["user"])){
                $user = $_SESSION["user"];
                $membre_id = $user->getId();
            }
            else{
                $membre_id =0;
            }
            if(isset($_SESSION["data"]["liste"]) && !is_object($_SESSION["data"]["liste"]) ){
                $i = 0;
                // var_dump($_SESSION["data"]["mess"]);
                foreach ($_SESSION["data"]["liste"] as $key => $value) {
                    $date = new \DateTime($value->getDate());
                    $sujet_id = $value->getId();
                    $date = $date->format('d/m/Y H:i');
                    $by = $value->getMembre()->getPseudo();
                    $titre = $value->getTitre();
                    $author = $value->getMembre()->getId();
                    if(isset($_SESSION["views"][$sujet_id])){
                        $views = $_SESSION["views"][$sujet_id];
                    }
                    else{
                        $views = 0;
                    }
                    if(array_key_exists($value->getId(),$_SESSION["data"]["mess"])){
                        $nb_post = $_SESSION["data"]["mess"][$value->getId()];
                    }
                    else{
                        $nb_post = 0;
                    }
                    include('liste_sujet.php');
                }
            }
            else if(is_object($_SESSION["data"]["liste"])){
                $nb_sujet = 1;
                $sujet_id = $_SESSION["data"]["liste"]->getId();
                $date = new \DateTime($_SESSION["data"]["liste"]->getDate());
                $sujet_id = $_SESSION["data"]["liste"]->getId();
                $membre_id = $user->getId();
                $date = $date->format('d/m/Y H:i');
                $by = $_SESSION["data"]["liste"]->getMembre()->getPseudo();
                $titre = $_SESSION["data"]["liste"]->getTitre();
                $message_id = $_SESSION["data"]["liste"]->getId();
                $author = $_SESSION["data"]["liste"]->getMembre()->getId();
                if(array_key_exists($_SESSION["data"]["liste"]->getId(),$_SESSION["data"]["mess"])){
                    $nb_post = $_SESSION["data"]["mess"][$_SESSION["data"]["liste"]->getId()];
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