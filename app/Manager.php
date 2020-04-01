<?php
    namespace App;

    abstract class Manager{

        protected function connect(){ 
            DAO::connect();
        }

        public function findAll(){

            $sql = "SELECT *
                    FROM ".$this->tableName." a
                    ORDER BY date DESc";
       
            return $this->getMultipleResults(
                DAO::select($sql), 
                $this->className
            );
        }

        public function findOneById($id){

            $sql = "SELECT *
                    FROM ".$this->tableName." a
                    WHERE a.id_".$this->tableName." = :id
                    ";
            // var_dump($id);
            return $this->getOneOrNullResult(
                DAO::select($sql, ['id' => $id], false), 
                $this->className
            );
        }

        public function findOneByName($nom){
            // var_dump($this->tableName);die;
            $sql = "SELECT *
                    FROM ".$this->tableName." a
                    WHERE a.pseudo = :nom
                    ";

            return $this->getOneOrNullResult(
                DAO::select($sql, ['nom' => $nom], false), 
                $this->className
            );
        }
        public function findBySujet($sujet_id){
            $sql = "SELECT *
                    FROM ".$this->tableName." v WHERE v.sujet_id = :id
                    ORDER BY id_message DESC";

            return $this->getMultipleResults(
                DAO::select($sql, ['id' => $sujet_id]), 
                $this->className
            );
        }        
        
        public function add($data){
            if(isset($data["pseudo"])){
                
                $data["pseudo"] = filter_var ( $data["pseudo"], FILTER_SANITIZE_STRING);
                $data["password"] = password_hash($data["password"], PASSWORD_DEFAULT);
                unset($data["crea"]);
                
                $keys = array_keys($data);
                $values = array_values($data);
                
                $sql = "INSERT INTO ".$this->tableName."
                (".implode(',', $keys).")
                VALUES
                ('".implode("','",$values)."')";
                return DAO::insert($sql);
            }
            else if(isset( $data["titre"])){
                if($data["titre"] != ''){
                    $data["membre_id"] = filter_var ( $data["membre_id"], FILTER_SANITIZE_STRING);
                    $data["titre"] = filter_var ( $data["titre"], FILTER_SANITIZE_STRING);
                    unset($data["crea_sujet"]);
                    $date = new \DateTime();
                    $date = date_format($date, 'Y-m-d H:i:s');
                    $data["date"] = $date;
                    $keys = array_keys($data);
                    $values = array_values($data);
                    
                    $sql = "INSERT INTO ".$this->tableName."
                        (".implode(',', $keys).")
                        VALUES
                        ('".implode("','",$values)."')";
                    return DAO::insert($sql);
                }
            }
            else if(isset($data["content"]) && !isset($data["message_id"])){
                $_POST = '';
                if($data["content"] != ''){
                    $data["membre_id"] = filter_var ( $data["membre_id"], FILTER_SANITIZE_STRING);
                    $data["sujet_id"] = filter_var ( $data["sujet_id"], FILTER_SANITIZE_STRING);
                    $data["content"] = filter_var ( $data["content"], FILTER_SANITIZE_STRING);
                    $date = new \DateTime();
                    $date = date_format($date, 'Y-m-d H:i:s');
                    $data["date"] = $date;
                    unset($data["crea_mess"]);
                    $keys = array_keys($data);
                    $values = array_values($data);
                    
                    $sql = "INSERT INTO ".$this->tableName."
                    (".implode(',', $keys).")
                    VALUES
                    ('".implode("','",$values)."')";
                    return DAO::insert($sql);
                }
            }
            else if(!empty($_POST)){
                if(isset($_POST["content"]) && $_POST["content"] != ''){
                    $data["membre_id"] = filter_var ( $data["membre_id"], FILTER_SANITIZE_STRING);
                    $data["message_id"] = filter_var ( $data["message_id"], FILTER_SANITIZE_STRING);
                    $data["content"] = filter_var ( $data["content"], FILTER_SANITIZE_STRING);
                    $date = new \DateTime();
                    $date = date_format($date, 'Y-m-d H:i:s');
                    $data["date"] = $date;
                    $keys = array_keys($data);
                    $values = array_values($data);
                    
                    $sql = "INSERT INTO ".$this->tableName."
                    (".implode(',', $keys).")
                    VALUES
                    ('".implode("','",$values)."')";
                    $_POST = [];

                    return DAO::insert($sql);
                }
            }
        }
        
        protected function getMultipleResults($rows, $class){

            $objects = [];
            if(isset($rows[0])){
                foreach($rows as $row){
                    $objects[] = new $class($row);
                }
            }
            else if($rows == null){
                return null;
            }
            else{
                return new $class($rows);
            }

            return $objects;
        }

        protected function getOneOrNullResult($row, $class){
            if($row != null){
                return new $class($row);
            }
            return false;
        }
        public function recherche($char){
            $sql = " SELECT a.*
                    FROM ".$this->tableName." a 
                    WHERE a.titre LIKE '%". $char ."%'";
            return $this->getMultipleResults(
                DAO::select($sql), 
                $this->className
            );
        }

    }