<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel="stylesheet" href="public/styles/style.css">
    <title>Document</title>
</head>
<body>
<div class="wrapper">
    <div class="sticky">
    <i class='fas change fa-palette fa-3x'></i>
    <input id="choix" class="hide "  type="color">
        <h1>Mon Forum
        <?php
        if(isset($_SESSION["user"])){
            echo "<span>Bonjour : ".unserialize($_SESSION["user"])->getPseudo()."</span>";
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
    <div class="container">
        <div class="affich"></div>      
        <?php 
        echo $page;
        ?>
    </div>
</div>
<script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
    <script src="public/scripts/script.js"></script>
</body>
</html>