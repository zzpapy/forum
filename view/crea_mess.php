<?php 
if(isset($_GET["sujet_id"])){
    $sujet_id = $_GET["sujet_id"];
}
else{
    $sujet_id = '';
}
?>
<div class="list_message">
    <div class="crea_mess">
        <h2>Participez à la discussion</h2>
        <form action="" method="POST">
            <input type="hidden" name="membre_id" value="<?= $_GET["membre_id"] ?>">
            <input type="hidden" name="sujet_id" value="<?= $sujet_id ?>">
            <input type="text" class="input" name="content">
            <!-- <textarea name="content" id="" cols="50" rows="10"></textarea> -->
            <input type="submit" name="crea_mess">
        </form>
    </div>
    <div>
        <?php 
        echo "<h1> Titre du sujet : ".$result["data"]["sujet"]."</h1>";
            $i = 1;
            // var_dump(count($result["data"]));
            // var_dump($result["data"][0]);
            if($result["data"][0] !=NULL){
                
                echo "<h3>liste des messages</h3>";
                foreach ($result["data"][0] as $key => $value) {
                    echo "<div class='message'>";
                    echo "<div class='head_mess'>";
                    echo "<p>Auteur :".$value->getMembre()->getPseudo()."</p>";
                    echo "<p>date :".$value->getDate()."</p></div>";
                    echo "<div> contenu:<br><p>".$value->getContent()."<p></div>";
                    echo "</div>";
                    $i++;
                }
            }
            else{
                echo "<h2> Syoez le premier à rédiger un message sur ce sujet</h2>";
            }
        ?>
    </div>
</div>
