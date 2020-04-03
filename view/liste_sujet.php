
<a href='index.php?action=crea_mess&sujet_id=<?php echo $sujet_id ?>&membre_id=<?php echo $membre_id ?>'>
<li class='message sub'>
    <div class="views">
        <div class="head_mess">
            <span>post : </span>
            <?php echo $nb_post ?>
        </div>
        <div class="info">
            <div  class="post">
                <?php echo "nbr vues : ".$views ?>
            </div>
            <div  class="post">
                <?php echo "par : ".$by ?>
            </div>
            <div  class="post">
                <?php echo $date ?>
            </div>
        </div>
        <?php
        if(isset($_SESSION["user"])){
            if($user->getId() == $author || isset($_SESSION["admin"])){
            echo "<div><form action='index.php?action=deleteSujet&message_id=".$sujet_id."' method='POST'>";
            echo ' <input type="hidden" name="membre_id" value="'.$id.'">
            <input type="hidden" name="sujet_id" value="'.$sujet_id.'">';
            echo "<button><span class=' fa-2x fas fa-times-circle'></button>";
            echo "</form></div>";
        }

        };
        ?>
    </div>
    <div class="sujet_style">
        <div class="post_titre">
            <!-- <div class="photo"> -->
                <?php
                if($photo == ""){
                    $photo ="public/images/no.jpg";
                }
                else{
                    $photo = $photo;
                }
                ?>
                <img class="photo"src="<?php echo $photo?>" alt="">
            <!-- </div> -->
            <span><?php echo $titre ?></span>
        </div>
    </div>
</li></a>