

CREATE TABLE IF NOT EXISTS public.table_data (
  id bigserial NOT NULL,
  guid uuid NOT NULL DEFAULT uuid_in(md5(random()::text || now()::text)::cstring),
  "name" varchar(500) NOT NULL DEFAULT ''::character varying,
  short varchar(100) NOT NULL DEFAULT ''::character varying,
  caption varchar(500) NOT NULL DEFAULT ''::character varying,
  info_txt text NOT NULL DEFAULT ''::text,
  is_file_table bool NOT NULL DEFAULT false,
  is_ready bool NOT NULL DEFAULT true,
  CONSTRAINT tbld_guid_unique_key UNIQUE (guid),
  CONSTRAINT tbld_name_unique_key UNIQUE (name),
  CONSTRAINT tbld_pkey PRIMARY KEY (id),
  CONSTRAINT tbld_short_unique_key UNIQUE (short)
);

INSERT INTO public.table_data("name", short, caption, info_txt, is_file_table, is_ready)
SELECT tmp.name, tmp.short, tmp.caption, tmp.info_txt, tmp.is_file_table, tmp.is_ready
FROM 
(
  SELECT
    'table_data' AS name,
    'Описание таблиц БД' as caption,
    '' AS info_txt,
    'tbld' AS short,
    false AS is_file_table,
    true AS is_ready
) AS tmp
WHERE NOT EXISTS(SELECT 1 FROM table_data tbld WHERE tbld.name = tmp.name);
--

CREATE TABLE IF NOT EXISTS public.usr_acc (
  id bigserial NOT NULL,
  guid uuid NOT NULL DEFAULT uuid_in(md5(random()::text || now()::text)::cstring),
  date_creation timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_changes timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_deleted timestamp NULL,
  usr_acc_creation_id int8 NULL,
  usr_acc_changes_id int8 NULL,
  login varchar(500) NOT NULL,
  pass_acc varchar(200) NOT NULL,
  sys_role_json json NULL,
  date_blocked_utc timestamp NULL,
  CONSTRAINT u_guid_unique_key UNIQUE (guid),
  CONSTRAINT u_login_unique_key UNIQUE (login),
  CONSTRAINT u_pkey PRIMARY KEY (id),
  CONSTRAINT u_usr_acc_changes_id_fk FOREIGN KEY (usr_acc_changes_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT,
  CONSTRAINT u_usr_acc_creation_id_fk FOREIGN KEY (usr_acc_creation_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT
);

INSERT INTO public.table_data("name", short, caption, info_txt, is_file_table, is_ready)
SELECT tmp.name, tmp.short, tmp.caption, tmp.info_txt, tmp.is_file_table, tmp.is_ready
FROM 
(
  SELECT
    'usr_acc' AS name,
    'Пользователи' as caption,
    '' AS info_txt,
    'u' AS short,
    false AS is_file_table,
    true AS is_ready
) AS tmp
WHERE NOT EXISTS(SELECT 1 FROM table_data tbld WHERE tbld.name = tmp.name);
--

CREATE TABLE IF NOT EXISTS public.country (
  id bigserial NOT NULL,
  guid uuid NOT NULL DEFAULT uuid_in(md5(random()::text || now()::text)::cstring),
  "name" varchar(500) NOT NULL DEFAULT ''::character varying,
  date_creation timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_changes timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_deleted timestamp NULL,
  usr_acc_creation_id int8 NULL,
  usr_acc_changes_id int8 NULL,
  CONSTRAINT cnt_guid_unique_key UNIQUE (guid),
  CONSTRAINT cnt_pkey PRIMARY KEY (id),
  CONSTRAINT cnt_usr_acc_changes_id_fk FOREIGN KEY (usr_acc_changes_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT,
  CONSTRAINT cnt_usr_acc_creation_id_fk FOREIGN KEY (usr_acc_creation_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT
);

INSERT INTO public.table_data("name", short, caption, info_txt, is_file_table, is_ready)
SELECT tmp.name, tmp.short, tmp.caption, tmp.info_txt, tmp.is_file_table, tmp.is_ready
FROM 
(
  SELECT
    'country' AS name,
    'Страны' as caption,
    '' AS info_txt,
    'cnt' AS short,
    false AS is_file_table,
    true AS is_ready
) AS tmp
WHERE NOT EXISTS(SELECT 1 FROM table_data tbld WHERE tbld.name = tmp.name);
--

CREATE TABLE IF NOT EXISTS public.town (
  id bigserial NOT NULL,
  guid uuid NOT NULL DEFAULT uuid_in(md5(random()::text || now()::text)::cstring),
  "name" varchar(500) NOT NULL DEFAULT ''::character varying,
  date_creation timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_changes timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_deleted timestamp NULL,
  usr_acc_creation_id int8 NULL,
  usr_acc_changes_id int8 NULL,
  country_id int8 NOT NULL,
  time_zone_default varchar(500) NULL,
  CONSTRAINT twn_guid_unique_key UNIQUE (guid),
  CONSTRAINT twn_pkey PRIMARY KEY (id),
  CONSTRAINT twn_country_id_fk FOREIGN KEY (country_id) REFERENCES public.country(id) ON DELETE RESTRICT,
  CONSTRAINT twn_usr_acc_changes_id_fk FOREIGN KEY (usr_acc_changes_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT,
  CONSTRAINT twn_usr_acc_creation_id_fk FOREIGN KEY (usr_acc_creation_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT
);

INSERT INTO table_data("name", short, caption, info_txt, is_file_table, is_ready)
SELECT tmp.name, tmp.short, tmp.caption, tmp.info_txt, tmp.is_file_table, tmp.is_ready
FROM 
(
  SELECT
    'town' AS name,
    'Города' as caption,
    '' AS info_txt,
    'twn' AS short,
    false AS is_file_table,
    true AS is_ready
) AS tmp
WHERE NOT EXISTS(SELECT 1 FROM table_data tbld WHERE tbld.name = tmp.name);
--