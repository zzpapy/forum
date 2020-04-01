<?php
    namespace Controller;

    use Model\Managers\MembreManager;
    use Model\Managers\SujetManager;
    use Model\Managers\MessageManager;
    use Model\Managers\SubMessManager;
    use APP\SESSION;
    
    
    class HomeController{

        public function index(){
           

            return [
                "view" =>  VIEW_DIR."sujet.php"];
        }
       

        public function sujet(){
            // var_dump($_SESSION);die;
            // var_dump("toto");die;
           
            // SESSION::addFlash("liste",$test);
            // var_dump($test);die;
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
            else{
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
            // var_dump($_SESSION["data"]["mess"]);die;
            SESSION::addFlash( "data" , [
                "liste"=>$sujets,
                "mess"=>$tab,
                "test"=>$test
                ]);
            // return [
            //                 "view" => VIEW_DIR."sujet.php",
            //                 "data" => [
            //                     "liste" => $sujets,
            //                     "mess" => $tab
            //                     ]
            //                 ];

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
                    if( password_verify($_POST["password"], $user->getPassword())){
                        $bool = true;
                        SESSION::addFlash("user",$user);
                        if($user->getPseudo() == "zzpapy"){
                            SESSION::addFlash("admin",1);
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
                        SESSION::addFlash( "data" , [
                            "bool" => $bool,
                            "user" => $user,
                            "liste"=>$sujets,
                            "mess"=>$tab,
                            "users" => $test
                            ]);
                            // var_dump($_SESSION,$action);die;
                        header('location:index.php?action=sujet');die();
                        return [
                            "view" => VIEW_DIR."sujet.php",
                            "data" => [
                                "bool" => $bool,
                                "user" => $user,
                                "liste" => $sujets,
                                "mess" => $tab
                                ]
                            ];
                        }                   
                        else{
                            return [
                                "view" => VIEW_DIR."home.php" ,
                                "data" => "ce compte n'existe pas"                       
                            ];
                        }
                    }
                    else{
                        return [
                            "view" => VIEW_DIR."sujet.php" ,
                    "data" => "le mot de passe ou le pseudo est incorrect !!!"                       
                ];
            }   
        }
        public function logout(){
            // SESSION::sessionDestroy();
            unset($_SESSION["user"]);
            unset($_SESSION["data"]["admin"]);
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
            var_dump($sujet);die;
            $sujets = $man->findAll(); 
            // var_dump($sujet);die;
            header(('location:index.php?action=crea_mess&membre_id='.$_SESSION["user"]->getId().'&sujet_id='.$sujet.''));
            die();
            // return [
            //     "view" => VIEW_DIR."crea_sujet.php",
            //     "data" => $sujets
            // ];
        }
        public function crea_mess($id){
            if(isset($_SESSION["user"])){
                if($_GET["sujet_id"] != ''){
                    $man = new SujetManager();
                    $sujets = $man->findAll(); 
                    $sujet = $man->findOneById($_GET["sujet_id"])->getTitre();
                    $sub = new SubMessManager();
                    $sub_mess = $sub->findAll();
                    $man = new MessageManager();
                    $log = $man->add($_POST);  
                    $mess = $man->findBySujet($_GET["sujet_id"]);
                    // var_dump($mess);die;
                    // header('location:index.php?action=crea_mess&sujet_id='.$_GET["sujet_id"].'&membre_id='.$_SESSION["user"]->getId());die(); 
                    // if(array_key_exists($_SESSION["views"][$_GET["sujet_id"]],$_SESSION["views"])){
                        
                    // }
                    if(!isset($_SESSION["views"][$_GET["sujet_id"]])){
                        SESSION::addViews($_GET["sujet_id"],1);
                    }
                    else{
                        $_SESSION["views"][$_GET["sujet_id"]]++;
                    }
                    // var_dump( $_SESSION);die();
                    
                    return [
                        "view" => VIEW_DIR."crea_mess.php",
                        "data" => ["mess"=>$mess,"sujet" => $sujet,"subMess"=>$sub_mess]
                    ];
                }
                else{
                    $man = new SujetManager();
                    $sujets = $man->findAll();
                   
                    header('location:index.php?action=crea_mess&sujet_id='.$_GET["sujet_id"].'&membre_id='.$_SESSION["user"]->getId());die(); 
                    return [
                        "view" => VIEW_DIR."sujet.php",
                        "data" => ["liste"=>$sujets]
                    ];
                }

            }
            else{
                $msg = "vous devez d'abord vous connectez...";
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
                                       
    }
