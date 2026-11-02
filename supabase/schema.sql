-- Tablas para practico_2_persistencia
-- Las columnas usan los mismos nombres que los toMap()/fromMap() de los modelos.

create table if not exists public.clientes (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  telefono text not null default '',
  created_at timestamptz not null default now()
);

create table if not exists public.productos (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  precio numeric(12,2) not null default 0,
  imagen text not null default '',
  created_at timestamptz not null default now()
);

create table if not exists public.pedidos (
  id uuid primary key default gen_random_uuid(),
  "idCliente" uuid references public.clientes(id) on delete set null,
  "nombreCliente" text not null default '',
  items jsonb not null default '[]'::jsonb,  -- lista de ItemProducto
  imagen text not null default '',
  sena numeric(12,2) not null default 0,
  "fechaEntrega" timestamptz not null,
  "fechaEncargo" timestamptz not null default now(),
  "pagoRealizado" boolean not null default false,
  created_at timestamptz not null default now()
);

-- Seguridad: RLS activado con acceso abierto a la anon key (sin login).
-- Suficiente para un práctico; si después agregás login, restringilo.
alter table public.clientes  enable row level security;
alter table public.productos enable row level security;
alter table public.pedidos   enable row level security;

create policy "acceso_publico" on public.clientes  for all to anon, authenticated using (true) with check (true);
create policy "acceso_publico" on public.productos for all to anon, authenticated using (true) with check (true);
create policy "acceso_publico" on public.pedidos   for all to anon, authenticated using (true) with check (true);
