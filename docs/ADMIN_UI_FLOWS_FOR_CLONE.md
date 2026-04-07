# Admin web UI flows — replication guide for a cloned project

This document explains **how the Dashboard, customer-facing popups, Orders, invoices, status changes, invoice presentation, share actions, and Record payment** are built in **admin-web**, so you can mirror the same patterns in another repo.

**Primary stack:** Next.js App Router, React client components, shadcn-style `Dialog` / `Card` / `Button`, TanStack Query hooks for API calls, `sonner` toasts.

**Key files map**

| Area | Main file(s) |
|------|----------------|
| Dashboard | `apps/admin-web/app/(protected)/dashboard/page.tsx` |
| Orders list | `apps/admin-web/app/(protected)/orders/page.tsx` |
| Order detail (status, invoices, payment) | `apps/admin-web/app/(protected)/orders/[id]/page.tsx` |
| Invoice print layout (shared) | [`apps/admin-web/components/admin/customers/InvoicePrintView.tsx`](../apps/admin-web/components/admin/customers/InvoicePrintView.tsx) |
| ACK / Final **viewer** dialogs | [`AcknowledgementInvoiceDialog.tsx`](../apps/admin-web/components/admin/orders/AcknowledgementInvoiceDialog.tsx), [`FinalInvoiceDialog.tsx`](../apps/admin-web/components/admin/orders/FinalInvoiceDialog.tsx) |
| Invoice builder (draft / issue on order page) | [`InvoiceBuilder.tsx`](../apps/admin-web/components/forms/InvoiceBuilder.tsx) |
| Print / PDF / WhatsApp (shared hook) | [`useIssuedInvoiceShareActions.ts`](../apps/admin-web/hooks/useIssuedInvoiceShareActions.ts) |
| Customer profile → orders → invoice modal | [`CustomerOrdersTable.tsx`](../apps/admin-web/components/admin/customers/CustomerOrdersTable.tsx) |
| Branch / role helpers | [`lib/auth.ts`](../apps/admin-web/lib/auth.ts) (`isBranchScopedStaff`, `isBranchFilterLocked`) |
| PWA link in WhatsApp text | [`lib/customer-app-url.ts`](../apps/admin-web/lib/customer-app-url.ts) (`CUSTOMER_PWA_URL`) |

---

## 1. Dashboard

### Purpose

- Show **today’s** revenue KPIs and order counts for the selected branch (or all branches).
- For **branch-scoped** roles (e.g. OPS, AGENT), hide org-wide KPIs (“Active subscriptions”, “Total customers”) and show only branch-today cards.
- List orders in a **status-filtered**, **date-column** board; clicking a cell opens a **quick “Order details” dialog** (not full order page).

### UI structure

1. **Header:** Title + branch `<select>` or read-only `LockedBranchSelect` when the user’s branch is fixed.
2. **KPI row (grid):** Cards for **Collected (today)**, **Orders (today)**, **Invoices (today)**; optional **Active subscriptions** + **Total customers** when `!branchScoped`.
3. **Status chips:** Toggle filters — *Confirmed Orders*, *Picked up*, *Out for delivery*, *Delivered*. Counts are derived client-side from the same order list. Clicking an active chip again clears the filter.
4. **Order board:** Responsive grid of **day columns**. Each column = one date key; cells list order “cards” (customer name + time window pill). Subscription rows use a distinct background tint vs individual bookings. **Past pickup dates** for “Confirmed” can show a “Missed” treatment.
5. **Polling:** Analytics and orders refetch on an interval (e.g. 5s) for near-live dashboard.

### “Customer details” popup (Order details dialog)

- **Trigger:** `previewOrderId` state set when user clicks a row in the board (`setPreviewOrderId(row.id)`).
- **Component:** Radix/shadcn `Dialog` with `DialogContent className="max-w-md"`.
- **Data:** `useOrderSummary(previewOrderId)` loads full summary while open; skeleton → error → content.
- **Content blocks (typical):**
  - **Customer** name (semibold).
  - **Mobile** label + phone (`tabular-nums`).
  - **Address** (and pincode).
  - **Pickup** — highlighted time window pill + formatted pickup date (walk-in shows walk copy).
  - **Services** — list from `orderItems` or fallback lines from order service fields.
