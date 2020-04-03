<div class="list_sujet">
    <h3>Gallerie photo</h3>
    <div class="gallerie">        
        <?php 
            foreach ($_SESSION["photo"] as $key => $value) {
                echo "<div class='photo_gal'><img src='".$value["photo"]."' alt=''></div>";
            }
        ?>
    </div>
</div>