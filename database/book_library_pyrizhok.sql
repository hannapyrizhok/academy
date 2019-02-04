PGDMP     4    .                 w         
   after_dump    10.6    10.6      1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            4           1262    16504 
   after_dump    DATABASE     |   CREATE DATABASE after_dump WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE after_dump;
             postgres    false                        2615    16505 	   my_schema    SCHEMA        CREATE SCHEMA my_schema;
    DROP SCHEMA my_schema;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            5           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12964    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            6           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16506    author    TABLE     �   CREATE TABLE my_schema.author (
    name text NOT NULL,
    id bigint NOT NULL,
    citizenship text NOT NULL,
    birth_year date,
    death_year date
);
    DROP TABLE my_schema.author;
    	   my_schema         postgres    false    5            �            1259    24611    author_sequence    SEQUENCE     {   CREATE SEQUENCE my_schema.author_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE my_schema.author_sequence;
    	   my_schema       postgres    false    5    197            7           0    0    author_sequence    SEQUENCE OWNED BY     G   ALTER SEQUENCE my_schema.author_sequence OWNED BY my_schema.author.id;
         	   my_schema       postgres    false    201            �            1259    16512    book    TABLE     �   CREATE TABLE my_schema.book (
    id bigint NOT NULL,
    book_name text NOT NULL,
    genre text,
    pages bigint,
    author_id bigint,
    publisher_id bigint,
    date_of_receipt timestamp without time zone,
    year_of_publication integer
);
    DROP TABLE my_schema.book;
    	   my_schema         postgres    false    5            �            1259    24614    book_sequence    SEQUENCE     y   CREATE SEQUENCE my_schema.book_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE my_schema.book_sequence;
    	   my_schema       postgres    false    198    5            8           0    0    book_sequence    SEQUENCE OWNED BY     C   ALTER SEQUENCE my_schema.book_sequence OWNED BY my_schema.book.id;
         	   my_schema       postgres    false    202            �            1259    16518 	   publisher    TABLE     �   CREATE TABLE my_schema.publisher (
    id bigint NOT NULL,
    publisher_name text,
    address text,
    contact_person text
);
     DROP TABLE my_schema.publisher;
    	   my_schema         postgres    false    5            �            1259    24608    publisher_sequence    SEQUENCE     ~   CREATE SEQUENCE my_schema.publisher_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE my_schema.publisher_sequence;
    	   my_schema       postgres    false    5    199            9           0    0    publisher_sequence    SEQUENCE OWNED BY     M   ALTER SEQUENCE my_schema.publisher_sequence OWNED BY my_schema.publisher.id;
         	   my_schema       postgres    false    200            �
           2604    24613 	   author id    DEFAULT     n   ALTER TABLE ONLY my_schema.author ALTER COLUMN id SET DEFAULT nextval('my_schema.author_sequence'::regclass);
 ;   ALTER TABLE my_schema.author ALTER COLUMN id DROP DEFAULT;
    	   my_schema       postgres    false    201    197            �
           2604    24616    book id    DEFAULT     j   ALTER TABLE ONLY my_schema.book ALTER COLUMN id SET DEFAULT nextval('my_schema.book_sequence'::regclass);
 9   ALTER TABLE my_schema.book ALTER COLUMN id DROP DEFAULT;
    	   my_schema       postgres    false    202    198            �
           2604    24610    publisher id    DEFAULT     t   ALTER TABLE ONLY my_schema.publisher ALTER COLUMN id SET DEFAULT nextval('my_schema.publisher_sequence'::regclass);
 >   ALTER TABLE my_schema.publisher ALTER COLUMN id DROP DEFAULT;
    	   my_schema       postgres    false    200    199            )          0    16506    author 
   TABLE DATA               R   COPY my_schema.author (name, id, citizenship, birth_year, death_year) FROM stdin;
 	   my_schema       postgres    false    197   (        *          0    16512    book 
   TABLE DATA               }   COPY my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) FROM stdin;
 	   my_schema       postgres    false    198   #!       +          0    16518 	   publisher 
   TABLE DATA               S   COPY my_schema.publisher (id, publisher_name, address, contact_person) FROM stdin;
 	   my_schema       postgres    false    199   �#       :           0    0    author_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('my_schema.author_sequence', 8, true);
         	   my_schema       postgres    false    201            ;           0    0    book_sequence    SEQUENCE SET     ?   SELECT pg_catalog.setval('my_schema.book_sequence', 18, true);
         	   my_schema       postgres    false    202            <           0    0    publisher_sequence    SEQUENCE SET     C   SELECT pg_catalog.setval('my_schema.publisher_sequence', 8, true);
         	   my_schema       postgres    false    200            �
           2606    16525    author author_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY my_schema.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY my_schema.author DROP CONSTRAINT author_pkey;
    	   my_schema         postgres    false    197            �
           2606    16527    book book_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY my_schema.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY my_schema.book DROP CONSTRAINT book_pkey;
    	   my_schema         postgres    false    198            �
           2606    16529    publisher publisher_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY my_schema.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY my_schema.publisher DROP CONSTRAINT publisher_pkey;
    	   my_schema         postgres    false    199            �
           2606    16530    book fk_author_id    FK CONSTRAINT     y   ALTER TABLE ONLY my_schema.book
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES my_schema.author(id);
 >   ALTER TABLE ONLY my_schema.book DROP CONSTRAINT fk_author_id;
    	   my_schema       postgres    false    2729    198    197            �
           2606    16535    book fk_publisher_id    FK CONSTRAINT     �   ALTER TABLE ONLY my_schema.book
    ADD CONSTRAINT fk_publisher_id FOREIGN KEY (publisher_id) REFERENCES my_schema.publisher(id);
 A   ALTER TABLE ONLY my_schema.book DROP CONSTRAINT fk_publisher_id;
    	   my_schema       postgres    false    2733    198    199            )   �   x�e��j!���S�.���1-���)dIs��f%��5,���f{�i曏��F9z��_�O �5h��S0I���xø�ӎ���8�������*PS3�LH;��� [o�8��,�3H8���(�c_�6����G<�@�Ǝj�m��bks�sE&9��q*G�)A�a]��ĔXb�Ut[ѽ��qh����{��ݙ��[���-B��2�ba�{�/z.˫���78/�SE��T�      *   S  x��TKn�0]O�ԁ�/�]��I
�M��tC۴ň&����{����
߫#�MZ;q0D�3��<ΐ�P� |P�uJz:��έ�R��U�n��8��A
q��ATXF����=�E�e��ʅ�4O!Aót%����$�PIZ��ii㔙H�	�Z��}8����S���k�gtlmM-���H�wI3�Ν��I_0��Ji�mSI��]�F��\:YZH�5C{�nV��{���X���R��'�B�ң��$����C�=�b,�3;
Q�C\ڱ��*'���z4������[��Kb�Qߞ0�#!�ar%�lp����{�[�<;���z�)B��I������
�b�Dڏr�e�kejJ�����ٶ�HͰ�w�s!�]:�Je��s9��Öa���e�эrb��ɍ����.׋�z��Z��n�GW�oХ}Uמ��h=�R����t�̴c.�Li�-ﭫ��p(���@��|��G%�Q�	e15v�N*�e=yPT�E���5��b�k��ޛ�{\i��Ţ��r��v���VB���� ���$l;+���u�� ��J���Kr�m�����	!�f�\�      +   	  x�M�=N1���)|���?�
�(	�O)hf{m��n�t��Qp��P g��/ �4����޼5ȯ�4f��T�p{�"
����[�u�w�O�l#�p�=*+ :��#ۀ��ㅆ�ު&��׽�V�'��g��<a:�m�Z�n鑯nV��A��N���gZrzI⍞�a��;J�Z50�ԧ��JY�yV`73�YՉ���-�ѮiK�v ������/�|\{[?c�)8H~�|��m�41"(�J�R֚��c_Du{}     