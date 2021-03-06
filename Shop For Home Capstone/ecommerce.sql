PGDMP     +    6                z         
   ecommerce2    9.6.24    9.6.24 )    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    24679 
   ecommerce2    DATABASE     ?   CREATE DATABASE ecommerce2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE ecommerce2;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            ?           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    24743    cart    TABLE     :   CREATE TABLE public.cart (
    user_id bigint NOT NULL
);
    DROP TABLE public.cart;
       public         postgres    false    3            ?            1259    24748    discount    TABLE     \   CREATE TABLE public.discount (
    id character varying(255) NOT NULL,
    status bigint
);
    DROP TABLE public.discount;
       public         postgres    false    3            ?            1259    24805    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false    3            ?            1259    24753 
   order_main    TABLE     ?  CREATE TABLE public.order_main (
    order_id bigint NOT NULL,
    buyer_address character varying(255),
    buyer_email character varying(255),
    buyer_name character varying(255),
    buyer_phone character varying(255),
    create_time timestamp without time zone,
    order_amount numeric(19,2) NOT NULL,
    order_status integer DEFAULT 0 NOT NULL,
    update_time timestamp without time zone
);
    DROP TABLE public.order_main;
       public         postgres    false    3            ?            1259    24762    product_category    TABLE     ?   CREATE TABLE public.product_category (
    category_id integer NOT NULL,
    category_name character varying(255),
    category_type integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);
 $   DROP TABLE public.product_category;
       public         postgres    false    3            ?            1259    24778    product_in_order    TABLE     1  CREATE TABLE public.product_in_order (
    id bigint NOT NULL,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255) NOT NULL,
    product_icon character varying(255),
    product_id character varying(255),
    product_name character varying(255),
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_count_check CHECK ((count >= 1)),
    CONSTRAINT product_in_order_product_stock_check CHECK ((product_stock >= 0))
);
 $   DROP TABLE public.product_in_order;
       public         postgres    false    3            ?            1259    24767    product_info    TABLE     !  CREATE TABLE public.product_info (
    product_id character varying(255) NOT NULL,
    category_type integer DEFAULT 0,
    create_time timestamp without time zone,
    product_description character varying(255),
    product_icon character varying(255),
    product_name character varying(255) NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_status integer DEFAULT 0,
    product_stock integer NOT NULL,
    update_time timestamp without time zone,
    CONSTRAINT product_info_product_stock_check CHECK ((product_stock >= 0))
);
     DROP TABLE public.product_info;
       public         postgres    false    3            ?            1259    24788    users    TABLE     "  CREATE TABLE public.users (
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255),
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phone character varying(255),
    role character varying(255)
);
    DROP TABLE public.users;
       public         postgres    false    3            ?            1259    24796    wishlist    TABLE     ?   CREATE TABLE public.wishlist (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    product_id character varying(255),
    user_id bigint NOT NULL
);
    DROP TABLE public.wishlist;
       public         postgres    false    3            ?          0    24743    cart 
   TABLE DATA               '   COPY public.cart (user_id) FROM stdin;
    public       postgres    false    185   3       ?          0    24748    discount 
   TABLE DATA               .   COPY public.discount (id, status) FROM stdin;
    public       postgres    false    186   03       ?           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 37, true);
            public       postgres    false    193            ?          0    24753 
   order_main 
   TABLE DATA               ?   COPY public.order_main (order_id, buyer_address, buyer_email, buyer_name, buyer_phone, create_time, order_amount, order_status, update_time) FROM stdin;
    public       postgres    false    187   ]3       ?          0    24762    product_category 
   TABLE DATA               o   COPY public.product_category (category_id, category_name, category_type, create_time, update_time) FROM stdin;
    public       postgres    false    188   ?4       ?          0    24778    product_in_order 
   TABLE DATA               ?   COPY public.product_in_order (id, category_type, count, product_description, product_icon, product_id, product_name, product_price, product_stock, cart_user_id, order_id) FROM stdin;
    public       postgres    false    190   g5       ?          0    24767    product_info 
   TABLE DATA               ?   COPY public.product_info (product_id, category_type, create_time, product_description, product_icon, product_name, product_price, product_status, product_stock, update_time) FROM stdin;
    public       postgres    false    189   ?7       ?          0    24788    users 
   TABLE DATA               X   COPY public.users (id, active, address, email, name, password, phone, role) FROM stdin;
    public       postgres    false    191   ?=       ?          0    24796    wishlist 
   TABLE DATA               I   COPY public.wishlist (id, created_date, product_id, user_id) FROM stdin;
    public       postgres    false    192   L@       ?           2606    24747    cart cart_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (user_id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public         postgres    false    185    185            ?           2606    24752    discount discount_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.discount DROP CONSTRAINT discount_pkey;
       public         postgres    false    186    186            ?           2606    24761    order_main order_main_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.order_main
    ADD CONSTRAINT order_main_pkey PRIMARY KEY (order_id);
 D   ALTER TABLE ONLY public.order_main DROP CONSTRAINT order_main_pkey;
       public         postgres    false    187    187            ?           2606    24766 &   product_category product_category_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (category_id);
 P   ALTER TABLE ONLY public.product_category DROP CONSTRAINT product_category_pkey;
       public         postgres    false    188    188                       2606    24787 &   product_in_order product_in_order_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.product_in_order
    ADD CONSTRAINT product_in_order_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.product_in_order DROP CONSTRAINT product_in_order_pkey;
       public         postgres    false    190    190                       2606    24777    product_info product_info_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.product_info
    ADD CONSTRAINT product_info_pkey PRIMARY KEY (product_id);
 H   ALTER TABLE ONLY public.product_info DROP CONSTRAINT product_info_pkey;
       public         postgres    false    189    189                        2606    24802 -   product_category uk_6kq6iveuim6wd90cxo5bksumw 
   CONSTRAINT     q   ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type);
 W   ALTER TABLE ONLY public.product_category DROP CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw;
       public         postgres    false    188    188                       2606    24804 "   users uk_sx468g52bpetvlad2j9y0lptc 
   CONSTRAINT     ^   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email);
 L   ALTER TABLE ONLY public.users DROP CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc;
       public         postgres    false    191    191                       2606    24795    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    191    191            
           2606    24800    wishlist wishlist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public         postgres    false    192    192                       2606    24807     cart fkg5uhi8vpsuy0lgloxk2h4w5o6    FK CONSTRAINT        ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fkg5uhi8vpsuy0lgloxk2h4w5o6 FOREIGN KEY (user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.cart DROP CONSTRAINT fkg5uhi8vpsuy0lgloxk2h4w5o6;
       public       postgres    false    191    185    2056                       2606    24812 ,   product_in_order fkhnivo3fl2qtco3ulm4mq0mbr5    FK CONSTRAINT     ?   ALTER TABLE ONLY public.product_in_order
    ADD CONSTRAINT fkhnivo3fl2qtco3ulm4mq0mbr5 FOREIGN KEY (cart_user_id) REFERENCES public.cart(user_id);
 V   ALTER TABLE ONLY public.product_in_order DROP CONSTRAINT fkhnivo3fl2qtco3ulm4mq0mbr5;
       public       postgres    false    190    2040    185                       2606    24822 #   wishlist fkklfv8svemdde0od1rs6mgstb    FK CONSTRAINT     ?   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fkklfv8svemdde0od1rs6mgstb FOREIGN KEY (product_id) REFERENCES public.product_info(product_id);
 M   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fkklfv8svemdde0od1rs6mgstb;
       public       postgres    false    189    192    2050                       2606    24817 ,   product_in_order fkt0sfj3ffasrift1c4lv3ra85e    FK CONSTRAINT     ?   ALTER TABLE ONLY public.product_in_order
    ADD CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id) REFERENCES public.order_main(order_id);
 V   ALTER TABLE ONLY public.product_in_order DROP CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e;
       public       postgres    false    2044    187    190                       2606    24827 $   wishlist fktrd6335blsefl2gxpb8lr0gr7    FK CONSTRAINT     ?   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fktrd6335blsefl2gxpb8lr0gr7 FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fktrd6335blsefl2gxpb8lr0gr7;
       public       postgres    false    191    192    2056            ?      x?3???24?22?26?26?????? !??      ?      x???/p?/???u55?4?????? HA;      ?   l  x???;o! ?~}l4???i?.]?Ϋ?]N{gG??k'?%G?R	??4???e??խ?>?eXݡ??v??Ʌ t??]{?e???v<??:??=??y<?	9???\??m?ۄ??QU%?
C@tz?!??+???{`?r	??Iц+RS???*?w??C??j?jX)ą?'??jP?W,??\ V????%??
?g?I????1b?????y7?Zϝu??)j??UTS0?G???rE,?ٷǶT?<NS?f??ө!?ٵoc????\??I??^?B;<?(?)???6 ^0z????;{H?v?=}?b6?O?9? ??5`?l?\(?%=??s????~J&:?      ?   ~   x???=?0????+nr?$w!J7??[???%T-GZ??????`?އ???3???\???[??*`?,QgCG?Ľ??¯f??ܣ*ަ?kmyC?~?a????? ??=\r??L]r?[y?1tc=u      ?   y  x?Օ?N?0ǯ???$?????ʺ?VCBB&9i<;??V???v\?4.?&?????ˎP?Z??M;2???+??υb?? ?p??j?ԧ٬z??iO?T????nA?V????";rզ??n?3ˋ??װE?eFh;??l郤???i?/% ?? Q??o(?bÔ?M+??
>gI?;??b?????w?i\;Xk\Qo??I??????^??$h3?
?)????@???.?&??E,-,S??b????8^vB??GR??U?l*[??`?V????{?x1??}朜?'????Ć?f???a???g6O-,?<;ڑ??#????x)A??;^??,Z$?[p?^?Z?0w?k_L'?OvONL?>??R??8zͣ???,ͮ?+?8?_?{??û????gM?_?èp?ȦϢ????#?G??vQ?E?5???,??????/?8?⧩6]???8>??1T????iǦ?LpLymtm??x?-?uy?T_^r??\t?J???V??S]??jѡ?]k?{b???8B?8?F???=???h????^??3??
?ҢzZ????A??T?j??ߌ?3=J???/?????ϺnTz??i?N
???<I?"4L,?ª=bG)?moy???y??UD      ?   ?  x??V]o?H}v~?<?e??O??Zi???@C#U?&??g?=?=?K??;RP??J!J??s????{3?,[?4۲m??u?A?ӷ???kc???<??4?Њ?h?+&?3EW9-?[-???????IF~?܈xf???ieޘ!~????.???????ƿ?Z??g??aB6%A?r[	??EI??{?e*?X?[!?N?};4?^x??[??Q??Ig$?H??O	??ђ??|?f??,?>v?z???|b<|???b?1?U??ш?D0?kn?=??OA?O@??S?А?V?,E[??<?g????.???N?}Ke}UP??? ?3>?
?s
?
<?e??IN?? ???|?p`?st??hB???e0?:?pi??϶_?y?vWx?8?????x????b?:wj3ȇ????J??l3)?<?<&??	['?,:=?G?8?F???h^-p?V??L?}?ђ?i?E???.R???D<?(*z?2???"Յ4a]?9)??j=
??!?Si5/??rN
???P???h?F?d??Hϔ?????`?i????k??x?]?e?e??9{?)Z??????%?0??*4?5?Q@?f?f4?&??????B?e??=?????dtZU???o??z?????䊬cY?{???$?Ʒ},Z?ǁu????'?;'??XCR??4??0MI)?0?e,????	Ux?y??h?г?л?<?1if?z?pl?"Jޒ??9?IKi=?%e??Hy'?eQҌ?? A???o?,J??Fu??
U???O?1ڱ???l???Dϼ?8?}??#?"0?&$????25o?????}ܳm?3???u$???=???r0?&????????????Gm(9(q????Z4?????7X%`??z????H??2??P??U]?L?%?eH??tGo??Y?֕h??=????s]	h ?????[!V???7B??a?<?o*T%4]!??
??! ? d??K?꬞?? ?ۏ?9<fd>8? ??t@?P?E??H?-???(??? )?M?3l?R?=?1٣1]???Fl?^?Xf?B??w?????U??R????SM@?#?G?q???????`*XNZ	??,?>???-5d??????n{?/?q[?^?:J?/??i?X?x???`??z??p˅	???jg??͊?,n??í?MW1u??h???S?<5???D???F?eQ*uЂ?Z??'???Y?|9"չ?
??s.?i^???k????^?^????????}?3<+??O8? ??T]?pR?}???aB?r$?"?pP?Qr涼^M???\I??w?]?e??ۘ?B?۷@??uY??&?ؚ;iv?q?????ja??BEW?܃3??&ޭ???Ly??U???	??p???<?ٓs??$l+0<?݈????%???~h^M???dr5??\&?I?|B?N??[䕚3x??=???t??m^Ͽ?f\\\?8~@      ?   ?  x???[??@?g?<?[7ܯo?JT??XӤd??? 0?~??nm̶?д'??C????NՔr?4  t?A@/`I??p???$?????J:?X????
T??*A?U }?2?R戳?	?'<??S{U??F3q?k&?^?n3'?>?3k?K???H?X?.֯3?I&??????ʚ?ʂDm??????u??x3xI?4Q??N?JqMw?m?.????@?L?0QJJB? C??b\?ٌ????#?YJ?S?\?:D?v?xS?Bzn?kV{?;??D??????m??+??$+??s?2?X?ƫ?Ǚ?]???~???(E?J{W6wI3J?????????{w^}mO؇?X7lT0gJU???1?ޚ?瀾?4?rP?w_?@x????d Aw?+?o??|x*!?
?H.P?R?肕?)?y??U(,B&1vGi]?]u?U?pD???????|??{???&od??&S??Ր\?n?ۈ?y?cU??!m???^9S=????f??m{xQ?'????}?f?W?r&恃?o?m???J.??n:??V?s#????V????????X?.?????M4mt??vO?3w?ʊ???&f0t?q?$b?&[?7}??$??p?#W??y?R?O??3~ ?Sk?      ?   F   x?Mʱ?0?ڞ?????? ???%W???a6Ɔ????'v?/@????!
*??#??-?Ow?)?     