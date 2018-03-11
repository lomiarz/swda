CREATE TABLE atrybut (
    id integer NOT NULL,
    tabela character varying(100) NOT NULL,
    kolumna character varying(100) NOT NULL,
    nazwa character varying(200) NOT NULL,
    typ character varying(50) NOT NULL,
    walidator character varying(200),
    slownik_kod character varying(10),
    grid character varying(1) NOT NULL,
    filtr character varying(1) NOT NULL,
    ukryty character varying(1) NOT NULL,
    dlugosc integer,
    walidator_opis character varying(200),
    wymagane character varying(1) NOT NULL,
    skrot character varying(100),
    kolejnosc integer,
    wartosc_domyslna character varying(255),
    format character varying(50),
    CONSTRAINT atrybut_grid_check CHECK (((grid)::text = ANY (ARRAY[('T'::character varying)::text, ('F'::character varying)::text]))),
    CONSTRAINT atrybut_grid_check1 CHECK (((grid)::text = ANY (ARRAY[('T'::character varying)::text, ('F'::character varying)::text])))
);


ALTER TABLE public.atrybut OWNER TO postgres;

--
-- TOC entry 166 (class 1259 OID 18986)
-- Dependencies: 6 165
-- Name: atrybut_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atrybut_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atrybut_id_seq OWNER TO postgres;

--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 166
-- Name: atrybut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atrybut_id_seq OWNED BY atrybut.id;


--
-- TOC entry 167 (class 1259 OID 18988)
-- Dependencies: 6
-- Name: dual; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dual (
);


ALTER TABLE public.dual OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 18991)
-- Dependencies: 2754 2755 2756 6 1303
-- Name: dzialki_ewid; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dzialki_ewid (
    gid integer NOT NULL,
    pow_egib character varying(80),
    obreb_nazw character varying(80),
    pow_go double precision,
    pow_peg numeric(11,0),
    idewid character varying(80),
    dz_ew character varying(80),
    arkusz character varying(80),
    obreb character varying(13),
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 2180))
);


ALTER TABLE public.dzialki_ewid OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 19000)
-- Dependencies: 6 168
-- Name: dzialki_ewid_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dzialki_ewid_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dzialki_ewid_gid_seq OWNER TO postgres;

--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 169
-- Name: dzialki_ewid_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dzialki_ewid_gid_seq OWNED BY dzialki_ewid.gid;


--
-- TOC entry 170 (class 1259 OID 19002)
-- Dependencies: 2758 2759 2760 1303 6
-- Name: dzialki_kat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dzialki_kat (
    gid integer NOT NULL,
    pow_egib character varying(80),
    obreb_nazw character varying(80),
    pow_go double precision,
    idewid character varying(80),
    dz_ew character varying(80),
    arkusz character varying(80),
    obreb character varying(13),
    geom geometry,
    pow_peg numeric(11,0),
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(geom) = 'POLYGON'::text) OR (geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(geom) = 2180))
);


ALTER TABLE public.dzialki_kat OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 19011)
-- Dependencies: 6 170
-- Name: dzialki_kat_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dzialki_kat_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dzialki_kat_gid_seq OWNER TO postgres;

--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 171
-- Name: dzialki_kat_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dzialki_kat_gid_seq OWNED BY dzialki_kat.gid;


