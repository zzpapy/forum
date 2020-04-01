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
        public function deleteUser($id){
            $sql = "DELETE FROM ".$this->tableName." WHERE id_membre=".$id;
            // var_dump($this->tableName);die;
            return $this->getMultipleResults(
                DAO::delete($sql), 
                $this->className
            );
        }
    }