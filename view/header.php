<?php use App\SESSION; ?>
<div class="sticky">
    <!-- <i class='fas change fa-palette fa-3x'></i>
    <input id="choix" class="hide "  type="color"> -->
    <h1>Mon Forum
        
    <?php
    if(isset($_SESSION["user"])){
        echo "<span>Bonjour : ".$_SESSION["user"]->getPseudo()."</span>";
    }
    if(isset($_SESSION["admin"])){
        echo "<p>ADMINSTRATEUR</p>";
        echo "<div class='signal'>";
        // var_dump(isset($_SESSION["signal"]));die;
        if(isset($_SESSION["signal"])){
            if(!is_object($_SESSION["signal"])){
                $nb_signal = count($_SESSION["signal"]);
            }
            else{
                $nb_signal = 1;
            }
        }
        else{
            $nb_signal = 0;
        }
        echo "<a href='index.php?action=affichSignal'>SIGNALEMENT(".$nb_signal.")</a>";

        echo "</div>";
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
                echo "<div class='affich'></div>";
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