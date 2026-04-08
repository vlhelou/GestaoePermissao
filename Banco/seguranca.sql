--
-- PostgreSQL database dump
--

\restrict Ib7iPGn6yvf7TbqT1d5LCYa4WF0VrlI57mYfl8ItpebIftM0tKtLvoZTpZ10ZcU

-- Dumped from database version 18.2 (Debian 18.2-1.pgdg13+1)
-- Dumped by pg_dump version 18.2 (Debian 18.2-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: seguranca; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA seguranca;


ALTER SCHEMA seguranca OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: menu; Type: TABLE; Schema: seguranca; Owner: postgres
--

CREATE TABLE seguranca.menu (
    id bigint NOT NULL,
    id_pai bigint,
    nome character varying(100) NOT NULL,
    ativo boolean NOT NULL,
    id_referencia uuid NOT NULL,
    url character varying(500),
    usa_url_ancestral boolean NOT NULL,
    publico boolean NOT NULL,
    gera_log boolean NOT NULL,
    item_menu boolean NOT NULL,
    tags character varying(200),
    ajuda character varying,
    id_autor bigint NOT NULL,
    data_alteracao timestamp with time zone NOT NULL
);


ALTER TABLE seguranca.menu OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: seguranca; Owner: postgres
--

CREATE SEQUENCE seguranca.menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE seguranca.menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: seguranca; Owner: postgres
--

ALTER SEQUENCE seguranca.menu_id_seq OWNED BY seguranca.menu.id;


--
-- Name: menu_permissao; Type: TABLE; Schema: seguranca; Owner: postgres
--

CREATE TABLE seguranca.menu_permissao (
    id bigint CONSTRAINT menupermissao_id_not_null NOT NULL,
    id_menu bigint CONSTRAINT menupermissao_id_menu_not_null NOT NULL,
    id_usuario bigint,
    identificacao character varying(100),
    id_autor bigint CONSTRAINT menupermissao_id_autor_not_null NOT NULL,
    data_alteracao timestamp with time zone CONSTRAINT menupermissao_data_alteracao_not_null NOT NULL
);


ALTER TABLE seguranca.menu_permissao OWNER TO postgres;

--
-- Name: menupermissao_id_seq; Type: SEQUENCE; Schema: seguranca; Owner: postgres
--

CREATE SEQUENCE seguranca.menupermissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE seguranca.menupermissao_id_seq OWNER TO postgres;

--
-- Name: menupermissao_id_seq; Type: SEQUENCE OWNED BY; Schema: seguranca; Owner: postgres
--

ALTER SEQUENCE seguranca.menupermissao_id_seq OWNED BY seguranca.menu_permissao.id;


--
-- Name: usuario; Type: TABLE; Schema: seguranca; Owner: postgres
--

CREATE TABLE seguranca.usuario (
    id bigint NOT NULL,
    identificacao character varying(100) NOT NULL,
    ativo boolean NOT NULL,
    senha bit varying(800) NOT NULL,
    email character varying(200),
    trocasenha boolean NOT NULL,
    administrador boolean NOT NULL,
    id_autor bigint NOT NULL,
    data_alteracao timestamp with time zone NOT NULL
);


ALTER TABLE seguranca.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: seguranca; Owner: postgres
--

CREATE SEQUENCE seguranca.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE seguranca.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: seguranca; Owner: postgres
--

ALTER SEQUENCE seguranca.usuario_id_seq OWNED BY seguranca.usuario.id;


--
-- Name: menu id; Type: DEFAULT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.menu ALTER COLUMN id SET DEFAULT nextval('seguranca.menu_id_seq'::regclass);


--
-- Name: menu_permissao id; Type: DEFAULT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.menu_permissao ALTER COLUMN id SET DEFAULT nextval('seguranca.menupermissao_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.usuario ALTER COLUMN id SET DEFAULT nextval('seguranca.usuario_id_seq'::regclass);


--
-- Name: menu_permissao menupermissao_pk; Type: CONSTRAINT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.menu_permissao
    ADD CONSTRAINT menupermissao_pk PRIMARY KEY (id);


--
-- Name: menu newtable_pk; Type: CONSTRAINT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.menu
    ADD CONSTRAINT newtable_pk PRIMARY KEY (id);


--
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- Name: menu fk_menu_autor; Type: FK CONSTRAINT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.menu
    ADD CONSTRAINT fk_menu_autor FOREIGN KEY (id_autor) REFERENCES seguranca.usuario(id);


--
-- Name: menu_permissao fk_menu_permissao_autor; Type: FK CONSTRAINT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.menu_permissao
    ADD CONSTRAINT fk_menu_permissao_autor FOREIGN KEY (id_autor) REFERENCES seguranca.usuario(id);


--
-- Name: menu_permissao fk_menu_permissao_usuario; Type: FK CONSTRAINT; Schema: seguranca; Owner: postgres
--

ALTER TABLE ONLY seguranca.menu_permissao
    ADD CONSTRAINT fk_menu_permissao_usuario FOREIGN KEY (id_usuario) REFERENCES seguranca.usuario(id);


--
-- PostgreSQL database dump complete
--

\unrestrict Ib7iPGn6yvf7TbqT1d5LCYa4WF0VrlI57mYfl8ItpebIftM0tKtLvoZTpZ10ZcU

