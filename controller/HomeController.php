<?php
    namespace Controller;

    use Model\Managers\MembreManager;
    use Model\Managers\SujetManager;
    use Model\Managers\MessageManager;
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
            // var_dump($data);die;
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
                $man -> add($data);
                return [
                    "view" => VIEW_DIR."home.php",
                    "data" => ""
                ];
            }
        }
        public function connect($data){
            $man = new MembreManager($data);
            $user = $man -> findOneByName($data["pseudo"]);
            $bool = false;
            if($user){
                if( password_verify($data["password"], $user->getPassword())){
                    $bool = true;
                    
                }
                if($bool){
                    // var_dump($bool);
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
                }
                else{
                return [
                    "view" => VIEW_DIR."home.php" ,
                    "data" => "ce compte n'existe pas"                       
                ];
            }
        }
        public function logout(){
                SESSION::sessionDestroy();
        }
        public function crea_sujet($id){
            $man = new SujetManager();
            $man->add($id);  
            $sujets = $man->findAll();  
            // // $user = $_SESSION["user"];
            // var_dump($sujets);die;
            return [
                "view" => VIEW_DIR."crea_sujet.php",
                "data" => $sujets
            ];
        }
        public function crea_mess($id){
            $man = new MessageManager();
            $log = $man->add($id);  
            $mess = $man->findBySujet($_GET["sujet_id"]);
            $man = new SujetManager();
            $sujet = $man->findOneById($_GET["sujet_id"])->getTitre();
            // var_dump($sujet);die;

            return [
                "view" => VIEW_DIR."crea_mess.php",
                "data" => [$mess,"sujet" => $sujet]
            ];
        }
                                       
    }
