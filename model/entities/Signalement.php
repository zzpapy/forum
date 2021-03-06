<?php
    namespace Model\Entities;

    use App\Entity;

    final class Signalement extends Entity{

        private $id;
        private $message;
        private $membre;
        private $date;

        public function __construct($data){ 
            // var_dump($data);die;        
            $this->hydrate($data);        
        }

       

        

        /**
         * Get the value of id
         */ 
        public function getId()
        {
                return $this->id;
        }

        /**
         * Set the value of id
         *
         * @return  self
         */ 
        public function setId($id)
        {
                $this->id = $id;

                return $this;
        }

        /**
         * Get the value of message
         */ 
        public function getMessage()
        {
                return $this->message;
        }

        /**
         * Set the value of message
         *
         * @return  self
         */ 
        public function setMessage($message)
        {
                $this->message = $message;

                return $this;
        }

        /**
         * Get the value of membre
         */ 
        public function getMembre()
        {
                return $this->membre;
        }

        /**
         * Set the value of membre
         *
         * @return  self
         */ 
        public function setMembre($membre)
        {
                $this->membre = $membre;

                return $this;
        }

        /**
         * Get the value of date
         */ 
        public function getDate()
        {
                return $this->date;
        }

        /**
         * Set the value of date
         *
         * @return  self
         */ 
        public function setDate($date)
        {
                $this->date = $date;

                return $this;
        }
    }
