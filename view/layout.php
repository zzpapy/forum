<?php use App\SESSION; ?>
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
<div class="modal close hide">
    <div class="affich .transform flex">
        <div class="arrow carousel" data-direction="prev">
            <i class="fas fa-arrow-left fa-2x"></i>
        </div>
        <div class="center_modal">
            <img id="modal_img" src="">
        </div>
        <div class="arrow1 carousel" data-direction="next">
            <i class="fas fa-arrow-right fa-2x"></i>
        </div>
    </div>
</div>
<div class="wrapper">
    <!-- <div class="error">
        <?php 
            // if(isset($_SESSION["error"])){
            //     $msg = SESSION::getFlash("error");
            // }
            // else{
            //     $msg = "";
            // }
        ?>
    </div> -->
    <div class="container">
        <?php 
            include (VIEW_DIR.'header.php');
            echo "<div class='content'>";
            echo $page;
               
            if(!isset($_SESSION["user"])){
                include (VIEW_DIR.'home.php');
            }
            else{
                include (VIEW_DIR.'connected.php');
            }
            echo "</div>";
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