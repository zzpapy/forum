<?php use App\SESSION; ?>
<div class="sticky">
    <!-- <i class='fas change fa-palette fa-3x'></i>
    <input id="choix" class="hide "  type="color"> -->
    <h1 class="titre">Mon Forum
        
    <?php
    if(isset($_SESSION["user"])){
        echo "<span>Bonjour : ".$_SESSION["user"]->getPseudo()."</span>";
    }
    if(isset($_SESSION["admin"])){
        echo "<span>ADMINISTRATEUR</span>";
        echo "<div class='signal'>";

        echo "</div>";
    }
    ?>
    <a href="index.php?action=findPhoto">Gallerie</a>
    </h1>
    <div class="head">
                    
        <?php 
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
        if(isset($_SESSION["admin"])){
            echo "<a href='index.php?action=affichSignal'>SIGNALEMENT(".$nb_signal.")</a>";
        }
       
        
        if(isset($_SESSION["user"])){
                echo "<a href='index.php?action=sujet'>Accueil</a>";                
                echo "<div class='recherche'>";
                echo "<div class='recherche'>recherche sujet</div>";
                echo "<input type='text' id='recherche'>";
                echo "</div>";
                echo "<a href='index.php?action=logout'>logout</a>";
                echo "";
            }        
            ?>
            <a href="index.php?action=findPhoto"></a>
    </div>
</div>
<div class='affich'></div>
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