<?php
	namespace App;
	
	class SESSION{

        
		public static function sessionStart($user){
            session_start();
           return $_SESSION["user"] = $user;
		}
 

	}
