<?php
    namespace Model\Managers;
    
    use App\Manager;
    use App\DAO;
    use Model\Entities\Membre;

    class MembreManager extends Manager{

        protected $className = "Model\Entities\Membre"; 
        protected $tableName = "membre";

        public function __construct(){
            parent::connect();
        }

       
        
        public function findOneById($id){
            return parent::findOneById($id);
        }
    }