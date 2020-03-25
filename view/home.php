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
        <form method="POST" action="">
        <h2>connectez vous:</h2>
            <input type="text" name="pseudo" class="pseudo" required>
            <input type="password" name=password class="password" required>
            <input type="submit" name="connect" class="submit">
        </form>
        <?php echo "<p>".$text."</p>"?>
        <p><a href="index.php?action=signIn">Vous n'avez pas encore de compte, cliquez ici</a></p>
    </div>
</div>