<?php
    namespace App;
    use Controller\HomeController;
   
    define('DS', DIRECTORY_SEPARATOR); // le caractère séparateur de dossier (/ ou \)
    // meilleure portabilité sur les différents systêmes.
    define('BASE_DIR', dirname(__FILE__).DS); // pour se simplifier la vie
    define('VIEW_DIR', BASE_DIR."view/");     //le chemin où se trouvent les vues
    
    require("app/Autoloader.php");
    require("app/SESSION.php");
    session_start();
    Autoloader::register();
    $ctrl = new HomeController();
    $id = null;
    if(isset($_GET['id'])){
        $id = $_GET['id'];
    }
    if(isset($_POST["connect"])){
        $action = "connect";
        $id = $_POST;
    }
    else if(isset($_POST["crea_sujet"])){
        $action = "crea_sujet";
        $id=$_POST;
    }
    else if(isset($_POST["crea_mess"])){
        // var_dump($_POST);die;
        $action = "crea_mess";
        $id=$_POST;
    }
    else if(isset($_GET['action'])){
        if(isset($_POST["crea"])){
            $action = "crea";
            $id = $_POST;
        }
        else if($_GET["action"] == "logout"){
            SESSION::sessionDestroy(); 
            $action = "index";
        }
        else{
            $action = $_GET['action'];
        }
    }
    else $action = "index"; 
   
    
    
    $result = $ctrl->$action($id);
    // var_dump($result);
    if(isset($result["data"]["bool"])){
        if($result["data"]["bool"] == true){
            SESSION::sessionStart($result["data"]["user"]); 
            $action = "crea_sujet";
            // var_dump($result);
        }
        else{
            $action = "index";
        }
    }
    // var_dump($result);        
    if($action == "ajax"){//si l'action était ajax
        echo $result;//on affiche directement le return du contrôleur (càd la réponse HTTP sera uniquement celle-ci)
    }
    else if($action == "recherche"){
        echo($result);
    }
    else{
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
