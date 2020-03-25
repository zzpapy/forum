<?php 
if(isset($_GET["sujet_id"])){
    $sujet_id = $_GET["sujet_id"];
}
else{
    $sujet_id = '';
}
?>
<div class="list_message">
    
    <?php 
    echo "<h1> Titre du sujet : ".$result["data"]["sujet"]."</h1>";
        $i = 1;
        // var_dump(count($result["data"]));
        // var_dump($result["data"][0]);
        if($result["data"][0] !=NULL){
            foreach ($result["data"][0] as $key => $value) {
                echo "<div>";
                echo "<div>message n°:".$i."</div>";
                echo "<p>Auteur :".$value->getMembre()->getPseudo()."</p>";
                echo "<div> contenu:".$value->getContent()."</div>";
                echo "</div>";
                $i++;
            }
        }
        else{
            echo "<h2> Syoez le premier à rédiger un message sur ce sujet</h2>";
        }
    ?>
</div>
<div class="crea_mess">
    <form action="" method="POST">
        <input type="hidden" name="membre_id" value="<?= $_GET["membre_id"] ?>">
        <input type="hidden" name="sujet_id" value="<?= $sujet_id ?>">
        <input type="text" name="content">
        <input type="submit" name="crea_mess">
    </form>
</div>