- **Footer:** **Close** + **Go to order page** (`Link` to `/orders/{id}`, closes dialog on navigate).

To replicate: keep this as a **lightweight read-only** dialog; full editing lives on `/orders/[id]`.

---

## 2. Orders list page

### Purpose

Paginated table of orders with **search**, **date range**, **branch**.

### UI structure

- **Search** input, **400ms debounced**, clears cursor on change. Placeholder explains: order id, customer name, or mobile. Sends `search` query param to API.
- **Date from / Date to** — optional; help text explains OR logic across initiated / pickup / delivered dates.
- **Branch** — native select; locked for branch-scoped users (same pattern as dashboard).
- **Table:** Columns typically include order id (shared `AdminOrderListOrderIdCell`), customer, status badges, money, dates. **Row click** → `router.push('/orders/' + id)`.
- **Load more** / cursor pagination using `nextCursor` from API.

### Removed vs older UIs

Status / pincode / service **dropdown filters** were removed from this page in favour of **search**; API may still accept legacy params for other callers.

---

## 3. Order detail page — layout and navigation

### Purpose

Single page for **everything** about one order: breadcrumbs, pickup banner, status timeline, payment summary, acknowledgement builder, final invoice builder, dialogs.

### Top area

- **Breadcrumb:** Customers → Customer → Order (links to `/customers`, `/customers/{id}`).
- **Title row:** `Order {id}` (mono) + badges: **Subscription vs Individual**, optional **service type chips** (`OrderStatusBadge`).
- **Pickup banner:** Full-width rounded strip — label **Pickup** + either **Walk order** or **human date · 24h time window** (`formatPickupDayDisplay`, `formatTimeWindow24h`).

### Status card

- **Title:** “Status” + description “Horizontal timeline with timestamps”.
- **Header actions (wrap):**
  - **Acknowledgement invoice** — opens modal viewer when ACK is **ISSUED**.
  - **Final invoice** — opens modal viewer when Final is **ISSUED**.
  - **Record payment** — visible when Final is issued, total &gt; 0, payment not yet **CAPTURED** (see §8).
  - **Cancel order** — only if not cancelled, not delivered, and ACK **not** yet issued.
- **Timeline:** Horizontal flex of stages with connectors. **Normal flow:** Order initiated → Picked up → Out for delivery → Delivered (timestamps under pills). **Cancelled:** shortened flow ending in **Cancelled** with destructive styling on that pill.
- **Payment subsection** (when final submitted): `PaymentStatusBadge`, amount, provider, or hint to use Record payment.

### Print behaviour (page-level)

- Injected `<style>` blocks: for `@media print`, hide most of `body` except regions with classes `.ack-invoice-print-area` and `.final-invoice-print-area`; force `main { overflow: visible }`; hide chrome (`header`, `nav`, fixed layout). Buttons/inputs inside those areas use `.ack-print-hide` to disappear on print.
- **Final invoice “Print”** from embedded `InvoiceBuilder` uses `window.print()` so the browser prints those regions.

---

## 4. Changing order status

### Fixed footer bar

- **`fixed bottom-0`** footer with a row of buttons, one per step in **`STATUS_FLOW`** (e.g. `BOOKING_CONFIRMED`, `PICKED_UP`, `OUT_FOR_DELIVERY`, `DELIVERED`).
- **Only two buttons enabled at a time:** the **current** mapped status (highlighted) and the **next** step. Others are disabled. Click calls `updateStatus.mutate(targetStatus)` with toast on success/error.
- **Label tweak:** the next step after booking may read **“Confirm Pickup”** instead of raw enum text.

### Mapping internal statuses to the timeline

