DROP TABLE appointments;
DROP TABLE users;
DROP TABLE prices;
DROP TABLE patients;
DROP TABLE dentists;

CREATE TABLE users(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , role varchar(200) not null
    , name varchar(200) not null
    , login varchar(20) not null
    , passwordHash BIGINT not null
);
INSERT INTO users VALUES
(default, 'ADMIN', 'Administrator', 'admin', 1509442);
INSERT INTO users VALUES
(default, 'SECRETÁRIA', 'Dolores Abernathy', 'dolores', 1509442);

CREATE TABLE dentists(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , dentist_cro varchar(5) not null
    , dentist_cro_state varchar(2) not null
    , dentist_cpf varchar(11) not null
    , dentist_name varchar(200) not null
    , dentist_phone varchar(11) not null
    , dentist_state varchar(2) not null
    , dentist_city varchar(100) not null
    , dentist_address varchar(25) not null
    , dentist_street varchar(450) not null
    , dentist_zipcode varchar(8) not null
);

CREATE TABLE patients(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , patient_cpf varchar(11) not null
    , patient_name varchar(200) not null
    , patient_phone varchar(11) not null
    , patient_blood_type varchar(3) not null
    , patient_state varchar(2) not null
    , patient_city varchar(100) not null
    , patient_address varchar(25) not null
    , patient_street varchar(450) not null
    , patient_zipcode varchar(8) not null
);

CREATE TABLE prices(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , timestamp TIMESTAMP not null
    , new_price DOUBLE PRECISION not null
);

CREATE TABLE appointments(
    id BIGINT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1)
    , dentist_name varchar(200) not null
    , patient_name varchar(200) not null
    , procedure_name varchar(50) not null
    , procedure_description varchar(500) not null
    , timestamp TIMESTAMP not null
    , new_price DOUBLE PRECISION not null
    , constraint dentist_fk Foreign Key (id) references dentists (id)
    , constraint patient_fk Foreign Key (id) references patients (id)
    , constraint prices_fk Foreign Key (id) references prices (id)
);
