#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id_user  Int NOT NULL AUTO_INCREMENT,
        pseudo   Varchar (20) NOT NULL ,
        password Varchar (50) NOT NULL 
	,CONSTRAINT user_PK PRIMARY KEY (id_user)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: sujet
#------------------------------------------------------------

CREATE TABLE sujet(
        id_sujet Int NOT NULL AUTO_INCREMENT,
        user_id  Int NOT NULL ,
        titre    Varchar (11) NOT NULL
	,CONSTRAINT sujet_PK PRIMARY KEY (id_sujet)
        ,CONSTRAINT sujet_user0_FK FOREIGN KEY (user_id) REFERENCES user(id_user)
)ENGINE=InnoDB;




#------------------------------------------------------------
# Table: message
#------------------------------------------------------------

CREATE TABLE message(
        id_message Int NOT NULL AUTO_INCREMENT,
        user_id    Int NOT NULL ,
        sujet_id   Int NOT NULL ,
        content    Varchar (500) NOT NULL ,
        id_sujet   Int NOT NULL ,
        id_user    Int NOT NULL
	,CONSTRAINT message_PK PRIMARY KEY (id_message)

	,CONSTRAINT message_sujet_FK FOREIGN KEY (id_sujet) REFERENCES sujet(id_sujet)
	,CONSTRAINT message_user0_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
)ENGINE=InnoDB;

