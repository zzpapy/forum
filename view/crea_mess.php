<?php 
if(isset($_GET["sujet_id"])){
    $sujet_id = $_GET["sujet_id"];
    // var_dump($_SESSION);die;
    $id = unserialize($_SESSION["user"])->getId();
    if(isset($result["data"]["subMess"])){
        $subMess = $result["data"]["subMess"];
        
        // var_dump($subMess);die;
    }
    else{
        $subMess = false;
    }
    
}
else{
    $sujet_id = '';
}
?>
<div class="list_message">
    <div class="crea_mess">
        <h2>Participez à la discussion</h2>
        <form action="index.php?action=crea_mess&sujet_id=<?php echo $sujet_id ?>" method="POST">
            <input type="hidden" name="membre_id" value="<?= $id ?>">
            <input type="hidden" name="sujet_id" value="<?= $sujet_id ?>">
            <span class="open">😀</span><input type="text" class="input emo" name="content"><div class="list_emoji hide"></div>
            <!-- <textarea name="content" id="" cols="50" rows="10"></textarea> -->
            <input type="submit" name="crea_mess">
        </form>
    </div>
    <h1> Titre du sujet : <?php echo $result["data"]["sujet"] ?></h1>
    <h3>liste des messages</h3>
    <div class="block_mess">
        <?php 
        // echo "";
        $i = 1;
        // var_dump(count($result["data"]));
        if($result["data"]["mess"] !=NULL){
            
            // echo "";
            if(!is_object($result["data"]["mess"])){
                // var_dump(isset($_SESSION["admin"]));die;
                    foreach ($result["data"]["mess"] as $key => $value) {
                        // var_dump($result["data"]["mess"]);die;
                        $user = unserialize($_SESSION["user"]);
                        $id_mess = $value->getId();
                        $author = $result["data"]["mess"][0]->getMembre()->getId();
                        // var_dump($author);die;
                        // echo "<div class='message'>";
                        echo "<div class='bordure'>";
                            if($user->getId() == $author || isset($_SESSION["admin"])){
                                echo "<div><form action='index.php?action=delete&message_id=".$id_mess."' method='POST'>";
                                echo ' <input type="hidden" name="membre_id" value="'.$id.'">
                                <input type="hidden" name="message_id" value="'.$id_mess.'">';
                                echo "<button><span class='delete fas fa-times-circle'></span></button>";
                                echo "</form></div>";
                            }
                        echo "<div class='head_mess'>";
                        echo "<p>Auteur :".$value->getMembre()->getPseudo()."</p>";
                        echo "id message :".$id_mess."";
                        $date = new \DateTime($value->getDate());
                        $date = $date->format('d/m/Y H:i');
                        echo "<p>date :".$date."</p></div>";
                        echo "<div> message:<br><p class='content'>".$value->getContent()."<p></div>";
                        echo "<div class='subMess'>";
                        echo "<h3>commentaires</h3>";
                        echo "<div><span>ajouter un commentaire à cette publication</span>"; 
                        echo "<form action='index.php?action=subMess&sujet_id=".$sujet_id."' method='POST'>";
                        echo "<input class='input' type='text' name='content' value=''>";
                        // var_dump("toto ",$id_mess);
                        echo ' <input type="hidden" name="membre_id" value="'.$id.'">
                        <input type="hidden" name="message_id" value="'.$id_mess.'">';
                        echo "<input type='submit'></div>";
                        echo "</form>";
                        // echo "</div>";
                        if($subMess){
                            foreach ($subMess as $key => $value) {
                                if($value->getMessage()->getId() == $id_mess){
                                    
                                    // var_dump($value->getMembre());
                                    echo "<div class='message sub'>";
                                    echo "<div class='head_mess'>";
                                    // echo $value->getMessage()->getId() == $id_mess;
                                    echo "<p>Auteur :".$value->getMembre()->getPseudo()."</p>";
                                    $date = new \DateTime($value->getDate());
                                    $date = $date->format('d/m/Y H:i');
                                    echo "<p>date :".$date."</p></div>";
                                    echo "<div>contenu:<br><p class='content'>".$value->getContent()."</p></div>";
                                    // echo "<div>id submes : ".$value->getId()."</div>";
                                    echo "</div>";
                                }
                            }  
                            echo "</div>";                  
                        }
                        else{
                            echo " encore auncun commentaires !!!";
                        }
                        echo "</div>";
                        echo "</div>";
                        $i++;
                    }
                }
                else{
                    // var_dump(isset($_SESSION["admin"]));die;
                    $id_mess = $result["data"]["mess"]->getId();
                    $author = $result["data"]["mess"]->getMembre()->getId();
                    $user = unserialize($_SESSION["user"]);
                    // echo "<div class='message'>";
                    echo "<div class='bordure'>";
                    echo "<div class='head_mess'>";
                    echo "<p>Auteur :".$result["data"]["mess"]->getMembre()->getPseudo()."</p>";
                    // var_dump($author);die;
                    if($user->getId() == $author || isset($_SESSION["admin"])){
                        echo "<div><form action='index.php?action=delete&message_id=".$id_mess."' method='POST'>";
                        echo ' <input type="hidden" name="membre_id" value="'.$id.'">
                        <input type="hidden" name="message_id" value="'.$id_mess.'">';
                        echo "<button><span class='delete fas fa-times-circle'></button>";
                        echo "</form></div>";
                    }
                        echo "id message :".$id_mess."";
                        $date = new \DateTime($result["data"]["mess"]->getDate());
                        $date = $date->format('d/m/Y H:i');
                        echo "<p>date :".$date."</p></div>";
                        echo "<div> message:<br><p class='content'>".$result["data"]["mess"]->getContent()."<p></div>";
                        echo "<div class='subMess'>";
                        echo "<h3>commentaires</h3>";
                        echo "<div><span>ajouter un commentaire à cette publication</span>"; 
                        echo "<form action='index.php?action=subMess&sujet_id=".$sujet_id."' method='POST'>";
                        echo "<input class='input' type='text' name='content' value=''>";
                        // var_dump("toto ",$id_mess);
                        echo ' <input type="hidden" name="membre_id" value="'.$id.'">
                        <input type="hidden" name="message_id" value="'.$id_mess.'">';
                        echo "<input type='submit'></div>";
                        echo "</form>";
                        // echo "</div>";
                        // var_dump($subMess);
                        if($subMess){
                            foreach ($subMess as $key => $value) {
                                if($value->getMessage()->getId() == $id_mess){
                                    
                                    // var_dump($value->getMembre());
                                    echo "<div class='message sub'>";
                                    echo "<div class='head_mess'>";
                                    // echo $value->getMessage()->getId() == $id_mess;
                                    echo "<p>Auteur :".$value->getMembre()->getPseudo()."</p>";
                                    $date = new \DateTime($value->getDate());
                                    $date = $date->format('d/m/Y H:i');
                                    echo "<p>date :".$date."</p></div>";
                                    echo "<div>contenu:<br><p class='content'>".$value->getContent()."</p></div>";
                                    // echo "<div>id submes : ".$value->getId()."</div>";
                                    echo "</div>";
                                }
                            }  
                            echo "</div>";                  
                        }
                        else{
                            echo " encore auncun commentaires !!!";
                        }
                        echo "</div>";
                        // echo "</div>";
                }
            }
            else{
                echo "<h2> Syoez le premier à rédiger un message sur ce sujet</h2>";
            }
        ?>
    </div>
</div>