--
-- TOC entry 164 (class 1259 OID 17215)
-- Dependencies: 2956 6
-- Name: geography_columns; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW geography_columns AS
    SELECT current_database() AS f_table_catalog, n.nspname AS f_table_schema, c.relname AS f_table_name, a.attname AS f_geography_column, geography_typmod_dims(a.atttypmod) AS coord_dimension, geography_typmod_srid(a.atttypmod) AS srid, geography_typmod_type(a.atttypmod) AS type FROM pg_class c, pg_attribute a, pg_type t, pg_namespace n WHERE ((((((t.typname = 'geography'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND (NOT pg_is_other_temp_schema(c.relnamespace)));


ALTER TABLE public.geography_columns OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 163 (class 1259 OID 16755)
-- Dependencies: 6
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    type character varying(30) NOT NULL
);


ALTER TABLE public.geometry_columns OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 19013)
-- Dependencies: 2761 2762 2764 2765 2766 2767 2768 2769 2770 2771 2772 1303 1303 1303 6
-- Name: przeds; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE przeds (
    id integer NOT NULL,
    nr_kanc character varying(50),
    nr_rdos character varying(50),
    data date,
    nr_dz character varying(1000),
    obr_ewid character varying(1000),
    msc_lok character varying(1000),
    nzw character varying(1000),
    rodz_dok integer,
    sps_uzg integer,
    sps_roz integer,
    sps_wzn integer,
    uwg character varying(200),
    dok integer,
    dok_nazwa character varying(256),
    typ_geom integer,
    uzyt_wst character varying(30),
    data_wst timestamp without time zone,
    uzyt_uak character varying(30),
    data_uak timestamp without time zone,
    arch character varying(1) DEFAULT 'F'::character varying,
    mc integer DEFAULT 0,
    punkt geometry,
    linia geometry,
    wielobok geometry,
    pow character varying(50),
    CONSTRAINT enforce_dims_linia CHECK ((st_ndims(linia) = 2)),
    CONSTRAINT enforce_dims_punkt CHECK ((st_ndims(punkt) = 2)),
    CONSTRAINT enforce_dims_wielobok CHECK ((st_ndims(wielobok) = 2)),
    CONSTRAINT enforce_geotype_linia CHECK (((geometrytype(linia) = 'MULTILINESTRING'::text) OR (linia IS NULL))),
    CONSTRAINT enforce_geotype_punkt CHECK (((geometrytype(punkt) = 'MULTIPOINT'::text) OR (punkt IS NULL))),
    CONSTRAINT enforce_geotype_wielobok CHECK (((geometrytype(wielobok) = 'MULTIPOLYGON'::text) OR (wielobok IS NULL))),
    CONSTRAINT enforce_srid_linia CHECK ((st_srid(linia) = 2180)),
    CONSTRAINT enforce_srid_punkt CHECK ((st_srid(punkt) = 2180)),
    CONSTRAINT enforce_srid_wielobok CHECK ((st_srid(wielobok) = 2180))
);


ALTER TABLE public.przeds OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 20224)
-- Dependencies: 2958 1303 1303 1303 6
-- Name: gosia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW gosia AS
    SELECT przeds.id, przeds.nr_kanc, przeds.nr_rdos, przeds.data, przeds.nr_dz, przeds.obr_ewid, przeds.msc_lok, przeds.nzw, przeds.rodz_dok, przeds.sps_uzg, przeds.sps_roz, przeds.sps_wzn, przeds.uwg, przeds.dok, przeds.dok_nazwa, przeds.typ_geom, przeds.uzyt_wst, przeds.data_wst, przeds.uzyt_uak, przeds.data_uak, przeds.arch, przeds.mc, przeds.punkt, przeds.linia, przeds.wielobok, przeds.pow FROM przeds WHERE ((przeds.rodz_dok = 107) AND (przeds.sps_uzg IS NULL));


ALTER TABLE public.gosia OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 19030)
-- Dependencies: 2774 1303 1303 1303 6 1303 1303 1303
-- Name: przeds_audyt; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE przeds_audyt (
    id integer NOT NULL,
    przeds_id integer,
    oper character varying(1),
    nr_kanc_old character varying(50),
    nr_kanc_new character varying(50),
    nr_rdos_old character varying(50),
    nr_rdos_new character varying(50),
    data_old date,
    data_new date,
    nr_dz_old character varying(1000),
    nr_dz_new character varying(1000),
    obr_ewid_old character varying(1000),
    obr_ewid_new character varying(1000),
    msc_lok_old character varying(1000),
    msc_lok_new character varying(1000),
    nzw_old character varying(1000),
    nzw_new character varying(1000),
    rodz_dok_old integer,
    rodz_dok_new integer,
    sps_uzg_old integer,
    sps_uzg_new integer,
    sps_roz_old integer,
    sps_roz_new integer,
    sps_wzn_old integer,
    sps_wzn_new integer,
    uwg_old character varying(200),
    uwg_new character varying(200),
    dok_old integer,
    dok_new integer,
    dok_nazwa_old character varying(256),
    dok_nazwa_new character varying(256),
    typ_geom_old integer,
    typ_geom_new integer,
    uzyt_wst_old character varying(30),
    uzyt_wst_new character varying(30),
    data_wst_old timestamp without time zone,
    data_wst_new timestamp without time zone,
    uzyt_uak_old character varying(30),
    uzyt_uak_new character varying(30),
    data_uak_old timestamp without time zone,
    data_uak_new timestamp without time zone,
    punkt_old geometry,
    punkt_new geometry,
    linia_old geometry,
    linia_new geometry,
    wielobok_old geometry,
    wielobok_new geometry,
    pow_old character varying(50),
    pow_new character varying(50),
    CONSTRAINT przeds_audyt_oper_check CHECK (((oper)::text = ANY (ARRAY[('I'::character varying)::text, ('U'::character varying)::text, ('D'::character varying)::text])))
);


ALTER TABLE public.przeds_audyt OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 19037)
-- Dependencies: 173 6
-- Name: przeds_audyt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE przeds_audyt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.przeds_audyt_id_seq OWNER TO postgres;

