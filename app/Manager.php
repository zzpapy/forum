<?php
    namespace App;

    abstract class Manager{

        protected function connect(){ 
            DAO::connect();
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
            // var_dump($data);die;
            if(isset($data["pseudo"])){
                // var_dump($data);die;
                
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
                // var_dump($data);die;
                if($data["titre"] != ''){
                    $data["membre_id"] = filter_var ( $data["membre_id"], FILTER_SANITIZE_STRING);
                    $data["titre"] = filter_var ( $data["titre"], FILTER_SANITIZE_STRING);
                    unset($data["crea_sujet"]);
                    $date = new \DateTime();
                    $date = date_format($date, 'Y-m-d H:i:s');
                    $data["date"] = $date;
                    // var_dump($data);die;
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
                    // var_dump($date);die;
                    unset($data["crea_mess"]);
                    $keys = array_keys($data);
                    $values = array_values($data);
                    // var_dump($data);die;
                    // var_dump($this->tableName);die;
                    
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
                    // var_dump($data);die;
                    // var_dump($data);die;
                    // var_dump($this->tableName);die;
                    
                    $sql = "INSERT INTO ".$this->tableName."
                    (".implode(',', $keys).")
                    VALUES
                    ('".implode("','",$values)."')";
                    $_POST = [];
                    // var_dump(isset($_POST["content"]) && $_POST["content"] != '');die;
                    return DAO::insert($sql);
                }
            }
        }
        public function update($data,$id){
            // var_dump($data);die;
            $keys = array_keys($data);
            $values = array_values($data);
            $sql = "UPDATE ".$this->tableName."
                    SET ".implode($keys)."=".json_encode(implode($values))."
                    WHERE id_vehicule = ".$id;
            return DAO::update($sql);
        }
        protected function getMultipleResults($rows, $class){

            $objects = [];
            if(isset($rows[0])){
                foreach($rows as $row){
                    // if(is_array( $row)){}
                    $objects[] = new $class($row);
                }
            }
            else if($rows == null){
                return null;
            }
            else{
                // var_dump(isset($rows[0]));
                return new $class($rows);
            }

            return $objects;
        }

        protected function getOneOrNullResult($row, $class){
            // var_dump($class);die;
            if($row != null){
                return new $class($row);
            }
            return false;
        }
        public function recherche($char){

            $sql = " SELECT a.immat, a.id_vehicule, a.photo
                    FROM ".$this->tableName." a
                    WHERE a.immat LIKE '%". $char ."%'";
                    // var_dump($char);die;

            return $this->getMultipleResults(
                DAO::select($sql), 
                $this->className
            );
        }

    }