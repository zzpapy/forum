<?php
    namespace App;

    abstract class Entity{

        protected function hydrate($data){
            $tab = [];
            foreach($data as $field => $value){
                $fieldArray = explode("_", $field);
                
                if(isset($fieldArray[1]) && $fieldArray[1] == "id"){
                    $manName = ucfirst($fieldArray[0])."Manager";
                    $FQCName = "Model\Managers".DS.$manName;
                    
                    $man = new $FQCName();
                    $value = $man->findOneById($value);
                    
                }
                
                $method = "set".ucfirst($fieldArray[0]);
                if(method_exists($this, $method)){
                    array_push($tab, $this->$method($value));
                    $this->$method($value);
                    // var_dump($method);
                }
                
            }
            // var_dump($tab);
        }

        public function getClass(){
            return get_class($this);
        }
    }