--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 174
-- Name: przeds_audyt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE przeds_audyt_id_seq OWNED BY przeds_audyt.id;


--
-- TOC entry 175 (class 1259 OID 19039)
-- Dependencies: 6 172
-- Name: przeds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE przeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.przeds_id_seq OWNER TO postgres;

--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 175
-- Name: przeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE przeds_id_seq OWNED BY przeds.id;


--
-- TOC entry 176 (class 1259 OID 19041)
-- Dependencies: 2775 2776 2778 2779 2780 2781 2782 2783 2784 2785 2786 1303 6 1303 1303
-- Name: przeds_temp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE przeds_temp (
    id integer NOT NULL,
    nr_kanc character varying(50),
    nr_rdos character varying(50),
    data date,
    nr_dz character varying(1000),
    obr_ewid character varying(1000),
    msc_lok character varying(1000),
    nzw character varying(1000),
    rodz_dok integer,
    sps_uzg integer,
    sps_roz integer,
    sps_wzn integer,
    uwg character varying(200),
    dok integer,
    dok_nazwa character varying(256),
    typ_geom integer,
    uzyt_wst character varying(30),
    data_wst timestamp without time zone,
    uzyt_uak character varying(30),
    data_uak timestamp without time zone,
    arch character varying(1) DEFAULT 'F'::character varying,
    mc integer DEFAULT 0,
    punkt geometry,
    linia geometry,
    wielobok geometry,
    pow character varying(50),
    CONSTRAINT enforce_dims_linia CHECK ((st_ndims(linia) = 2)),
    CONSTRAINT enforce_dims_punkt CHECK ((st_ndims(punkt) = 2)),
    CONSTRAINT enforce_dims_wielobok CHECK ((st_ndims(wielobok) = 2)),
    CONSTRAINT enforce_geotype_linia CHECK (((geometrytype(linia) = 'MULTILINESTRING'::text) OR (linia IS NULL))),
    CONSTRAINT enforce_geotype_punkt CHECK (((geometrytype(punkt) = 'MULTIPOINT'::text) OR (punkt IS NULL))),
    CONSTRAINT enforce_geotype_wielobok CHECK (((geometrytype(wielobok) = 'MULTIPOLYGON'::text) OR (wielobok IS NULL))),
    CONSTRAINT enforce_srid_linia CHECK ((st_srid(linia) = 2180)),
    CONSTRAINT enforce_srid_punkt CHECK ((st_srid(punkt) = 2180)),
    CONSTRAINT enforce_srid_wielobok CHECK ((st_srid(wielobok) = 2180))
);


ALTER TABLE public.przeds_temp OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 19058)
-- Dependencies: 176 6
-- Name: przeds_tmp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE przeds_tmp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.przeds_tmp_id_seq OWNER TO postgres;

--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 177
-- Name: przeds_tmp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE przeds_tmp_id_seq OWNED BY przeds_temp.id;


--
-- TOC entry 178 (class 1259 OID 19060)
-- Dependencies: 6
-- Name: rola; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rola (
    id integer NOT NULL,
    nazwa character varying(20)
);


ALTER TABLE public.rola OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 19063)
-- Dependencies: 6 178
-- Name: rola_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rola_id_seq OWNER TO postgres;

