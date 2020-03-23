<?php 
namespace Model\Entities;

use App\Entity;

final class VehSujeticule extends Entity{

    private $id_message;
    private $id_user;
    private $id_sujet;
    private $content;

    public function __construct($data){         
        $this->hydrate($data);        
    }

    /**
     * Get the value of id_message
     */ 
    public function getId_message()
    {
        return $this->id_message;
    }

    /**
     * Set the value of id_message
     *
     * @return  self
     */ 
    public function setId_message($id_message)
    {
        $this->id_message = $id_message;

        return $this;
    }

    /**
     * Get the value of id_user
     */ 
    public function getId_user()
    {
        return $this->id_user;
    }

    /**
     * Set the value of id_user
     *
     * @return  self
     */ 
    public function setId_user($id_user)
    {
        $this->id_user = $id_user;

        return $this;
    }

    /**
     * Get the value of id_sujet
     */ 
    public function getId_sujet()
    {
        return $this->id_sujet;
    }

    /**
     * Set the value of id_sujet
     *
     * @return  self
     */ 
    public function setId_sujet($id_sujet)
    {
        $this->id_sujet = $id_sujet;

        return $this;
    }

    /**
     * Get the value of content
     */ 
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set the value of content
     *
     * @return  self
     */ 
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }
}
?>