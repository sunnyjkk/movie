create table movie (
movieid       		integer     	NOT NULL,
mov_title			char(50)		null,
mov_year		 	integer         null,
mov_time			integer			null,
mov_lang			char(50)		not null,
mov_dt_rel			date			not null,
mov_rel_country		char(5)			not null,


constraint movieid_PK	PRIMARY KEY(movieid)
);

create table actor (
act_id       		integer     	NOT NULL,
act_frame			char(20)		not null,
act_iname		 	char(20)        not null,
act_gender			char(1)		    not null,
 
constraint act_id_PK	PRIMARY KEY(act_id)
);

create table director (
dir_id       		integer     	NOT NULL,
dir_frame			char(20)		not null,
dir_iname		 	char(20)        not null,
 
constraint dir_id_PK	PRIMARY KEY(dir_id)
);

create table reviewer (
rev_id       		integer     	NOT NULL,
rev_name			char(30)		not null,
 
constraint rev_id_PK	PRIMARY KEY(rev_id )
);
create table genres (
gen_id       		integer     	NOT NULL,
gen_title			char(20)		not null,
 
constraint gen_id_PK	PRIMARY KEY(gen_id)
);

create table movie_direction (
movieid       		integer     	NOT NULL,
dir_id			    integer 		not null,

constraint movie_direction_PK	PRIMARY KEY(movieid,dir_id), 
constraint movie_direction_FK_1	FOREIGN KEY(movieid)
								references movie(movieid),
constraint movie_direction_FK_2   FOREIGN KEY(dir_id)
								references director(dir_id)
);
create table movie_genres (
movieid       		integer     	NOT NULL,
gen_id			    integer 		not null,
constraint movie_genres_PK	PRIMARY KEY(movieid,gen_id),
constraint move_genres_FK_1	FOREIGN KEY(movieid)
							references movie(movieid),
constraint move_genres_FK_2   FOREIGN KEY(gen_id)
							references genres(gen_id)
);

create table movie_rating (
movieid       		integer     	NOT NULL,
rev_id			    integer 		not null,
rev_stars			integer 		not null, 
num_O_ratings		integer 		not null,

constraint movie_rating_PK	PRIMARY KEY(movieid,rev_id),
constraint move_rating_FK_1	FOREIGN KEY(movieid)
							references movie(movieid),
constraint move_rating_FK_2   FOREIGN KEY(rev_id)
							references reviewer(rev_id)
);
create table movie_cast (
act_id       		integer     	NOT NULL,
movieid			    integer 		not null,
movie_role				char(30) 		not null, 

constraint movie_cast_PK	PRIMARY KEY(movieid,act_id),
constraint movie_cast_FK_1	FOREIGN KEY(movieid)
							references movie(movieid),
constraint movie_cast_FK_2   FOREIGN KEY(act_id)
							references actor(act_id)
);



