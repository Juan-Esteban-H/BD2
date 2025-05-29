create table usuarios (
  id bigint primary key generated always as identity,
  nombre text not null,
  email text unique not null,
  contrasena text not null,
  rol text not null check (rol in ('admin', 'usuario')),
  creado_en timestamptz default now()
);

create table partidas_arancelarias (
  id bigint primary key generated always as identity,
  codigo text unique not null,
  descripcion text not null,
  tasa_arancelaria numeric(5, 2) not null
);

create table importaciones (
  id bigint primary key generated always as identity,
  partida_id bigint references partidas_arancelarias (id),
  usuario_id bigint references usuarios (id),
  fecha_importacion timestamptz default now(),
  cantidad numeric not null,
  valor numeric not null
);

create table historial_consultas (
  id bigint primary key generated always as identity,
  usuario_id bigint references usuarios (id),
  consulta text not null,
  fecha_consulta timestamptz default now()
);