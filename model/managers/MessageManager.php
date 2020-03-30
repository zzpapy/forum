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
        public function countMess(){
            // var_dump($this->tableName);die;
            $sql = "SELECT sujet_id, count(id_message) AS nb
                    FROM ".$this->tableName." a
                    GROUP BY sujet_id";
                    // var_dump($this->tableName);die;

            return $this->getMultipleResults(
                DAO::select($sql), 
                $this->className
            );
        }
        public function findAll(){

            $sql = "SELECT *
                    FROM ".$this->tableName." a
                    ORDER BY date DESC";
       
            return $this->getMultipleResults(
                DAO::select($sql), 
                $this->className
            );
        }
        public function delete($id){
            $sql = "DELETE FROM ".$this->tableName." WHERE id_message=".$id;
            // var_dump($id);die;
            return $this->getMultipleResults(
                DAO::delete($sql), 
                $this->className
            );
        }
        public function messNb($sujet){
// var_dump($this->tableName);
            $sql = "SELECT COUNT(a.id_message) AS nb, sujet_id
                    FROM ".$this->tableName." a
                   WHERE a.sujet_id =".$sujet;
            
            // var_dump($id);
            return $this->getOneOrNullResult(
                DAO::select($sql), 
                $this->className
            );
       
            // return $this->getMultipleResults(
            //     DAO::select($sql,["sujet"=>$sujet], false),
            //     $this->className
                
            // );
            
        }
       
    }