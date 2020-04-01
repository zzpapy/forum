<div class="home">
    <?php
        echo "<div class='users'><h4>membres:</h4>";
        foreach ($_SESSION["users"] as $key => $value) {
            $user = $value->getPseudo();
            echo "<div><span>".$user."</span></div>";
        }
        echo "</div>";
    ?>
    <div class="connect">
        <h2>Tag cloud:</h2>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor, laboriosam!</p>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor, laboriosam!</p>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor, laboriosam!</p>
        <p class="bordure"><a href="index.php?action=signIn">Vous n'avez pas encore de compte, cliquez ici</a></p>
    </div>
</div>