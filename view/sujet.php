<div class="list_sujet">
    <ul class="list">
        <?php 
            foreach ($result["data"]["liste"] as $key => $value) {
                echo "<li><a href=''>".$value->getTitre()."</a>";
                // var_dump($value);
            }
        ?>
    </ul>
</div>
<div class="home_page">
    <a href="index.php?action=crea_sujet">sujet</a>
    <a href="index.php?action=crea_mess">mess</a>
</div>