- `PICKUP_SCHEDULED` is treated like **BOOKING_CONFIRMED** for the flow index.
- `IN_PROCESSING` / `READY` map to **PICKED_UP** for “current” pill highlighting so the UI matches the simplified 4-step story.

### Status changes tied to invoices

- **Issue ACK:** On success, if order was `BOOKING_CONFIRMED` or `PICKUP_SCHEDULED`, UI also moves status to **`PICKED_UP`**.
- **Confirm pickup** path: save ACK draft → issue ACK → then **`PICKED_UP`** in one success chain.

### Cancel

- Separate **Dialog**: reason field + confirm; calls cancel mutation with `CANCELLED` and reason.

---

## 5. Invoices — two layers: builder on page vs viewer dialogs

### A) On the order page (editable until issued)

1. **Acknowledgement (ACK)** — large card with grey-tinted print region class **`ack-invoice-print-area`**. Contains:
   - Order mode toggles (individual / subscription / both), subscription usage inputs when required, optional new subscription block.
   - **`InvoiceBuilder`** with ACK-specific props: tax/discount as percent, **Save Ack Invoice** draft, **Issue** (and validation when subscription limits exceeded), **Print** (page print), optional WhatsApp string when PDF URL exists, **Print line tag** integration via catalog matrix + `PrintLineTagDialog`.
   - Summary line under builder: `Subtotal · Discount … · Tax …` and **Total** or **Prepaid** when subscription math nets to zero.

2. **Final invoice** — Shown inside **`showTabs`** once ACK is issued (tabbed UX: **Final Invoice** as main tab; Record Payment tab when applicable). Pink-tinted wrapper **`final-invoice-print-area`**. Contains:
   - Header: **logo only** (centered), invoice number block, reference ACK block.
   - **Order details** column (name, phone, address, map link) vs **PAN/GST/branch** column.
   - Second **`InvoiceBuilder`** for final lines with **issue final**, read-only after issue/payment rules, `issuedShareAdvanced` config when Final is issued (clone-based print + WhatsApp like dialogs — see `InvoiceBuilder`).

### B) Viewer dialogs (read-only issued PDFs on screen)

Opened from **Status** card buttons.

- **`AcknowledgementInvoiceDialog` / `FinalInvoiceDialog`:**
  - Tall dialog: `flex h-[min(90vh,900px)]`, header with title + invoice code, **scrollable** body with **`InvoicePrintView`**, **sticky footer** with **Print**, **Download PDF**, **Share on WhatsApp** (WhatsApp = primary filled button; others outline).

---

## 6. Invoice UI (`InvoicePrintView`)

### Role

Single **presentational** component for “what the customer sees on paper/PDF”: logo header, order/customer/branch grid, line table (with optional **catalog item icons** when matrix resolves `catalogItemId`), totals, terms, footer note.

### Props worth copying

- `summary` (order + customer + address + branch + subscription snapshots).
- `invoice` (lines, totals, codes, `pdfUrl`, `brandingSnapshotJson`).
- `type`: `'ACK' | 'FINAL'`.
- `branding` merged from snapshot + live settings (`mergeInvoiceDisplayBranding`).
- `logoUrlCacheBuster` to avoid stale CDN/browser cache on logos.
- `catalogMatrix` for icon lookup.

### Layout conventions

- **Order details** block: bold “Order details”, name, **Phone:** line, subscription note if any, address, pickup line (walk vs formatted).
- **Right column:** **businessName** bold, PAN, GST, branch name + address (+ phone in branch block where applicable).
- Totals row reflects **discount before tax** copy in the current product.

---

## 7. Share options (Print, Download PDF, WhatsApp)

### Shared hook: `useIssuedInvoiceShareActions`

Used by **AcknowledgementInvoiceDialog**, **FinalInvoiceDialog**, and (when configured) **`InvoiceBuilder`** via `issuedShareAdvanced`.

**Print**

- Clones the `ref` element from `InvoicePrintView`, assigns a **unique** `printRootId` + `printCloneClass`, injects a **print-only stylesheet** that:
  - Hides all direct `body` children except `#printRootId`.
  - Forces `visibility: visible` on the clone subtree (fixes global `body * { visibility: hidden }` patterns).
