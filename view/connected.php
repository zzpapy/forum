<div class="home">
    <div class="sticky_home">
    <div class='users'><h4>membres:<?php echo count($_SESSION["users"]) ?></h4>
        <?php
            foreach ($_SESSION["users"] as $key => $value) {
                $user = $value->getPseudo();
                if(isset($_SESSION["admin"]) && $value->getPseudo() != "zzpapy"){
                    echo "<form class='deleteUser' action='index.php?action=deleteUser' method='POST'>";
                    echo ' <input type="hidden" name="membre_id" value='.$value->getId().'>';
                    echo "<span>".$user."</span>";
                    echo "<button><span class=' fa-2x fas fa-times-circle'></span></button>";
                    echo "</form>";
                }
                else{
                    echo "<div>".$user."(Admin)</div>";
                }

            }
            echo "</div>";
        ?>
        <div class="connect">
            <h2>Tag cloud:</h2>
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor, laboriosam!</p>
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor, laboriosam!</p>
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor, laboriosam!</p>
        </div>
    </div>
</div>