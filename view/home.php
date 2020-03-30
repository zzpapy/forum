<?php 
// var_dump($result);
if(isset($result["data"]) && $result["data"] != ''){
    $text = $result["data"];
}
else{
    $text = '';
}
?>
<div class="home">
    <div class="connect">
        <form class="form_flex" method="POST" action="index.php?action=connect">
        <h2>connectez vous:</h2>
            <input type="text" name="pseudo" class="pseudo" placeholder="pseudo" required>
            <input type="password" name=password class="password"placeholder="mot de passe"  required>
            <input type="submit" name="connect" class="submit">
        </form>
        <?php echo "<p>".$text."</p>"?>
        <p class="bordure"><a href="index.php?action=signIn">Vous n'avez pas encore de compte, cliquez ici</a></p>
    </div>
</div>