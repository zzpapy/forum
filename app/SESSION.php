<?php
	namespace App;
	
	class SESSION{

        
	// 	public static function sessionStart($user){
      //       // session_start();
      //      return $_SESSION["user"] = serialize($user);
      // }
      public static function sessionDestroy(){
            session_destroy();
      }
      public static function sessionAdmin(){
            return $_SESSION["admin"] = 1;
      }
      public static function addFlash($categ, $msg){
            $_SESSION[$categ] = $msg;
      }
      public static function addViews($id, $msg){
            $_SESSION["views"][$id] = $msg;
      }
      public static function getFlash($categ){
            if(isset($_SESSION[$categ])){
                $msg = $_SESSION[$categ];  
                unset($_SESSION[$categ]);
            }
            else $msg = "";
            
            return $msg;
        }
 

	}