--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 179
-- Name: rola_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rola_id_seq OWNED BY rola.id;


--
-- TOC entry 180 (class 1259 OID 19065)
-- Dependencies: 6
-- Name: slownik; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE slownik (
    id integer NOT NULL,
    kod character varying(10),
    opis character varying(256)
);


ALTER TABLE public.slownik OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 19068)
-- Dependencies: 6
-- Name: slownik_wartosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE slownik_wartosc (
    id integer NOT NULL,
    slownik_kod character varying(10) NOT NULL,
    kontekst character varying(50),
    opis character varying(256) NOT NULL,
    komentarz character varying(2048),
    dodatkowe_dane character varying(200)
);


ALTER TABLE public.slownik_wartosc OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 19074)
-- Dependencies: 181 6
-- Name: slownik_wartosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE slownik_wartosc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slownik_wartosc_id_seq OWNER TO postgres;

--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 182
-- Name: slownik_wartosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE slownik_wartosc_id_seq OWNED BY slownik_wartosc.id;


--
-- TOC entry 162 (class 1259 OID 16747)
-- Dependencies: 6
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


ALTER TABLE public.spatial_ref_sys OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 19076)
-- Dependencies: 6
-- Name: uzytkownik; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE uzytkownik (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL,
    haslo character varying(100) NOT NULL,
    imie character varying(50) NOT NULL,
    nazwisko character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    skrot character varying(3) NOT NULL,
    rola character varying(20),
    wydzial character varying(100),
    oddzial character varying(100),
    instytucja character varying(100)
);


ALTER TABLE public.uzytkownik OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 19082)
-- Dependencies: 6 183
-- Name: uzytkownik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE uzytkownik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uzytkownik_id_seq OWNER TO postgres;

--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 184
-- Name: uzytkownik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE uzytkownik_id_seq OWNED BY uzytkownik.id;


--
-- TOC entry 185 (class 1259 OID 19084)
-- Dependencies: 6
-- Name: uzytkownik_konf; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE uzytkownik_konf (
    id integer NOT NULL,
    uzyt character varying(100) NOT NULL,
    klucz character varying(255) NOT NULL,
    wartosc character varying(1024) NOT NULL
);


ALTER TABLE public.uzytkownik_konf OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 19090)
-- Dependencies: 185 6
-- Name: uzytkownik_konf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE uzytkownik_konf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uzytkownik_konf_id_seq OWNER TO postgres;

--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 186
-- Name: uzytkownik_konf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE uzytkownik_konf_id_seq OWNED BY uzytkownik_konf.id;


--
-- TOC entry 187 (class 1259 OID 19092)
-- Dependencies: 2957 6
-- Name: v_dzialki_kat; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v_dzialki_kat AS
    SELECT dzialki_kat.gid, dzialki_kat.pow_egib, dzialki_kat.obreb_nazw, dzialki_kat.pow_go, dzialki_kat.pow_peg, dzialki_kat.idewid, dzialki_kat.dz_ew, dzialki_kat.arkusz, dzialki_kat.obreb, st_astext(st_centroid(dzialki_kat.geom)) AS geom FROM dzialki_kat;


ALTER TABLE public.v_dzialki_kat OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 19096)
-- Dependencies: 6
-- Name: w_dzialki; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE w_dzialki (
    gid bigint NOT NULL,
    geom character varying(255),
    gmina bigint,
    identyfika character varying(255),
    nr_dz character varying(255),
    powiat bigint,
    powierzchn numeric(19,2),
    wojew bigint
);


