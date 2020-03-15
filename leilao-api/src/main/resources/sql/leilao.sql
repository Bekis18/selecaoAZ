PGDMP     9                    x            leilao     11.7 (Ubuntu 11.7-2.pgdg18.04+1)     11.7 (Ubuntu 11.7-2.pgdg18.04+1) %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         postgres    false            �            1259    16568 	   tb_leilao    TABLE     @  CREATE TABLE public.tb_leilao (
    id integer NOT NULL,
    codigo integer,
    descricao character varying(60) NOT NULL,
    vendedor integer NOT NULL,
    inicio_previsto timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
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
    public       postgres    false    196   �,       �          0    16562 
   tb_empresa 
   TABLE DATA               �   COPY public.tb_empresa (id, razao_social, logradouro, municipio, numero, complemento, bairro, cep, telefone, email, site, senha, created_at, updated_at, cnpj, usuario) FROM stdin;
    public       postgres    false    197   -       �          0    16568 	   tb_leilao 
   TABLE DATA               m   COPY public.tb_leilao (id, codigo, descricao, vendedor, inicio_previsto, created_at, updated_at) FROM stdin;
    public       postgres    false    198   \/       �          0    16571    tb_lote 
   TABLE DATA               �   COPY public.tb_lote (id, numero_lote, descricao, quantidade, valor_inicial, unidade, leilao, created_at, updated_at) FROM stdin;
    public       postgres    false    199   w0       �          0    16577 
   tb_unidade 
   TABLE DATA               F   COPY public.tb_unidade (id, nome, created_at, updated_at) FROM stdin;
    public       postgres    false    200   .2       �           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);
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
       public       postgres    false    199    2838    198            �   .   x�3�4�44�2QF�B�@(Se��!���SF\1z\\\ q�	�      �   0  x����r�0���S��H�`�Խ$�d����02(�Z@A}�>LW�u���c��0f,~�s�ǹ���*��1m����Y����Fe�˥��<=L|T��2C���M)Tq��r��b�&�`���	Ɠ�9!q��e�A���-��8�]�K�V���i�gUIՈi(�ܥ�f���OO�0!8�D!g>%��p���i�*a��o�ߎ�K'����6�8��kݴ�ȍ�A��K?��3[��L4.V�Ya V����
������Rw?����'�y��4�1	�q=�2�_���&�(�+�?�2�m��Ip^�Q#8���X��!��N6��\#{D�_h);�S�_��]����aX�4���a��\��a����ʵ��/�j�jT��9�~V��
�		&5�9��*��iu��[�n�1��G3m����v~4
d��l�q��2�ha������OMc���A����?��i�oΉ2� 7GW���lR��0�qH�����K�Ȑ`d��r{/���i�̺�5��7]%�	������BpG>�a����B�:���      �     x���[N�0E��UtE��$m���)L�F"���X
�)�����uj��\�An�y��H�)V��SL��s����PM\3U�S{anf(�9^��qL�5{�Ѐ�J���5���+l�ab�ޗ��Sz��9�r�d�Q�-kf�u5��4�����z���lq1�Y�3�@W�o��a�Ij�[������J=�+��Wަ�5{��+�-�?h����^p_�w��XJ���������JYG��{`Z%n����A�������n�(��      �   �  x���MN�0���S�E3���� �ъJ���D"��Q[���p1Ʀ�q�.PV~V��7~	��iW�_^֍T(ߺ���f��U���V��wR�B�R�XW8C�J�J�R�)M(P}/s�� ?j�d��������AsAà	:IupJ�|"7������3�Ԕ&�9{66	t���F>��L��~��Q�I�4a9r����6��1N�+I�T4�+d}�K����2����3�q�V�g�ٔ&���d�����yڮ��ȆH��ǇY�?�_�D��طL�f��ln؋c��Q����Rg�m�b�m�:n��~�l�m�~��~�]�wd/�t,qJaLx�W�o]]���?��`c��N6��+5A��1(1���Z�T�
.>�f&�?��:>�A9�ƎKS��&O�?m�F      �   (  x�u��J1���S�R&��n����Ņ"x��B���lW�o�d)b�
s�3���O����.��z&hke�h\4�5�K�`!��X�u����yz��z�{¯�P4"8I��ݵ_C>��z�oU�.�*NuM������oS�VK�{F�tU��]��1��4�ɟ��f9���2��2�"�c�*�k�M\��h���X����醿;�[�ˬ�,ߜ5މs�.����ao��E�$��9��qLc�{U�Ҁ��D�a�рd�}���f�j9�[84����<T�m!��*,{�     