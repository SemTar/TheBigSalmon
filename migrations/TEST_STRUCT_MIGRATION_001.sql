

CREATE TABLE IF NOT EXISTS public.type_sub (
  id bigserial NOT NULL,
  guid uuid NOT NULL DEFAULT uuid_in(md5(random()::text || now()::text)::cstring),
  "name" varchar(500) NOT NULL DEFAULT ''::character varying,
  num_sub int8 NOT NULL,
  max_num_sub int8 NOT NULL,
  validity int8 NOT NULL,
  date_creation timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_changes timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_deleted timestamp NULL,
  usr_acc_creation_id int8 NULL,
  usr_acc_changes_id int8 NULL,
  CONSTRAINT tpsb_guid_unique_key UNIQUE (guid),
  CONSTRAINT tpsb_pkey PRIMARY KEY (id),
  CONSTRAINT tpsb_num_sub_positive CHECK (num_sub >= 0),
  CONSTRAINT tpsb_max_num_sub_positive CHECK (max_num_sub > 0),
  CONSTRAINT tpsb_validity_positive CHECK (validity > 0),
  CONSTRAINT tpsb_usr_acc_changes_id_fk FOREIGN KEY (usr_acc_changes_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT,
  CONSTRAINT tpsb_usr_acc_creation_id_fk FOREIGN KEY (usr_acc_creation_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT
);

INSERT INTO public.table_data("name", short, caption, info_txt, is_file_table, is_ready)
SELECT tmp.name, tmp.short, tmp.caption, tmp.info_txt, tmp.is_file_table, tmp.is_ready
FROM
(
  SELECT
    'type_sub' AS name,
    'Типы подписок' as caption,
    '' AS info_txt,
    'tpsb' AS short,
    false AS is_file_table,
    true AS is_ready
) AS tmp
WHERE NOT EXISTS(SELECT 1 FROM table_data tbld WHERE tbld.name = tmp.name);
--

CREATE TABLE IF NOT EXISTS public.subscription (
  id bigserial NOT NULL,
  guid uuid NOT NULL DEFAULT uuid_in(md5(random()::text || now()::text)::cstring),
  unique_num varchar(100) NOT NULL DEFAULT ''::character varying,
  usr_id int8 NULL,
  type_id int8 NULL,
  date_creation timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_changes timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
  date_deleted timestamp NULL,
  usr_acc_creation_id int8 NULL,
  usr_acc_changes_id int8 NULL,
  CONSTRAINT sb_guid_unique_key UNIQUE (guid),
  CONSTRAINT sb_pkey PRIMARY KEY (id),
  CONSTRAINT sb_unique_num_sample CHECK (unique_num SIMILAR TO '[A-Z]\d{4}'),
  CONSTRAINT sb_usr_id_fk FOREIGN KEY (usr_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT,
  CONSTRAINT sb_type_id_fk FOREIGN KEY (type_id) REFERENCES public.type_sub(id) ON DELETE RESTRICT,
  CONSTRAINT sb_usr_acc_changes_id_fk FOREIGN KEY (usr_acc_changes_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT,
  CONSTRAINT sb_usr_acc_creation_id_fk FOREIGN KEY (usr_acc_creation_id) REFERENCES public.usr_acc(id) ON DELETE RESTRICT
);

INSERT INTO public.table_data("name", short, caption, info_txt, is_file_table, is_ready)
SELECT tmp.name, tmp.short, tmp.caption, tmp.info_txt, tmp.is_file_table, tmp.is_ready
FROM
(
  SELECT
    'subscription' AS name,
    'Подписки' as caption,
    '' AS info_txt,
    'sb' AS short,
    false AS is_file_table,
    true AS is_ready
) AS tmp
WHERE NOT EXISTS(SELECT 1 FROM table_data tbld WHERE tbld.name = tmp.name);
--