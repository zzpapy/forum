<div class='bordure'>
   
    <div class='head_mess'>
        <p>Auteur :<?php echo $pseudo?></p>
        <p>date :<?php echo $date?></p>
        <?php
    if($user->getId() == $author || isset($_SESSION["admin"])){
        echo "<div><form action='index.php?action=delete&message_id=".$id_mess."' method='POST'>";
        echo ' <input type="hidden" name="membre_id" value="'.$id.'">
        <input type="hidden" name="message_id" value="'.$id_mess.'">';
        echo "<button><span class='delete fas fa-times-circle'></span></button>";
        echo "</form></div>";
    }
    ?>
    </div>
    <div> 
        <p class='content'><?php echo $content?><p>

    </div>
    <div class='subMess'>
        <h3>commentaires</h3>
        <span>ajouter un commentaire à cette publication</span> 
        <form action='index.php?action=subMess&sujet_id=<?php echo $sujet_id?>' method='POST'>
            <input class='input' type='text' name='content' value=''>
            <input type="hidden" name="membre_id" value="<?php echo $id?>">
            <input type="hidden" name="message_id" value="<?php echo $id_mess?>">
            <input type='submit'>
        </form>
    </div>
    <div>
        <?php
        if($subMess){
            foreach ($result["data"]["subMess"] as $key => $value) {
            // var_dump($value->getMessage());
            if($value->getMessage()){
                if($value->getMessage()->getId() == $id_mess){

                // var_dump($value->getMembre());
                    echo "<div class='message sub'>";
                        echo "<div class='head_mess'>";
                        // echo $value->getMessage()->getId() == $id_mess;
                            echo "<div><p>Auteur :".$value->getMembre()->getPseudo()."</p></div>";
                            $date = new \DateTime($value->getDate());
                            $date = $date->format('d/m/Y H:i');
                            echo "<div class='content_sub'>contenu:<p class='content'>".$value->getContent()."</p></div>";
                            echo "<p>date :".$date."</p>";
                            // echo "<div>id submes : ".$value->getId()."</div>";
                        echo "</div></div>";
                    }              
                }
            }    
        }
        else{
            echo "<div>".$msg."</div></div>";
        }
        
        ?>
    </div>
</div>
           
                            