<?php
    namespace Model\Managers;
    
    use App\Manager;
    use App\DAO;
    use Model\Entities\Sujet;

    class SujetManager extends Manager{

        protected $className = "Model\Entities\Sujet"; 
        protected $tableName = "sujet";

        public function __construct(){
            parent::connect();
        }

       
        
        public function findOneById($id){
            return parent::findOneById($id);
        }
    }