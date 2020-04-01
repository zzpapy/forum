<?php
    namespace App;
    use Controller\HomeController;

    // var_dump($_POST);die();
    define('DS', DIRECTORY_SEPARATOR); // le caractère séparateur de dossier (/ ou \)
    // meilleure portabilité sur les différents systêmes.
    define('BASE_DIR', dirname(__FILE__).DS); // pour se simplifier la vie
    define('VIEW_DIR', BASE_DIR."view/");     //le chemin où se trouvent les vues
    
    require("app/Autoloader.php");
    require("app/SESSION.php");
    Autoloader::register();
    session_start();
    $ctrl = new HomeController();
    $id = null;
    if(isset($_GET['id'])){
        $id = $_GET['id'];
    }
    if(isset($_GET['action'])){
        if($_GET["action"] == "logout"){
            $action = "logout";
        }
        else{
            $action = $_GET['action'];
        }
    }
    else $action = "sujet"; 
    $result = $ctrl->$action($id);
    
    if($action == "ajax"){//si l'action était ajax
        echo $result;//on affiche directement le return du contrôleur (càd la réponse HTTP sera uniquement celle-ci)
    }
    else if($action == "recherche"){
        echo($result);
    }
    else{
        // var_dump($_SESSION,$action);die;
        ob_start();//démarre un buffer (tampon de sortie)
        /*la vue s'affiche dans le buffer qui devra être inséré
        au milieu du template*/
        include($result['view']);
        // var_dump($result['view']);
        /*je mets cet affichage dans une variable*/
        $page = ob_get_contents();
        /*j'efface le tampon*/
        ob_end_clean();
        /*j'affiche le template principal*/
        include VIEW_DIR."layout.php";
    }
