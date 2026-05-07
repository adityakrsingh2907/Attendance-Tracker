# 🐄 My Cow — Dairy Tracker

A simple, mobile-friendly dairy management dashboard to track daily milk sales, cow expenses, and monthly profit — all stored in a live database so data syncs across every device.

---

## Features

- **Dashboard** — view average daily milk yield, 30-day production chart, and monthly expense breakdown by category
- **Sales entries** — log daily milk sales with customer name, buyer, litres, rate per litre, and payment status (Received / Pending / Not Applicable)
- **Expense entries** — log all cow-related costs with category (Feed / Vet / Maintenance / Other) and an optional note
- **Monthly comparison** — side-by-side view of earnings vs expenses with profit/loss for each month
- **Filters** — filter sales by customer, buyer, and payment status; filter expenses by category
- **Sorting** — sort by amount in both sales and expense tables
- **Export to Excel** — download any month's sales or expense data as a `.csv` file that opens in Excel
- **Live database** — powered by Supabase; data is saved instantly and shared across all devices in real time

---

## How to Use

### Dashboard
Open the app and the Dashboard tab loads automatically. It shows:
- Average daily milk yield and total production over the last 30 days
- This month's total expenses and net profit or loss
- A line chart of milk production and a stacked bar chart of expenses by category

Use the **month selector** (top right) to switch the view to a different month.

---

### Adding a Sale Entry
1. Go to the **Sales entries** tab
2. Fill in:
   - **Date** — date of the sale
   - **Customer name** — who you sold to (autocompletes from past entries)
   - **Sold to** — shop or place name (optional)
   - **Milk sold** — quantity in litres
   - **Rate** — price per litre in ₹
   - **Payment status** — Received, Pending, or Not Applicable
3. Click **Add entry** — it saves to the database instantly

The table below shows all entries for the selected month with a summary of total milk sold, total sales, and received vs pending amounts.

---

### Adding an Expense Entry
1. Go to the **Expense entries** tab
2. Fill in:
   - **Date** — date the expense was made
   - **Category** — Feed, Vet / Medicine, Maintenance, or Other
   - **Amount** — cost in ₹
   - **Note** — optional description (e.g. "wheat bran 10kg")
3. Click **Add entry** — saved instantly

---

### Exporting Data
- In either the Sales or Expense tab, click **⬇ Export to Excel**
- A `.csv` file downloads for the selected month, including a summary section at the bottom
- Open it directly in Microsoft Excel or Google Sheets

---

### Removing an Entry
- Click the **Remove** button on any row
- A confirmation prompt appears before deletion
- Deletion is permanent and syncs across all devices

---

## Database Status Indicator

The top bar shows the live connection status:
- 🟢 **Connected** — database is reachable, all saves and loads are working
- 🔴 **Offline** — cannot reach the database; check your internet connection
- ⏳ **Connecting** — loading data on startup

---

## Tech Stack

| Part | Technology |
|---|---|
| Frontend | Plain HTML, CSS, JavaScript (no frameworks) |
| Charts | Chart.js |
| Database | Supabase (PostgreSQL) |
| Hosting | GitHub Pages |

---

## Database Tables

Two tables in Supabase:

**`sales`**
| Column | Type | Description |
|---|---|---|
| id | text | Unique entry ID |
| date | text | Sale date (YYYY-MM-DD) |
| cust | text | Customer name |
| sold_to | text | Buyer / shop name |
| milk_litres | numeric | Quantity sold in litres |
| rate | numeric | Rate per litre in ₹ |
| status | text | Received / Pending / Not Applicable |
| created_at | timestamptz | Auto timestamp |

**`expenses`**
| Column | Type | Description |
|---|---|---|
| id | text | Unique entry ID |
| date | text | Expense date (YYYY-MM-DD) |
| category | text | Feed / Vet / Maintenance / Other |
| amount | numeric | Amount in ₹ |
| note | text | Optional description |
| created_at | timestamptz | Auto timestamp |

---

## Hosting on GitHub Pages

1. Create a new **public** repository on GitHub
2. Upload `index.html` (renamed from `dairy_dashboard.html`)
3. Go to **Settings → Pages**
4. Set source to **Deploy from branch → main → / (root)**
5. Click **Save** — your site will be live in 1–2 minutes at:

```
https://your-username.github.io/repository-name/
```

---

## Built With

Made with the help of [Claude](https://claude.ai) by Anthropic.
