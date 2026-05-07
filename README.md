# BluParrot Attendance Dashboard — Supabase Edition

A real-time attendance tracker backed by [Supabase](https://supabase.com), hostable for free on **GitHub Pages**.

---

## 📁 File Structure

```
bluparrot-supabase/
├── index.html           ← Main dashboard (all UI + logic)
├── config.js            ← 🔑 Your Supabase credentials (edit this)
├── supabase_schema.sql  ← Run once in Supabase SQL Editor
└── README.md
```

---

## 🚀 Setup in 4 Steps

### Step 1 — Create a Supabase project
1. Go to [supabase.com](https://supabase.com) → **New project**
2. Choose a name, database password, and region

### Step 2 — Create the database tables
1. In your Supabase dashboard → **SQL Editor** → **New query**
2. Paste the contents of `supabase_schema.sql` and click **Run**
3. You should see `employees` and `attendance_records` tables in the Table Editor

### Step 3 — Add your credentials to `config.js`
1. In Supabase → **Settings → API**
2. Copy **Project URL** and **anon/public key**
3. Open `config.js` and paste them:

```js
const SUPABASE_URL      = "https://abcdefgh.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";
```

### Step 4 — Host on GitHub Pages
1. Push this folder to a GitHub repository
2. Go to **Settings → Pages → Source → Deploy from branch → main / root**
3. Your dashboard will be live at `https://yourusername.github.io/your-repo/`

---

## ✅ Features

| Feature | Details |
|---|---|
| **Real-time persistence** | All changes (status, clock in/out, employees) saved to Supabase instantly |
| **Offline fallback** | If Supabase is unreachable, falls back to localStorage |
| **Connection indicator** | Shows "Connected / DB error / Connecting…" in the sidebar |
| **Saving indicator** | Toast notification on every save/sync |
| **CSV import** | Upload employees.csv → synced to database |
| **XLSX export** | Daily, monthly, and per-employee Excel exports |
| **Month switching** | Loads records from DB when you switch months |

---

## ⚠️ Security Notes

- The `anon` key is safe to expose in a public repo — Supabase Row Level Security (RLS) controls what it can do
- The schema includes open RLS policies (allow all) — suitable for **internal / private team use**
- To restrict access, add Supabase Auth and update the RLS policies to `auth.uid() is not null`

---

## 🔄 Migrating existing localStorage data

If you previously used the localStorage version and want to migrate:
1. Open the old dashboard in your browser
2. Open DevTools → Console, run:
   ```js
   copy(localStorage.getItem('bp_emp'))
   ```
3. In the new dashboard, use **Import CSV** with your employee names, or use the Supabase Table Editor to insert rows directly

---

## 📞 Support

For issues with the Supabase integration, check the browser console for error messages. Common issues:
- `CORS error` → Double-check your Project URL in config.js
- `401 Unauthorized` → Double-check your anon key in config.js
- `relation does not exist` → Run `supabase_schema.sql` in the SQL Editor
