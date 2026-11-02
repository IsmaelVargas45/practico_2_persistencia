-- Tablas para practico_2_persistencia
-- Las columnas usan los mismos nombres que los toMap()/fromMap() de los modelos.

-- CLIENTES
create table if not exists clientes (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  telefono text not null default ''
);

-- PRODUCTOS
create table if not exists productos (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  precio numeric(12,2) not null default 0,
  imagen text not null default ''
);

-- PEDIDOS
create table if not exists pedidos (
  id uuid primary key default gen_random_uuid(),
  "idCliente" uuid references clientes(id) on delete set null,
  "nombreCliente" text not null default '',
  imagen text not null default '',
  sena numeric(12,2) not null default 0,
  "fechaEntrega" timestamptz not null,
  "fechaEncargo" timestamptz not null default now(),
  "pagoRealizado" boolean not null default false
);

-- ÍTEMS DE CADA PEDIDO (un pedido tiene muchos ítems)
create table if not exists pedido_items (
  id uuid primary key default gen_random_uuid(),
  "idPedido" uuid not null references pedidos(id) on delete cascade,
  "idProducto" uuid references productos(id) on delete set null,
  "nombreProducto" text not null,
  "precioUnitario" numeric(12,2) not null,
  cantidad int not null default 1 check (cantidad > 0)
);

-- Seguridad: RLS activado con acceso abierto a la anon key (sin login).
-- Suficiente para un práctico; si después agregás login, restringilo.
alter table public.clientes     enable row level security;
alter table public.productos    enable row level security;
alter table public.pedidos      enable row level security;
alter table public.pedido_items enable row level security;

drop policy if exists "acceso_publico" on public.clientes;
drop policy if exists "acceso_publico" on public.productos;
drop policy if exists "acceso_publico" on public.pedidos;
drop policy if exists "acceso_publico" on public.pedido_items;

create policy "acceso_publico" on public.clientes     for all to anon, authenticated using (true) with check (true);
create policy "acceso_publico" on public.productos    for all to anon, authenticated using (true) with check (true);
create policy "acceso_publico" on public.pedidos      for all to anon, authenticated using (true) with check (true);
create policy "acceso_publico" on public.pedido_items for all to anon, authenticated using (true) with check (true);