ALTER TABLE public.w_dzialki OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 19102)
-- Dependencies: 2791 2793 2794 2795 6
-- Name: warstwa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE warstwa (
    id integer NOT NULL,
    typ character varying(10) NOT NULL,
    url character varying(200),
    nazwa character varying(100) NOT NULL,
    etykieta character varying(100) NOT NULL,
    domyslna character varying(1) NOT NULL,
    bazowa character varying(1) NOT NULL,
    uzyt_nazwa character varying(30),
    wms_bufor integer,
    wms_kafelki character varying(1),
    wms_format character varying(100),
    wfs_geom_kol character(100),
    wfs_ns character varying(100),
    wfs_skala character varying(200),
    rola_nazwa character varying(20),
    wfs_kol_obr character varying(7),
    wfs_kol_wyp character varying(7),
    wfs_srs character varying(20),
    grupa character varying(20),
    wfs_przyc character varying(1),
    wlaczona character varying(1) DEFAULT 'T'::character varying NOT NULL,
    wfs_przez character varying(255),
    wfs_szer_lin character varying(255),
    kolejnosc integer,
    wfs_etyk_tekst character varying(255),
    wfs_etyk_czcio character varying(255),
    wfs_etyk_czcio_wiel integer,
    wfs_etyk_pol character varying(255),
    wfs_etyk_czcio_kol character varying(50),
    ars_server_resolutions character varying(255),
    ars_max_resolution character varying(255),
    ars_type character varying(10),
    CONSTRAINT warstwa_bazowa_check CHECK (((bazowa)::text = ANY (ARRAY[('T'::character varying)::text, ('F'::character varying)::text]))),
    CONSTRAINT warstwa_domyslna_check CHECK (((domyslna)::text = ANY (ARRAY[('T'::character varying)::text, ('F'::character varying)::text]))),
    CONSTRAINT warstwa_typ_check CHECK (((typ)::text = ANY (ARRAY['WFS'::text, 'WMS'::text, 'GOOGLE'::text, 'ARS'::text])))
);


ALTER TABLE public.warstwa OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 19112)
-- Dependencies: 6 189
-- Name: warstwa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE warstwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warstwa_id_seq OWNER TO postgres;

--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 190
-- Name: warstwa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE warstwa_id_seq OWNED BY warstwa.id;


--
-- TOC entry 191 (class 1259 OID 19114)
-- Dependencies: 6
-- Name: zalacznik; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zalacznik (
    id integer NOT NULL,
    plik bytea,
    typ character varying(100)
);


ALTER TABLE public.zalacznik OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 19120)
-- Dependencies: 191 6
-- Name: zalacznik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zalacznik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zalacznik_id_seq OWNER TO postgres;

--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 192
-- Name: zalacznik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zalacznik_id_seq OWNED BY zalacznik.id;


