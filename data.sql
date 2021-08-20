CREATE DATABASE IF NOT EXISTS webofertas;
USE webofertas;

CREATE TABLE personal(
DNI varchar(9) primary key,
nombre varchar(50),
apellidos varchar(255)
);

CREATE TABLE clientes(
email varchar(100) primary key,
DNI varchar(9),
nombre varchar(50),
apellidos varchar(255),
passwd enum('md5'),
direccion varchar(255)
);

CREATE TABLE estancias(
id_estancia int auto_increment primary key,
nombre varchar(100),
direcion varchar(255)
);

CREATE TABLE habitaciones_casas(
id_hab int auto_increment primary key,
tipo_hab varchar(100)
);

CREATE TABLE casas(
id_estancia int auto_increment primary key,
num_casas int,
num_camas_ind int,
num_camas_dobl int,
id_hab int,
foreign key(id_hab)references habitaciones_casas(id_hab)
);

CREATE TABLE habitaciones_hoteles(
id_hab int auto_increment primary key,
disponibilidad bool,
cama_ind int,
cama_dbl int);

CREATE TABLE hoteles(
id_estancia int auto_increment primary key,
id_hab int,
nombre varchar(100),
foreign key(id_hab)references habitaciones_hoteles(id_hab)
);

CREATE TABLE opiniones(
id_opinion int auto_increment primary key,
descripcion varchar(255),
email varchar(100),
id_estancia int,
foreign key(id_estancia)references estancias(id_estancia),
foreign key(email)references clientes(email)
);

CREATE TABLE pagos(
id_pagos int auto_increment primary key,
datos_paypal varchar(255),
datos_card varchar(255),
email varchar(100),
foreign key(email) references clientes(email)
);


CREATE TABLE IF NOT EXISTS ofertas(
id_oferta int auto_increment primary key,
titulo varchar(100),
imagen MEDIUMBLOB,
precio float,
descripcion text,
fecha_caducidad date,
hay_vuelo bool,
id_pago int,
dni_personal varchar(9),
id_estancia int,
foreign key(id_pago) references pagos(id_pagos),
foreign key(dni_personal) references personal(DNI),
foreign key(id_estancia) references estancias(id_estancia)
);

