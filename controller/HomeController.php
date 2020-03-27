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
                "view" =>  VIEW_DIR."home.php"];
        }
       

        public function sujet(){
            $man = new SujetManager();
            $sujets = $man->findAll();  

            return [
                "view" => VIEW_DIR."sujet.php",
                "data" => ["liste" => $sujets]
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
            // var_dump($_POST["pseudo"]);die;
            // var_dump(password_verify($_POST["password"], $user->getPassword()));
            $bool = false;
            if($user){
                // if($bool){
                    if( password_verify($_POST["password"], $user->getPassword())){
                        $bool = true;
                        $man = new SujetManager();
                        $sujets = $man->findAll();  
                        return [
                            "view" => VIEW_DIR."sujet.php",
                            "data" => [
                                "bool" => $bool,
                                "user" => $user,
                                "liste"=>$sujets,
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
                    "view" => VIEW_DIR."home.php" ,
                    "data" => "le mot de passe ou le pseudo est incorrect !!!"                       
                ];
            }   
        }
        public function logout(){
            // var_dump($result);
                SESSION::sessionDestroy();
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
            // var_dump($sujet);die;
            header(('location:index.php?action=crea_mess&membre_id='.unserialize($_SESSION["user"])->getId().'&sujet_id='.$sujet.''));
            return [
                "view" => VIEW_DIR."crea_sujet.php",
                "data" => $sujets
            ];
        }
        public function crea_mess($id){
            if($_GET["sujet_id"] != ''){
                $man = new MessageManager();
                $log = $man->add($_POST);  
                $mess = $man->findBySujet($_GET["sujet_id"]);
                $man = new SujetManager();
                $sujets = $man->findAll(); 
                $sujet = $man->findOneById($_GET["sujet_id"])->getTitre();
                $sub = new SubMessManager();
                $sub_mess = $sub->findAll();
                
                // var_dump($log);die;
                return [
                    "view" => VIEW_DIR."crea_mess.php",
                    "data" => [$mess,"sujet" => $sujet,"subMess"=>$sub_mess]
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
        public function subMess(){
            $sub = new SubMessManager();
            $test = $sub->add($_POST);
            // $_POST = '';
            $sub_mess = $sub->findAll();
            // var_dump($test);die;
            $man = new MessageManager();
            $mess = $man->findBySujet($_GET["sujet_id"]);
            $man = new SujetManager();
            $sujet = $man->findOneById($_GET["sujet_id"])->getTitre();
            // var_dump($sub_mess);die;
            // $this->crea_mess($_POST);
           header('location:index.php?action=crea_mess&sujet_id='.$_GET["sujet_id"].'&membre_id='.unserialize($_SESSION["user"])->getId().'');
            
            // var_dump($_POST);die;
        }
                                       
    }
