<?php
    namespace Controller;

    use Model\Managers\MembreManager;
    use Model\Managers\SujetManager;
    use Model\Managers\MessageManager;
    use Model\Managers\SubMessManager;
    use Model\Managers\SignalementManager;
    use APP\SESSION;
    
    
    class HomeController{

        public function index(){
           

            return [
                "view" =>  VIEW_DIR."sujet.php"];
        }
       

        public function sujet(){
            // var_dump($_SESSION);die;
            // var_dump("toto");die;
           
            // var_dump($_SESSION);die;
            // SESSION::addFlash("liste",$test);
            // var_dump($test);die;
            $signal = new SignalementManager();
            $signal = $signal->findAll();
            // var_dump($signal);die;
            $man = new SujetManager();
            $sujets = $man->findAll();
            // var_dump($sujets);die();
            $tab = [];
            if(is_object($sujets)){
                $man = new MessageManager();
                $mess = $man->findBySujet($sujets->getId()); 
                // var_dump($mess);
                if($mess && !is_object($mess)){
                    $tab[$sujets->getId()] = count($mess);
                    // array_push($tab,[$sujets->getId()=>count($mess)]);
                    
                }
                else if(is_object($mess)){
                    $tab[$sujets->getId()] = 1;
                }
                else{
                    $tab[$sujets->getId()] = 0;
                    // array_push($tab,[$value->getId()=>1]);
                }
                
            }
            else if($sujets != ''){
                foreach ($sujets as $key => $value) {
                    $man = new MessageManager();
                    $mess = $man->findBySujet($value->getId()); 
                    // var_dump($mess);
                    if($mess && !is_object($mess)){
                        $tab[$value->getId()] = count($mess);
                        // array_push($tab,[$value->getId()=>count($mess)]);
                        
                    }
                    else if(is_object($mess)){
                        $tab[$value->getId()] = 1;
                    }
                    else{
                        $tab[$value->getId()] = 0;
                        // array_push($tab,[$value->getId()=>1]);
                    }
                }
            }
            $test = new MembreManager();
            $test = $test->findAll();
            SESSION::addFlash( "liste",$sujets);
            SESSION::addFlash( "mess",$tab);
            SESSION::addFlash( "users",$test);
            SESSION::addFlash( "signal",$signal);
    
            return [
                "view" => VIEW_DIR."sujet.php",
                "data" =>""
            ];
        }






        public function signIn(){

            return [
                "view" =>  VIEW_DIR."crea-compte.php"
            ];
        }


        public function crea($data){
           
            $man = new MembreManager($data);
            $user = $man -> findOneByName($data["pseudo"]);
            if($user){
                echo "le pseudo est déjà utilisé";
                return [
                    "view" => VIEW_DIR."crea-compte.php",
                    "data" => ""
                ];
            }
            else{
                // var_dump($_POST);die;
                $user  = $man -> add($_POST);
                return [
                    "view" => VIEW_DIR."home.php",
                    "data" => ""
                ];
            }
        }
        public function connect(){
            $man = new MembreManager();
            $user = $man -> findOneByName($_POST["pseudo"]);
            // var_dump($user);die;
            // var_dump(password_verify($_POST["password"], $user->getPassword()));
            $man ="";
            $bool = false;
            if($user){
                // if($bool){
                    
                    if( password_verify($_POST["password"], $user->getPassword()) && $_POST["pseudo"] == $user->getPseudo()){
                        $bool = true;
                        SESSION::addFlash("user",$user);
                        if($user->getPseudo() == "zzpapy"){
                            SESSION::addFlash("admin",1);
                            $msg = "Vous êtes maintenant connecté";
                            SESSION::addFlash("success",$msg);
                        }
                        
                        
                        $man = new SujetManager();
                        $sujets = $man->findAll(); 
                        $action = "crea_sujet"; 
                        if(is_object($sujets)){
                            $man = new MessageManager();
                            $mess = $man->findBySujet($sujets->getId()); 
                            // var_dump($mess);
                            if($mess && !is_object($mess)){
                                $tab[$sujets->getId()] = count($mess);
                                // array_push($tab,[$sujets->getId()=>count($mess)]);
                                
                            }
                            else if(is_object($mess)){
                                $tab[$sujets->getId()] = 1;
                            }
                            else{
                                $tab[$sujets->getId()] = 0;
                                // array_push($tab,[$value->getId()=>1]);
                            }
                            
                        }
                        else{
                            // var_dump("toto");die();
                            
                            foreach ($sujets as $key => $value) {
                                $man = new MessageManager();
                                $mess = $man->findBySujet($value->getId()); 
                                // var_dump($mess);
                                if($mess && !is_object($mess)){
                                    $tab[$value->getId()] = count($mess);
                                    // array_push($tab,[$value->getId()=>count($mess)]);
                                    
                                }
                                else if(is_object($mess)){
                                    $tab[$value->getId()] = 1;
                                }
                                else{
                                    $tab[$value->getId()] = 0;
                                    // array_push($tab,[$value->getId()=>1]);
                                }
                            }
                            // var_dump("toto",$tab);die;
                        }
                        $test = new MembreManager();
                        $test = $test->findAll();
                        SESSION::addFlash( "bool",$bool);
                        SESSION::addFlash( "user",$user);
                        SESSION::addFlash( "liste",$sujets);
                        SESSION::addFlash( "mess",$tab);
                        SESSION::addFlash( "users",$test);
                            // var_dump($_SESSION,$action);die;
                        header('location:index.php?action=sujet');die();
                        // return [
                        //     "view" => VIEW_DIR."sujet.php",
                        //     "data" => [
                        //         "bool" => $bool,
                        //         "user" => $user,
                        //         "liste" => $sujets,
                        //         "mess" => $tab
                        //         ]
                        //     ];
                        }                   
                        else{
                            $msg = "Une erreur s'est produite merci de vérifier vos éléments de connexion";
                            SESSION::addFlash("error",$msg);
                            
                            return [
                                "view" => VIEW_DIR."sujet.php" ,
                                "data" => "ce compte n'existe pas"                       
                            ];
                        }
                    }
                    else{
                        $msg = "Une erreur s'est produite merci de vérifier vos éléments de connexion";
                        SESSION::addFlash("error",$msg);
                        return [
                            "view" => VIEW_DIR."sujet.php" ,
                    "data" => "le mot de passe ou le pseudo est incorrect !!!"                       
                ];
            }   
        }
        public function logout(){
            // SESSION::sessionDestroy();
            unset($_SESSION["user"]);
            unset($_SESSION["admin"]);
            // var_dump($_SESSION);die();
                header('location:index.php?action=index'); 
                return [
                    "view" => VIEW_DIR."home.php" ,
                    "data" => "Aurevoir"                       
                ];
        }
        public function crea_sujet($id){
            $man = new SujetManager();
            $sujet = $man->add($_POST);  
            // var_dump($sujet);die;
            $sujets = $man->findAll(); 
            if($sujet != ""){
                $msg = "Un nouveau sujet viens d'être créer";
                SESSION::addFlash("success",$msg);
                SESSION::addFlash("liste",$sujets);
            }
            // var_dump($sujets);
            header(('location:index.php?action=crea_mess&membre_id='.$_SESSION["user"]->getId().'&sujet_id='.$sujet.''));
            die();
            // return [
            //     "view" => VIEW_DIR."crea_sujet.php",
            //     "data" => $sujets
            // ];
        }
        public function crea_mess($id){
            // var_dump($_GET);die();
            if(isset($_SESSION["user"])){
                if($_GET["sujet_id"] != '' && !isset($_GET["ok"])){
                    $man = new SujetManager();
                    $sujets = $man->findAll(); 
                    $sujet = $man->findOneById($_GET["sujet_id"])->getTitre();
                    $sub = new SubMessManager();
                    $sub_mess = $sub->findAll();
                    $man = new MessageManager();
                    $log = $man->add($_POST); 
                    if($log != ""){
                        $msg = "Un nouveau message viens d'être créer";
                        SESSION::addFlash("success",$msg);
                    } 
                    $mess = $man->findBySujet($_GET["sujet_id"]);
                    // var_dump($mess);die;
                    // if(array_key_exists($_SESSION["views"][$_GET["sujet_id"]],$_SESSION["views"])){
                        
                        // }
                        if(!isset($_SESSION["views"][$_GET["sujet_id"]])){
                            SESSION::addViews($_GET["sujet_id"],1);
                        }
                        else{
                            $_SESSION["views"][$_GET["sujet_id"]]++;
                        }
                        // var_dump( $_SESSION);die();
                        // header('location:index.php?action=sujet');die(); 
                        $_POST= "";
                        header('location:index.php?action=crea_mess&ok=true&sujet_id='.$_GET["sujet_id"].'&membre_id='.$_SESSION["user"]->getId());die(); 
                    }
                    else if(isset($_GET["ok"])){
                        $man = new SujetManager();
                        $sujets = $man->findAll(); 
                        $sujet = $man->findOneById($_GET["sujet_id"])->getTitre();
                        $sub = new SubMessManager();
                        $sub_mess = $sub->findAll();
                        $man = new MessageManager();
                        $mess = $man->findBySujet($_GET["sujet_id"]);
                        return [
                            "view" => VIEW_DIR."crea_mess.php",
                            "data" => ["mess"=>$mess,"sujet" => $sujet,"subMess"=>$sub_mess]
                        ];
                        
                }
                else{
                    $man = new SujetManager();
                    $sujets = $man->findAll();
                   
                    return [
                        "view" => VIEW_DIR."sujet.php",
                        "data" => ["liste"=>$sujets]
                    ];
                }

            }
            else{
                $msg = "vous devez d'abord vous connecter...";
                SESSION::addFlash("error",$msg);
                $users = new MembreManager();
                $users = $users->findAll();
                SESSION::addFlash("users",$users);
                // var_dump($sujets);die;
                // var_dump($_SESSION);die;
                return [
                    "view" => VIEW_DIR."sujet.php",
                    "data" => ""
                ];
            }
        }
        public function subMess(){
            $sub = new SubMessManager();
            // var_dump($_POST);die;
            $test = $sub->add($_POST);
            $sub_mess = $sub->findAll();
            // var_dump($test);die;
            $man = new MessageManager();
            $mess = $man->findBySujet($_GET["sujet_id"]);
            $man = new SujetManager();
            $sujet = $man->findOneById($_GET["sujet_id"])->getTitre();
            // var_dump($sub_mess);die;
            // $this->crea_mess($_POST);
           header('location:index.php?action=crea_mess&sujet_id='.$_GET["sujet_id"].'&membre_id='.$_SESSION["user"]->getId().'');die();
            
            // var_dump($_POST);die;
        }
        public function delete(){
            $man = new MessageManager();
            $man-> delete($_POST["message_id"]);
            // var_dump($_POST);die;
            header('location:index.php?action=sujet');
        }
        public function deleteSujet(){
            $man = new SujetManager();
            $man-> deleteSujet($_POST["sujet_id"]);
            // var_dump($_POST);die;
            header('location:index.php?action=sujet');
        }
        public function deleteUser(){
            // var_dump($_POST);die();
            $man = new MembreManager();
            $man-> deleteUser($_POST["membre_id"]);
            $users = $man->findAll();
            SESSION::addFlash("users",$users);
            // var_dump($_POST);die;
            header('location:index.php?action=sujet');
        }
        public function recherche(){
            $man = new SujetManager();
            $char = $_GET["nb"];
            $res = $man->recherche($char);
            $i = 0;
            $tab = [];
            if($res){
                if(is_object($res) ){
                    $titre = $res->getTitre();
                   $id = $res->getId();
                    include(VIEW_DIR."ajax.php");
                }
                else{
                    while($i < count($res)){
                        $titre = $res[$i]->getTitre();
                        $id = $res[$i]->getId();
                        
                        // var_dump($photo);
                        include(VIEW_DIR."ajax.php");
                        $i++;           
                    }
                }
            }
            // var_dump($res);
        }
        public function signal(){
            $man = new SignalementManager();
            $sign = $man->add($_POST);
            $msg = "Ce message à bien été signalé au modérateur";
           $toto = SESSION::addFlash("success",$msg);
            // var_dump($_SESSION);die;
            return [
                "view" => VIEW_DIR."sujet.php",
                "data" => ""
            ];
            // header('location:index.php?action=sujet');
        }
        public function affichSignal(){
            // var_dump($_SESSION);die;
            return [
                "view" => VIEW_DIR."affich_signal.php",
                "data" => ""
            ];
        }
                                       
    }
