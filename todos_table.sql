-- テスト
create table
  public.todos (
    id uuid not null default gen_random_uuid (),
    created_at timestamp with time zone not null default timezone ('utc'::text, now()),
    title text null,
    is_complete boolean null default false,
    user_id uuid null default auth.uid (),
    constraint todos_pkey primary key (id),
    constraint todos_user_id_fkey foreign key (user_id) references auth.users (id)
  ) tablespace pg_default;

