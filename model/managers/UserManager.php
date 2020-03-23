<?php
    namespace Model\Managers;
    
    use App\Manager;
    use App\DAO;
    use Model\Entities\User;

    class UserManager extends Manager{

        protected $className = "Model\Entities\User"; 
        protected $tableName = "user";

        public function __construct(){
            parent::connect();
        }

       
        
        public function findOneById($id){
            return parent::findOneById($id);
        }
    }