--
-- TOC entry 2750 (class 2604 OID 19122)
-- Dependencies: 166 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atrybut ALTER COLUMN id SET DEFAULT nextval('atrybut_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 19123)
-- Dependencies: 169 168
-- Name: gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dzialki_ewid ALTER COLUMN gid SET DEFAULT nextval('dzialki_ewid_gid_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 19124)
-- Dependencies: 171 170
-- Name: gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dzialki_kat ALTER COLUMN gid SET DEFAULT nextval('dzialki_kat_gid_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 19125)
-- Dependencies: 175 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY przeds ALTER COLUMN id SET DEFAULT nextval('przeds_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 19126)
-- Dependencies: 174 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY przeds_audyt ALTER COLUMN id SET DEFAULT nextval('przeds_audyt_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 19127)
-- Dependencies: 177 176
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY przeds_temp ALTER COLUMN id SET DEFAULT nextval('przeds_tmp_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 19128)
-- Dependencies: 179 178
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rola ALTER COLUMN id SET DEFAULT nextval('rola_id_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 19129)
-- Dependencies: 182 181
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY slownik_wartosc ALTER COLUMN id SET DEFAULT nextval('slownik_wartosc_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 19130)
-- Dependencies: 184 183
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uzytkownik ALTER COLUMN id SET DEFAULT nextval('uzytkownik_id_seq'::regclass);


--
-- TOC entry 2790 (class 2604 OID 19131)
-- Dependencies: 186 185
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uzytkownik_konf ALTER COLUMN id SET DEFAULT nextval('uzytkownik_konf_id_seq'::regclass);


--
-- TOC entry 2792 (class 2604 OID 19132)
-- Dependencies: 190 189
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY warstwa ALTER COLUMN id SET DEFAULT nextval('warstwa_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 19133)
-- Dependencies: 192 191
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zalacznik ALTER COLUMN id SET DEFAULT nextval('zalacznik_id_seq'::regclass);


--
-- TOC entry 2802 (class 2606 OID 19651)
-- Dependencies: 165 165 2960
-- Name: atrybut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY atrybut
    ADD CONSTRAINT atrybut_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 19653)
-- Dependencies: 165 165 165 2960
-- Name: atrybut_tabela_kolumna_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY atrybut
    ADD CONSTRAINT atrybut_tabela_kolumna_key UNIQUE (tabela, kolumna);


--
-- TOC entry 2806 (class 2606 OID 19655)
-- Dependencies: 168 168 2960
-- Name: dzialki_ewid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dzialki_ewid
    ADD CONSTRAINT dzialki_ewid_pkey PRIMARY KEY (gid);


--
-- TOC entry 2813 (class 2606 OID 19657)
-- Dependencies: 170 170 2960
-- Name: dzialki_kat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dzialki_kat
    ADD CONSTRAINT dzialki_kat_pkey PRIMARY KEY (gid);


--
-- TOC entry 2800 (class 2606 OID 16762)
-- Dependencies: 163 163 163 163 163 2960
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


--
-- TOC entry 2820 (class 2606 OID 19659)
-- Dependencies: 173 173 2960
-- Name: przeds_audyt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY przeds_audyt
    ADD CONSTRAINT przeds_audyt_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 19661)
-- Dependencies: 172 172 2960
-- Name: przeds_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY przeds
    ADD CONSTRAINT przeds_pk PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 19663)
-- Dependencies: 176 176 2960
-- Name: przeds_tmp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY przeds_temp
    ADD CONSTRAINT przeds_tmp_pk PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 19665)
-- Dependencies: 178 178 2960
-- Name: rola_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rola
    ADD CONSTRAINT rola_nazwa_key UNIQUE (nazwa);


--
-- TOC entry 2826 (class 2606 OID 19667)
-- Dependencies: 178 178 2960
-- Name: rola_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rola
    ADD CONSTRAINT rola_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 19669)
-- Dependencies: 180 180 2960
-- Name: slownik_kod_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slownik
    ADD CONSTRAINT slownik_kod_unique UNIQUE (kod);


--
-- TOC entry 2830 (class 2606 OID 19671)
-- Dependencies: 180 180 2960
-- Name: slownik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slownik
    ADD CONSTRAINT slownik_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 19673)
-- Dependencies: 181 181 2960
-- Name: slownik_wartosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY slownik_wartosc
    ADD CONSTRAINT slownik_wartosc_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 16754)
-- Dependencies: 162 162 2960
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- TOC entry 2834 (class 2606 OID 19675)
-- Dependencies: 183 183 2960
-- Name: uzytkownik_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uzytkownik
    ADD CONSTRAINT uzytkownik_id_pk PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 19677)
-- Dependencies: 185 185 2960
-- Name: uzytkownik_konf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uzytkownik_konf
    ADD CONSTRAINT uzytkownik_konf_pk PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 19679)
-- Dependencies: 185 185 185 2960
-- Name: uzytkownik_konf_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uzytkownik_konf
    ADD CONSTRAINT uzytkownik_konf_unique UNIQUE (uzyt, klucz);


--
-- TOC entry 2836 (class 2606 OID 19681)
-- Dependencies: 183 183 2960
-- Name: uzytkownik_nazwa_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uzytkownik
    ADD CONSTRAINT uzytkownik_nazwa_unique UNIQUE (nazwa);


--
-- TOC entry 2842 (class 2606 OID 19685)
-- Dependencies: 188 188 2960
-- Name: w_dzialki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY w_dzialki
    ADD CONSTRAINT w_dzialki_pkey PRIMARY KEY (gid);


--
-- TOC entry 2844 (class 2606 OID 19687)
-- Dependencies: 189 189 2960
-- Name: warstwa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY warstwa
    ADD CONSTRAINT warstwa_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 19689)
-- Dependencies: 191 191 2960
-- Name: zalacznik_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zalacznik
    ADD CONSTRAINT zalacznik_id_pk PRIMARY KEY (id);


--
-- TOC entry 2807 (class 1259 OID 19690)
-- Dependencies: 170 2960
-- Name: dz_kat_dz_ew_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dz_kat_dz_ew_idx ON dzialki_kat USING btree (dz_ew);


