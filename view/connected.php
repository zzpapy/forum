<div class="home">
    <?php
        echo "<div class='users'><h4>membres: ".count($_SESSION["users"])."</h4>";
        foreach ($_SESSION["users"] as $key => $value) {
            $user = $value->getPseudo();
            if(isset($_SESSION["admin"]) && $value->getPseudo() != "zzpapy"){
                echo "<form class='deleteUser' action='index.php?action=deleteUser' method='POST'>";
                echo ' <input type="hidden" name="membre_id" value='.$value->getId().'>';
                echo "<span>".$user."</span>";
                echo "<button><span class='delete fas fa-times-circle'></span></button>";
                echo "</form>";
            }
            else{
                echo "<div>".$user."</div>";
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