- `requestAnimationFrame` → `window.print()` → remove clone + style.

**Download PDF**

- Prefer **html2pdf.js** on the live DOM (add `pdf-capture` class briefly so buttons hide).
- On failure, **GET** `pdfUrl` with `Authorization: Bearer` if available and download blob.

**Share on WhatsApp**

- **Message** built per dialog: greeting, order id, **human-readable status** (`getOrderStatusLabel`), invoice code/label, **bold** amount line, **PWA URL** from `CUSTOMER_PWA_URL` (no raw PDF link in text).
- **Mobile:** `navigator.share` with file = JPEG from **html2canvas** (then PDF fallback).
- **Desktop:** User-agent check skips share sheet; **download** image/PDF then open `https://wa.me/{digits}?text=encodeURIComponent(message)` (`phoneDigitsForWhatsApp` normalises Indian numbers).

**Dependencies:** `html2canvas`, `html2pdf.js` (dynamic import).

### Customer profile invoice modal (`CustomerOrdersTable`)

- Separate **print root id** (`customer-invoice-print-root`) and inline stylesheet string (same visibility trick).
- Opens when user clicks **Ack** or **Final** in the orders table for that customer.
- Uses same **`InvoicePrintView`** + merged branding; actions may include print/download/share with slightly different filenames.

---

## 8. Record payment

### When the button appears

- **Final invoice** status is **ISSUED**.
- **Payment** is not yet **CAPTURED** (or equivalent “paid” state).
- **Final total** &gt; 0.

### UI

- **`Dialog`**, title **Record payment**.
- Fields: **Amount** (often pre-filled from final total in rupees), **Provider** select (**UPI** vs **CASH**), optional **Note** textarea.
- **Confirm payment** calls `useUpdatePayment` with `{ provider, status: 'CAPTURED', amountPaise, note }`.
- On success: toast **“Payment recorded. Order marked as delivered.”**, close dialog, clear note. Backend is expected to align order/payment state (e.g. delivered).

### Hooks

- [`useUpdatePayment`](../apps/admin-web/hooks/usePayments.ts) (or equivalent path) wraps the PATCH/POST to your payments API.

---

## 9. Replication checklist for a clone

1. **Copy or reimplement** the **order summary** type and hooks (`useOrderSummary`, `useOrders`, `useUpdateOrderStatus`, ACK/Final draft + issue mutations, `useUpdatePayment`).
2. **Dashboard:** branch filter + KPI queries + order board + **preview dialog** wired to the same summary API.
3. **Orders list:** debounced search + table + navigation to detail.
4. **Order detail:** pickup banner, status card + timeline + footer status buttons + cancel dialog.
5. **Invoice:** `InvoicePrintView` + `mergeInvoiceDisplayBranding` + `InvoiceBuilder` parity (tax/discount/prepaid rules).
6. **Dialogs:** Ack/Final viewers with **sticky** action bar and `useIssuedInvoiceShareActions`.
7. **Print CSS:** page-level `@media print` for ack/final regions; dialog print uses injected stylesheet + dedicated root id (no id collisions between Ack, Final, and customer modal).
8. **Record payment** dialog + mutation + gating flags (`finalSubmitted`, `paymentRecorded`, `finalInvoice.total`).
9. **Constants:** set `CUSTOMER_PWA_URL` (and any WhatsApp copy) for your environment.

---

## 10. Related docs

- [`docs/CLONE_PORTING_LAST_24H_AND_UI.md`](CLONE_PORTING_LAST_24H_AND_UI.md) — recent file/commit-oriented porting list.
- [`IMPLEMENTED_CHANGES_REFERENCE.md`](../IMPLEMENTED_CHANGES_REFERENCE.md) — feature reference for this monorepo.

---

*This guide describes the Weyouprod admin-web implementation; adjust routes and API contracts to match your clone’s backend.*
