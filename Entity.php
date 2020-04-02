<?php
    namespace App;
    
    use Model\Managers\MembreManager;
    use Model\Managers\SujetManager;
    use Model\Managers\MessageManager;
    use Model\Managers\SubMessManager;

    abstract class Entity{

        protected function hydrate($data){
            $tab = [];
            foreach($data as $field => $value){
                //field = marque_id
                //fieldarray = ['marque','id']
                $fieldArray = explode("_", $field);
                
                if(isset($fieldArray[1]) && $fieldArray[1] == "id"){
                    $manName = ucfirst($fieldArray[0])."Manager";
                    $FQCName = "Model\Managers".DS.$manName;
                   if($manName == "MembreManager"){
                    $man = new MembreManager();

                   }
                   if($manName == "SujetManager"){
                    $man = new SujetManager();

                   }
                   if($manName == "MessageManager"){
                    $man = new MessageManager();

                   }
                   if($manName == "SubMessManager"){
                    $man = new SubMessManager();

                   }
                    // var_dump($manName);die;
                    // $man = new $manName();
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