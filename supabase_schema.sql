-- ============================================================
-- BluParrot Attendance Dashboard — Supabase Schema
-- Run this in your Supabase SQL Editor (dashboard.supabase.com)
-- ============================================================

-- 1. Employees table
create table if not exists employees (
  id          text primary key,           -- e.g. "e1701234567890"
  name        text not null,
  role        text not null default '',
  dept        text not null default '',
  created_at  timestamptz default now()
);

-- 2. Attendance records table
create table if not exists attendance_records (
  id          bigserial primary key,
  emp_id      text not null references employees(id) on delete cascade,
  date        date not null,              -- ISO date "2025-05-07"
  status      text check (status in ('present','absent','wfh','leave')),
  clock_in    text,                       -- "HH:MM"
  clock_out   text,                       -- "HH:MM"
  updated_at  timestamptz default now(),
  unique (emp_id, date)                   -- one record per employee per day
);

-- 3. Indexes for fast lookups
create index if not exists idx_attendance_emp_date on attendance_records(emp_id, date);
create index if not exists idx_attendance_date     on attendance_records(date);

-- 4. Row Level Security (RLS) — keep it open for a private/internal tool
--    If you add auth later, tighten these policies.
alter table employees          enable row level security;
alter table attendance_records enable row level security;

-- Allow all operations (suitable for internal dashboards without user login)
create policy "allow_all_employees"          on employees          for all using (true) with check (true);
create policy "allow_all_attendance_records" on attendance_records for all using (true) with check (true);
