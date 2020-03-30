
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
        //  var_dump($result["data"]["liste"]);die;
            $user = unserialize($_SESSION["user"]);
            if(isset($result["data"]["liste"]) && !is_object($result["data"]["liste"]) ){
                // var_dump($result["data"]["mess"]);
                $i = 0;
                foreach ($result["data"]["liste"] as $key => $value) {
                    // var_dump($value);die;
                    $date = new \DateTime($value->getDate());
                    $sujet_id = $value->getId();
                    $membre_id = $user->getId();
                    $date = $date->format('d/m/Y H:i');
                    $by = $value->getMembre()->getPseudo();
                    $titre = $value->getTitre();
                    $author = $value->getMembre()->getId();
                    // echo "<a href='index.php?action=crea_mess&sujet_id=".$value->getId()."&membre_id=".$user->getId()."'>";
                    //    var_dump(count($result["data"]["mess"]));die;
                    if(array_key_exists($value->getId(),$result["data"]["mess"])){
                        // var_dump($result["data"]["mess"][$value->getId()]);
                        $nb_post = $result["data"]["mess"][$value->getId()];
                    }
                    else{
                        $nb_post = 0;
                    }
                    // echo "<li class='message sub'><div>Le : ".$date."</div><div>Nb post : ".$nb_post."</div><div>By : ".$value->getMembre()->getPseudo()."</div><div><span>Titre :".$value->getTitre()."</div>";
                    // if($user->getId() == $value->getMembre()->getId() || isset($_SESSION["admin"])){
                    //     var_dump(($_SESSION["admin"]));
                    //     echo "<div><form action='index.php?action=deleteSujet&message_id=".$value->getId()."' method='POST'>";
                    //     echo ' <input type="hidden" name="membre_id" value="'.$id.'">
                    //     <input type="hidden" name="sujet_id" value="'.$value->getId().'">';
                    //     echo "<button><span class='delete fas fa-times-circle'></button>";
                    //     echo "</form></div>";
                    //     // var_dump($user,$value);
                    // }
                    // echo "</li></a>";
                    include('liste_sujet.php');
                }
            }
            else if(is_object($result["data"]["liste"])){
                var_dump($result["data"]["liste"]);
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
                    // var_dump($result["data"]["mess"][$value->getId()]);
                    $nb_post = $result["data"]["mess"][$result["data"]["liste"]->getId()];
                }
                else{
                    $nb_post = 0;
                }
                // echo "<a href='index.php?action=crea_mess&sujet_id=".$result["data"]["liste"]->getId()."&membre_id=".$user->getId()."'><li class='message'>".$result["data"]["liste"]->getTitre()."</li></a>";
                // var_dump($result["data"]["liste"]);die;
                // echo "<a href='index.php?action=crea_mess&sujet_id=".$result["data"]["liste"]->getId()."&membre_id=".$user->getId()."'>";
                // echo "<li class='message sub'><span>By : ".$result["data"]["liste"]->getMembre()->getPseudo()."</span>  ".$result["data"]["liste"]->getTitre();
                // if($user->getId() == $result["data"]["liste"]->getMembre()->getId() || isset($_SESSION["admin"])){
                //     echo "<div><form action='index.php?action=deleteSujet&message_id=".$result["data"]["liste"]->getId()."' method='POST'>";
                //     echo ' <input type="hidden" name="membre_id" value="'.$id.'">
                //     <input type="hidden" name="sujet_id" value="'.$result["data"]["liste"]->getId().'">'; 
                //     echo "<button><span class='delete fas fa-times-circle'></span></button>";
                //     echo "</form></div>";
                //     // var_dump($user,$value);
                // }
                include('liste_sujet.php');
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