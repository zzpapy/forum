<?php
	namespace App;
	
	class SESSION{

        
		public static function sessionStart($user){
            // session_start();
           return $_SESSION["user"] = serialize($user);
        }
        public static function sessionDestroy(){
            session_destroy();
		}
 

	}
