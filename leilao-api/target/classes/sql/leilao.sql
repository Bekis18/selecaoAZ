PGDMP                         x            leilao     11.7 (Ubuntu 11.7-2.pgdg18.04+1)     11.7 (Ubuntu 11.7-2.pgdg18.04+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16558    leilao    DATABASE     x   CREATE DATABASE leilao WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE leilao;
             postgres    false            �            1259    16559    tb_comprador    TABLE     y   CREATE TABLE public.tb_comprador (
    empresa integer NOT NULL,
    leilao integer NOT NULL,
    id integer NOT NULL
);
     DROP TABLE public.tb_comprador;
       public         postgres    false            �          0    16559    tb_comprador 
   TABLE DATA               ;   COPY public.tb_comprador (empresa, leilao, id) FROM stdin;
    public       postgres    false    196   �       	           2606    16583    tb_comprador tb_comprador_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT tb_comprador_pk PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT tb_comprador_pk;
       public         postgres    false    196                       2606    16624 (   tb_comprador fk1cc5h7lbvlhm9r7ru2msl4tn4    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT fk1cc5h7lbvlhm9r7ru2msl4tn4 FOREIGN KEY (empresa) REFERENCES public.tb_empresa(id);
 R   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT fk1cc5h7lbvlhm9r7ru2msl4tn4;
       public       postgres    false    196                       2606    16629 (   tb_comprador fk1lso49p50cc2bio1uonmuhy6r    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT fk1lso49p50cc2bio1uonmuhy6r FOREIGN KEY (leilao) REFERENCES public.tb_leilao(id);
 R   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT fk1lso49p50cc2bio1uonmuhy6r;
       public       postgres    false    196            
           2606    16594 $   tb_comprador tb_comprador_empresa_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT tb_comprador_empresa_fk FOREIGN KEY (empresa) REFERENCES public.tb_empresa(id) NOT VALID;
 N   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT tb_comprador_empresa_fk;
       public       postgres    false    196                       2606    16599 #   tb_comprador tb_comprador_leilao_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comprador
    ADD CONSTRAINT tb_comprador_leilao_fk FOREIGN KEY (leilao) REFERENCES public.tb_leilao(id) NOT VALID;
 M   ALTER TABLE ONLY public.tb_comprador DROP CONSTRAINT tb_comprador_leilao_fk;
       public       postgres    false    196            �   .   x�3�4�44�2QF�B�@(Se��!���SF\1z\\\ q�	�     