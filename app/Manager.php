<?php
    namespace App;

    abstract class Manager{

        protected function connect(){ 
            DAO::connect();
        }

        public function findAll(){

            $sql = "SELECT *
                    FROM ".$this->tableName." a
                    ";

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
                // $data = array(
                    //     'id'    => FILTER_VALIDATE_INT,                    
                    //     'titre'   => FILTER_SANITIZE_STRING
                    // );
                    $data["user_id"] = filter_var ( $data["user_id"], FILTER_SANITIZE_STRING);
                    $data["titre"] = filter_var ( $data["titre"], FILTER_SANITIZE_STRING);
                    unset($data["crea_sujet"]);
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
        public function update($data,$id){
            // var_dump($data);die;
            $keys = array_keys($data);
            $values = array_values($data);
            $sql = "UPDATE ".$this->tableName."
                    SET ".implode($keys)."=".json_encode(implode($values))."
                    WHERE id_vehicule = ".$id;
            return DAO::update($sql);
        }
        // public function findByMarque($id){
        //     $sql = "SELECT *
        //             FROM ".$this->tableName." a WHERE marque_id = :id";
        //             // var_dump($id);die;
        //     return $this->getMultipleResults(
        //         DAO::select($sql,["id"=>$id]), 
        //         $this->className
        //     );
        // }
        
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