
<a href='index.php?action=crea_mess&sujet_id=<?php echo $sujet_id ?>&membre_id=<?php echo $membre_id ?>'>
<li class='message sub'>
    <div>
        <?php echo $nb_post ?>
    </div>
    <div class="sujet_style">
        <div>
            <span><?php echo $titre ?>
        </div>
        <div class="author" >
            <div>
                <?php echo $date ?>
            </div>
            <div>
                <?php echo $sujet_id ?>
            </div>
            <div>
                <?php 
                echo "nbr vues : ".$views ?>
            </div>
            <div>
                <?php echo $by ?>
            </div>
        </div>
    </div>
<?php
if(isset($_SESSION["user"])){
    if($user->getId() == $author || isset($_SESSION["admin"])){
       echo "<div><form action='index.php?action=deleteSujet&message_id=".$sujet_id."' method='POST'>";
       echo ' <input type="hidden" name="membre_id" value="'.$id.'">
       <input type="hidden" name="sujet_id" value="'.$sujet_id.'">';
       echo "<button><span class='delete fas fa-times-circle'></button>";
       echo "</form></div>";
   }

};
?>
</li></a>