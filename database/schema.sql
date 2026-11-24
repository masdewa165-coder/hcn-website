-- Draft schema for Supabase/PostgreSQL. Review permissions before production.
create extension if not exists pgcrypto;

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  phone text,
  role text not null default 'public'
    check (role in ('super_admin','central_admin','regional_admin','officer','partner','umkm','public')),
  region_id uuid,
  created_at timestamptz not null default now()
);

create table public.regions (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  code text unique,
  parent_id uuid references public.regions(id),
  status text not null default 'planned'
    check (status in ('planned','active','inactive')),
  public_contact text,
  created_at timestamptz not null default now()
);

alter table public.profiles add constraint profiles_region_fk
  foreign key (region_id) references public.regions(id);

create table public.businesses (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid references public.profiles(id),
  business_name text not null,
  business_type text,
  address text,
  city text,
  province text,
  contact_phone text,
  created_at timestamptz not null default now()
);

create table public.service_requests (
  id uuid primary key default gen_random_uuid(),
  registration_code text unique not null,
  applicant_id uuid references public.profiles(id),
  business_id uuid references public.businesses(id),
  service_type text not null,
  description text,
  status text not null default 'submitted'
    check (status in ('submitted','administrative_review','assigned','in_process','needs_revision','completed','rejected','cancelled')),
  assigned_to uuid references public.profiles(id),
  authority_partner text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.partners (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid references public.profiles(id),
  organization_name text not null,
  partner_type text,
  region_id uuid references public.regions(id),
  verification_status text not null default 'pending'
    check (verification_status in ('pending','verified','rejected')),
  created_at timestamptz not null default now()
);

create table public.posts (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  slug text unique not null,
  excerpt text,
  body text,
  category text,
  status text not null default 'draft' check (status in ('draft','published','archived')),
  author_id uuid references public.profiles(id),
  published_at timestamptz,
  created_at timestamptz not null default now()
);

create table public.programs (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  start_at timestamptz,
  end_at timestamptz,
  location text,
  registration_url text,
  status text not null default 'draft' check (status in ('draft','open','closed','completed')),
  created_at timestamptz not null default now()
);

create table public.documents (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  category text,
  storage_path text not null,
  visibility text not null default 'public' check (visibility in ('public','authenticated','internal')),
  uploaded_by uuid references public.profiles(id),
  created_at timestamptz not null default now()
);

-- IMPORTANT: Enable RLS on all tables and write explicit policies before production.
alter table public.profiles enable row level security;
alter table public.regions enable row level security;
alter table public.businesses enable row level security;
alter table public.service_requests enable row level security;
alter table public.partners enable row level security;
alter table public.posts enable row level security;
alter table public.programs enable row level security;
alter table public.documents enable row level security;
