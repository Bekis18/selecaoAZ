PGDMP         '                x            leilao     11.7 (Ubuntu 11.7-2.pgdg18.04+1)     11.7 (Ubuntu 11.7-2.pgdg18.04+1) %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16558    leilao    DATABASE     x   CREATE DATABASE leilao WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE leilao;
             postgres    false            �            1259    16609    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false            �            1259    16611 
   leilao_seq    SEQUENCE     s   CREATE SEQUENCE public.leilao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.leilao_seq;
       public       postgres    false            �            1259    16613    seq_comprador    SEQUENCE     v   CREATE SEQUENCE public.seq_comprador
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.seq_comprador;
       public       postgres    false            �            1259    16615    seq_empresa    SEQUENCE     t   CREATE SEQUENCE public.seq_empresa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.seq_empresa;
       public       postgres    false            �            1259    16617    seq_lote    SEQUENCE     q   CREATE SEQUENCE public.seq_lote
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.seq_lote;
       public       postgres    false            �            1259    16559    tb_comprador    TABLE     y   CREATE TABLE public.tb_comprador (
    empresa integer NOT NULL,
    leilao integer NOT NULL,
    id integer NOT NULL
);
     DROP TABLE public.tb_comprador;
       public         postgres    false            �            1259    16562 
   tb_empresa    TABLE     �  CREATE TABLE public.tb_empresa (
    id integer NOT NULL,
    razao_social character varying(64) NOT NULL,
    logradouro character varying(64),
    municipio character varying(64),
    numero character varying(10),
    complemento character varying(64),
    bairro character varying(64),
    cep character varying(16),
    telefone character varying(32),
    email character varying(254) NOT NULL,
    site character varying(254),
    senha character varying(128),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cnpj character varying(32) NOT NULL,
    usuario character varying(20) NOT NULL
);
    DROP TABLE public.tb_empresa;
       public         postgres    false            �            1259    16568 	   tb_leilao    TABLE     h  CREATE TABLE public.tb_leilao (
    id integer NOT NULL,
    codigo integer,
    descricao character varying(60) NOT NULL,
    vendedor integer NOT NULL,
    inicio_previsto timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    valor_total_lotes double precision
);
    DROP TABLE public.tb_leilao;
       public         postgres    false            �            1259    16571    tb_lote    TABLE     p  CREATE TABLE public.tb_lote (
    id integer NOT NULL,
    numero_lote integer,
    descricao character varying(60) NOT NULL,
    quantidade numeric NOT NULL,
    valor_inicial numeric,
    unidade character varying(128) NOT NULL,
    leilao integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.tb_lote;
       public         postgres    false            �            1259    16577 
   tb_unidade    TABLE     �   CREATE TABLE public.tb_unidade (
    id integer NOT NULL,
    nome character varying(128) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.tb_unidade;
       public         postgres    false            �          0    16559    tb_comprador 
   TABLE DATA               ;   COPY public.tb_comprador (empresa, leilao, id) FROM stdin;
    public       postgres    false    196   -       �          0    16562 
   tb_empresa 
   TABLE DATA               �   COPY public.tb_empresa (id, razao_social, logradouro, municipio, numero, complemento, bairro, cep, telefone, email, site, senha, created_at, updated_at, cnpj, usuario) FROM stdin;
    public       postgres    false    197   W-       �          0    16568 	   tb_leilao 
   TABLE DATA               �   COPY public.tb_leilao (id, codigo, descricao, vendedor, inicio_previsto, created_at, updated_at, valor_total_lotes) FROM stdin;
    public       postgres    false    198   /       �          0    16571    tb_lote 
   TABLE DATA               �   COPY public.tb_lote (id, numero_lote, descricao, quantidade, valor_inicial, unidade, leilao, created_at, updated_at) FROM stdin;
    public       postgres    false    199   .0       �          0    16577 
   tb_unidade 
   TABLE DATA               F   COPY public.tb_unidade (id, nome, created_at, updated_at) FROM stdin;
    public       postgres    false    200   �1       �           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 27, true);
            public       postgres    false    201            �           0    0 
   leilao_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.leilao_seq', 3, true);
            public       postgres    false    202            �           0    0    seq_comprador    SEQUENCE SET     <   SELECT pg_catalog.setval('public.seq_comprador', 20, true);
            public       postgres    false    203            �           0    0    seq_empresa    SEQUENCE SET     9   SELECT pg_catalog.setval('public.seq_empresa', 4, true);
            public       postgres    false    204            �           0    0    seq_lote    SEQUENCE SET     7   SELECT pg_catalog.setval('public.seq_lote', 1, false);
            public       postgres    false    205                       2606    16581    tb_leilao leilao_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.tb_leilao
    ADD CONSTRAINT leilao_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.tb_leilao DROP CONSTRAINT leilao_pk;
       public         postgres    false    198                       2606    16583    tb_comprador tb_comprador_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT tb_comprador_pk PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT tb_comprador_pk;
       public         postgres    false    196                       2606    16585    tb_empresa tb_empresa_cnpj_uk 
   CONSTRAINT     X   ALTER TABLE ONLY public.tb_empresa
    ADD CONSTRAINT tb_empresa_cnpj_uk UNIQUE (cnpj);
 G   ALTER TABLE ONLY public.tb_empresa DROP CONSTRAINT tb_empresa_cnpj_uk;
       public         postgres    false    197                       2606    16587    tb_empresa tb_empresa_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.tb_empresa
    ADD CONSTRAINT tb_empresa_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tb_empresa DROP CONSTRAINT tb_empresa_pk;
       public         postgres    false    197                       2606    16589     tb_empresa tb_empresa_usuario_uk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_empresa
    ADD CONSTRAINT tb_empresa_usuario_uk UNIQUE (usuario);
 J   ALTER TABLE ONLY public.tb_empresa DROP CONSTRAINT tb_empresa_usuario_uk;
       public         postgres    false    197                       2606    16591    tb_lote tb_lote_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.tb_lote
    ADD CONSTRAINT tb_lote_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tb_lote DROP CONSTRAINT tb_lote_pk;
       public         postgres    false    199                       2606    16593    tb_unidade tb_unidade_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.tb_unidade
    ADD CONSTRAINT tb_unidade_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tb_unidade DROP CONSTRAINT tb_unidade_pk;
       public         postgres    false    200                       2606    16624 (   tb_comprador fk1cc5h7lbvlhm9r7ru2msl4tn4    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT fk1cc5h7lbvlhm9r7ru2msl4tn4 FOREIGN KEY (empresa) REFERENCES public.tb_empresa(id);
 R   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT fk1cc5h7lbvlhm9r7ru2msl4tn4;
       public       postgres    false    197    2834    196                       2606    16629 (   tb_comprador fk1lso49p50cc2bio1uonmuhy6r    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT fk1lso49p50cc2bio1uonmuhy6r FOREIGN KEY (leilao) REFERENCES public.tb_leilao(id);
 R   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT fk1lso49p50cc2bio1uonmuhy6r;
       public       postgres    false    2838    198    196                        2606    16619 "   tb_lote fk7kvaeki6f078neo15wb61q24    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_lote
    ADD CONSTRAINT fk7kvaeki6f078neo15wb61q24 FOREIGN KEY (leilao) REFERENCES public.tb_leilao(id);
 L   ALTER TABLE ONLY public.tb_lote DROP CONSTRAINT fk7kvaeki6f078neo15wb61q24;
       public       postgres    false    198    2838    199                       2606    16594 $   tb_comprador tb_comprador_empresa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT tb_comprador_empresa_fk FOREIGN KEY (empresa) REFERENCES public.tb_empresa(id) NOT VALID;
 N   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT tb_comprador_empresa_fk;
       public       postgres    false    2834    197    196                       2606    16599 #   tb_comprador tb_comprador_leilao_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT tb_comprador_leilao_fk FOREIGN KEY (leilao) REFERENCES public.tb_leilao(id) NOT VALID;
 M   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT tb_comprador_leilao_fk;
       public       postgres    false    198    196    2838                       2606    16604    tb_lote tb_lote_leilao_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_lote
    ADD CONSTRAINT tb_lote_leilao_fk FOREIGN KEY (leilao) REFERENCES public.tb_leilao(id) NOT VALID;
 C   ALTER TABLE ONLY public.tb_lote DROP CONSTRAINT tb_lote_leilao_fk;
       public       postgres    false    199    2838    198            �   .   x�3�4�44�2QF�B�@(Se��!���SF\1z\\\ q�	�      �   �  x����n�0���S����U�Qۤ����e$�g�-`dC}����v^�6�(����|8:����ණ�����B��ls��7�B�Fo����k�z��>�[e��ʶ�F��bJ�pIȪFyNi����/��rw�l?}�, v�4��{�_G�c�[7`���㒉U-�<�@�*�<&����Z7c��>A1�V�Zo��[���{�'�%��Y	�8�I�!yL/_B� �1(vg��?ī�l]�M�u65�i��,Q�������	6a1��8����{tg����L�;;D�O�2�9ˑJF$MV5��4�g�Hct�=O�y,�8�9T�U��i{�ЋQaߟf��C�7Uz��I�26��b����V}U��h3���u�щ+�p�����$%��U��EJ���)>^A���      �     x���KN�0@דS�A3�_�3����@-T��.�Qz1�n�|T)��y�lFx����ʓ/?�'^�7?�/�
�",ɶ�-���İ��e�����C��q�=&^���?�n���j��䙨5������?��:��WS4E���vc��tz��Oզ"Z�-���1�f�s�ab� ŷ�m\Or�f�uifo��,����n��y�ڪ�4�5���QOn%'ݦ�eF�e�M���͟���F�e�&Y��_�bn��׿O�81�*;]��(�oUL��      �   �  x���MN�0���S�E3���� �ъJ���D"��Q[���p1Ʀ�q�.PV~V��7~	��iW�_^֍T(ߺ���f��U���V��wR�B�R�XW8C�J�J�R�)M(P}/s�� ?j�d��������AsAà	:IupJ�|"7������3�Ԕ&�9{66	t���F>��L��~��Q�I�4a9r����6��1N�+I�T4�+d}�K����2����3�q�V�g�ٔ&���d�����yڮ��ȆH��ǇY�?�_�D��طL�f��ln؋c��Q����Rg�m�b�m�:n��~�l�m�~��~�]�wd/�t,qJaLx�W�o]]���?��`c��N6��+5A��1(1���Z�T�
.>�f&�?��:>�A9�ƎKS��&O�?m�F      �   �   x�m��J�0�s�y�,3�I���
����楸��UܷwRD�R�ӟ��#ԾL��7�}|yVPʠ� ��_FP3�2x�Qݾ��r:N�i�M}u�C�k-�ܨ��s8t��m��
&ȼ�iNꮌ�Љú&l�����~q:�CT�X��|f8W,x��7K-�K�9��wo�����323V�͕�%�������"X��n�ia�2'-_Ҟ��yꦾ�U��UȜ!�Bg��+1m�;Fү����e�     