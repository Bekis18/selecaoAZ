PGDMP                         x            leilao     11.7 (Ubuntu 11.7-2.pgdg18.04+1)     11.7 (Ubuntu 11.7-2.pgdg18.04+1) 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16558    leilao    DATABASE     x   CREATE DATABASE leilao WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE leilao;
             postgres    false            �            1259    16562 
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
       public         postgres    false            }          0    16562 
   tb_empresa 
   TABLE DATA               �   COPY public.tb_empresa (id, razao_social, logradouro, municipio, numero, complemento, bairro, cep, telefone, email, site, senha, created_at, updated_at, cnpj, usuario) FROM stdin;
    public       postgres    false    197   �       �
           2606    16585    tb_empresa tb_empresa_cnpj_uk 
   CONSTRAINT     X   ALTER TABLE ONLY public.tb_empresa
    ADD CONSTRAINT tb_empresa_cnpj_uk UNIQUE (cnpj);
 G   ALTER TABLE ONLY public.tb_empresa DROP CONSTRAINT tb_empresa_cnpj_uk;
       public         postgres    false    197                       2606    16587    tb_empresa tb_empresa_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.tb_empresa
    ADD CONSTRAINT tb_empresa_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tb_empresa DROP CONSTRAINT tb_empresa_pk;
       public         postgres    false    197                       2606    16589     tb_empresa tb_empresa_usuario_uk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_empresa
    ADD CONSTRAINT tb_empresa_usuario_uk UNIQUE (usuario);
 J   ALTER TABLE ONLY public.tb_empresa DROP CONSTRAINT tb_empresa_usuario_uk;
       public         postgres    false    197            }   0  x����r�0���S��H�`�Խ$�d����02(�Z@A}�>LW�u���c��0f,~�s�ǹ���*��1m����Y����Fe�˥��<=L|T��2C���M)Tq��r��b�&�`���	Ɠ�9!q��e�A���-��8�]�K�V���i�gUIՈi(�ܥ�f���OO�0!8�D!g>%��p���i�*a��o�ߎ�K'����6�8��kݴ�ȍ�A��K?��3[��L4.V�Ya V����
������Rw?����'�y��4�1	�q=�2�_���&�(�+�?�2�m��Ip^�Q#8���X��!��N6��\#{D�_h);�S�_��]����aX�4���a��\��a����ʵ��/�j�jT��9�~V��
�		&5�9��*��iu��[�n�1��G3m����v~4
d��l�q��2�ha������OMc���A����?��i�oΉ2� 7GW���lR��0�qH�����K�Ȑ`d��r{/���i�̺�5��7]%�	������BpG>�a����B�:���     