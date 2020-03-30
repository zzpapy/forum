
<a href='index.php?action=crea_mess&sujet_id=<?php echo $sujet_id ?>&membre_id=<?php echo $membre_id ?>'>
<li class='message sub'><div>Le : <?php echo $date ?></div><div>Nb post : <?php echo $nb_post ?></div><div>By : <?php echo $by ?></div><div><span>Titre : <?php echo $titre ?></div>
<?php
 if($user->getId() == $author || isset($_SESSION["admin"])){
    // var_dump(($value));
    echo "<div><form action='index.php?action=deleteSujet&message_id=".$sujet_id."' method='POST'>";
    echo ' <input type="hidden" name="membre_id" value="'.$id.'">
    <input type="hidden" name="sujet_id" value="'.$sujet_id.'">';
    echo "<button><span class='delete fas fa-times-circle'></button>";
    echo "</form></div>";
    // var_dump($user,$value);
}
?>
</li></a>