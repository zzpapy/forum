<?php
    namespace Model\Managers;
    
    use App\Manager;
    use App\DAO;
    use Model\Entities\User;

    class MessageManager extends Manager{

        protected $className = "Model\Entities\Message"; 
        protected $tableName = "message";

        public function __construct(){
            parent::connect();
        }

       
        
        public function findOneById($id){
            return parent::findOneById($id);
        }
    }