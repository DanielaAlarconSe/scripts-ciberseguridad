-- CREACIÓN CURSO

--CREATE TABLE principal.curso (
    cur_codigo SERIAL PRIMARY KEY,
    cur_nombre varchar(200),
    per_codigo int NOT NULL,
    cur_descripcion varchar(250),
    cur_fecha_registro DATE DEFAULT CURRENT_DATE ,
    cur_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT curso_FK_persona FOREIGN KEY (per_codigo) REFERENCES persona(per_codigo)
);

-- ESTUDIANTE
--CREATE TABLE principal.estudiante (
    est_codigo SERIAL PRIMARY KEY,
    est_nombre_completo varchar(500),
    ust_codigo int NOT NULL,
    est_fecha_registro DATE DEFAULT CURRENT_DATE ,
    est_estado int DEFAULT 1 NOT null,
    CONSTRAINT estudiante_FK_usuario_tipo FOREIGN KEY (ust_codigo) REFERENCES usuario_tipo(ust_codigo)
);

--CREACION CUESTIONARIO

--CREATE TABLE principal.cuestionario (
    cue_codigo SERIAL PRIMARY KEY,
    cue_nombre varchar(200),
    cue_instrucciones varchar(250),
    cur_codigo int NOT NULL,
    cue_fecha_inicio date,
    cue_fecha_fin date,
    cue_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT cuestionario_FK_curso FOREIGN KEY (cur_codigo) REFERENCES curso(cur_codigo)
);

--RESPUESTA TIPO
--CREATE TABLE principal.respuesta_tipo (
    ret_codigo SERIAL PRIMARY KEY,
    ret_nombre varchar(250),
    ret_estado int DEFAULT 1 NOT NULL
);

-- RESPUESTA OPCION
--CREATE TABLE principal.respuesta_opcion (
    reo_codigo SERIAL PRIMARY KEY,
    reo_nombre varchar(250),
    cue_codigo int not null,
    reo_estado int DEFAULT 1 NOT null,
    CONSTRAINT respuesta_opcion_FK_cuestionario FOREIGN KEY (cue_codigo) REFERENCES cuestionario(cue_codigo)
);

-- PREGUNTA
--CREATE TABLE principal.pregunta (
    pre_codigo SERIAL PRIMARY KEY,
    pre_identificador int null,
    pre_nombre varchar(200),
    cue_codigo int not null,
    ret_codigo int not null,
    pre_texto_adicional varchar(100),
    pre_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT pregunta_FK_cuestionario FOREIGN KEY (cue_codigo) REFERENCES cuestionario(cue_codigo),
    CONSTRAINT pregunta_FK_respuesta_tipo FOREIGN KEY (ret_codigo) REFERENCES respuesta_tipo(ret_codigo)
);

-- PREGUNTA RESPUESTA
--CREATE TABLE principal.pregunta_respuesta (
    prr_codigo SERIAL PRIMARY KEY,
    pre_codigo int not null,
    reo_codigo int not null,
    ret_codigo int not null,
    pre_estado int DEFAULT 1 NOT NULL,
    CONSTRAINT pregunta_respuesta_FK_pregunta FOREIGN KEY (pre_codigo) REFERENCES pregunta(pre_codigo),
    CONSTRAINT pregunta_respuesta_FK_respuesta_opcion FOREIGN KEY (reo_codigo) REFERENCES respuesta_opcion(reo_codigo),
    CONSTRAINT pregunta_respuesta_FK_respuesta_tipo FOREIGN KEY (ret_codigo) REFERENCES respuesta_tipo(ret_codigo)
);

-- RESPUESTA CUESTIONARIO
--CREATE TABLE principal.respuesta_cuestionario (
    rec_codigo SERIAL PRIMARY KEY,
    est_codigo int not null,
    cue_codigo int not null,
    rec_fecha_registro DATE DEFAULT CURRENT_DATE,
    CONSTRAINT respuesta_cuestionario_FK_estudiante FOREIGN KEY (est_codigo) REFERENCES estudiante(est_codigo),
    CONSTRAINT respuesta_cuestionario_FK_cuestionario FOREIGN KEY (cue_codigo) REFERENCES cuestionario(cue_codigo)
);

-- RESPUESTA
--CREATE TABLE principal.respuesta (
    res_codigo SERIAL PRIMARY KEY,
    rec_codigo int not null, 
    prr_codigo int not null, 
    pre_codigo int not null,
    res_fecha_registro DATE DEFAULT CURRENT_DATE,
    res_texto varchar(500),
    CONSTRAINT respuesta_FK_respuesta_cuestionario FOREIGN KEY (rec_codigo) REFERENCES respuesta_cuestionario(rec_codigo),
    CONSTRAINT respuesta_FK_pregunta_respuesta FOREIGN KEY (prr_codigo) REFERENCES pregunta_respuesta(prr_codigo),
    CONSTRAINT respuesta_FK_pregunta FOREIGN KEY (pre_codigo) REFERENCES pregunta(pre_codigo)
);
