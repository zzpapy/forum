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
        public function deleteSujet($id){
            $sql = "DELETE FROM ".$this->tableName." WHERE id_sujet=".$id;
            // var_dump($this->tableName);die;
            return $this->getMultipleResults(
                DAO::delete($sql), 
                $this->className
            );
        }
    }