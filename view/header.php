<?php use App\SESSION; ?>
<div class="sticky">
    <!-- <i class='fas change fa-palette fa-3x'></i>
    <input id="choix" class="hide "  type="color"> -->
    <h1>Mon Forum
    <?php
    if(isset($_SESSION["user"])){
        echo "<span>Bonjour : ".$_SESSION["user"]->getPseudo()."</span>";
    }
    ?>
    </h1>
    <div class="head">
                    
        <?php 
        
        if(isset($_SESSION["user"])){
                echo "<span><a href='index.php?action=sujet'>Accueil</a></span>";                
                echo "<div class='recherche'>";
                echo "<div class='recherche'>recherche sujet</div>";
                echo "<input type='text' id='recherche'>";
                echo "</div>";
                echo "<span><a href='index.php?action=logout'>logout</a></span>";
            }        
            ?>
    </div>
</div>
<div class="error">
    <?php 
        if(isset($_SESSION["error"])){
            $msg = SESSION::getFlash("error");
        }
        else{
            $msg = "";
        }
        echo $msg;
    ?>
</div>
<div class="success">
<?php 
        if(isset($_SESSION["success"])){
            $msg = SESSION::getFlash("success");
        }
        else{
            $msg = "";
        }
        echo $msg;
    ?>
</div>