--
-- TOC entry 2808 (class 1259 OID 19691)
-- Dependencies: 170 170 2960
-- Name: dz_kat_dz_ew_lower_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dz_kat_dz_ew_lower_idx ON dzialki_kat USING btree (lower((dz_ew)::text));


--
-- TOC entry 2809 (class 1259 OID 19692)
-- Dependencies: 170 2960
-- Name: dz_kat_obreb_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dz_kat_obreb_idx ON dzialki_kat USING btree (obreb);


--
-- TOC entry 2810 (class 1259 OID 19716)
-- Dependencies: 170 170 2960
-- Name: dz_kat_obreb_lower_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dz_kat_obreb_lower_idx ON dzialki_kat USING btree (lower((obreb)::text));


--
-- TOC entry 2811 (class 1259 OID 19717)
-- Dependencies: 170 2285 2960
-- Name: dzialki_kat_geom_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dzialki_kat_geom_idx ON dzialki_kat USING gist (geom);


--
-- TOC entry 2816 (class 1259 OID 19718)
-- Dependencies: 2285 172 2960
-- Name: przeds_typ_geom_linia_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX przeds_typ_geom_linia_idx ON przeds USING gist (linia);


--
-- TOC entry 2817 (class 1259 OID 19719)
-- Dependencies: 172 2285 2960
-- Name: przeds_typ_geom_punkt_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX przeds_typ_geom_punkt_idx ON przeds USING gist (punkt);


--
-- TOC entry 2818 (class 1259 OID 19720)
-- Dependencies: 2285 172 2960
-- Name: przeds_typ_geom_wielobok_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX przeds_typ_geom_wielobok_idx ON przeds USING gist (wielobok);


--
-- TOC entry 2854 (class 2620 OID 19721)
-- Dependencies: 172 989 2960
-- Name: przeds_audyt_trg; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER przeds_audyt_trg BEFORE INSERT OR DELETE OR UPDATE ON przeds FOR EACH ROW EXECUTE PROCEDURE przeds_trg_fun();


--
-- TOC entry 2847 (class 2606 OID 19722)
-- Dependencies: 191 172 2845 2960
-- Name: przeds_dok_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY przeds
    ADD CONSTRAINT przeds_dok_fk FOREIGN KEY (dok) REFERENCES zalacznik(id);


--
-- TOC entry 2848 (class 2606 OID 19727)
-- Dependencies: 183 172 2835 2960
-- Name: przeds_uzyt_uak_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY przeds
    ADD CONSTRAINT przeds_uzyt_uak_fk FOREIGN KEY (uzyt_uak) REFERENCES uzytkownik(nazwa);


--
-- TOC entry 2849 (class 2606 OID 19732)
-- Dependencies: 183 172 2835 2960
-- Name: przeds_uzyt_wst_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY przeds
    ADD CONSTRAINT przeds_uzyt_wst_fk FOREIGN KEY (uzyt_wst) REFERENCES uzytkownik(nazwa);


--
-- TOC entry 2850 (class 2606 OID 19737)
-- Dependencies: 2827 181 180 2960
-- Name: slownik_w_slkod_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY slownik_wartosc
    ADD CONSTRAINT slownik_w_slkod_fk FOREIGN KEY (slownik_kod) REFERENCES slownik(kod);


--
-- TOC entry 2853 (class 2606 OID 19742)
-- Dependencies: 2835 189 183 2960
-- Name: uzyt_nazwa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY warstwa
    ADD CONSTRAINT uzyt_nazwa_fk FOREIGN KEY (uzyt_nazwa) REFERENCES uzytkownik(nazwa);


--
-- TOC entry 2852 (class 2606 OID 19747)
-- Dependencies: 185 2835 183 2960
-- Name: uzytkownik_konf_uzyt_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uzytkownik_konf
    ADD CONSTRAINT uzytkownik_konf_uzyt_fk FOREIGN KEY (uzyt) REFERENCES uzytkownik(nazwa);


--
-- TOC entry 2851 (class 2606 OID 19752)
-- Dependencies: 178 183 2823 2960
-- Name: uzytkownik_rola_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uzytkownik
    ADD CONSTRAINT uzytkownik_rola_fk FOREIGN KEY (rola) REFERENCES rola(nazwa);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-06-26 19:26:30

--
-- PostgreSQL database dump complete
--

