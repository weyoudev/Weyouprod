# Porting guide: last 24 hours (git) + full UI parity checklist

Use this document to replay the same work in a **cloned** copy of the monorepo.  
**Git window:** commits on **2026-04-04** (IST) from `git log --since="24 hours ago"` at authoring time; the large feature landed in one PR merge plus several follow-up commits.

**Recommended approach:** merge or rebase `development` (or the branch that contains these commits) into your clone, then verify the checklist below. If you cannot merge, use the **file list** in §9 and apply changes manually in dependency order (API → shared → admin-web → customer apps).

---

## 1. Commit timeline (newest first)

| Commit     | Summary |
|-----------|---------|
| `d18c3c5` | **Dashboard + invoice print:** show customer **Mobile** in dashboard order preview; **Phone** line in `InvoicePrintView` order details. |
| `8fb469b` | **Customer PWA URL:** `CUSTOMER_PWA_URL` in `lib/customer-app-url.ts`; related `App.tsx` / log updates for WhatsApp / links. |
| `b822922` | **Admin users:** type-check fix in `AdminUserDialog.tsx`. |
| `eb482e5` | **API:** type / contract fixes in `admin-customers.controller.ts`, `admin-payments.service.ts`. |
| `34da87c` / `72a9a11` | Merge commits. |
| `127a487` | **Favicon (client):** `App.tsx` + `api.ts` — map **`appIconUrl`** from public branding; web `document` favicon links. |
| `771cd15` | **Customer PWA build:** `update-icon-from-branding.js`, `customer-pwa` `package.json` build chain, `postexport-pwa.js`, `.env.example`. |
| `b993de1` | **Main feature bundle:** AGENT role, orders search, invoice ACK/Final UX, print/share, sidebar/layout, customer Final invoice download removal, Home linen, env/docs/scripts, etc. (see §4–§8). |

**Working tree (may be ahead of last commit):**  
[`apps/admin-web/components/forms/PrintLineTagDialog.tsx`](apps/admin-web/components/forms/PrintLineTagDialog.tsx) — **Print line tag:** wait for iframe images + `decode()` + double `requestAnimationFrame` before `print()`; **`@page` / label `4in` × `2in`**. If your clone does not show this, pull latest or copy that file from source. Documented in [`IMPLEMENTED_CHANGES_REFERENCE.md`](../IMPLEMENTED_CHANGES_REFERENCE.md) § “Print line tag”.

---

## 2. Backend / API (non-UI but required for UI behaviour)

- **`AGENT` role:** New admin role, branch-scoped like OPS.  
  - **Files:** `apps/api/src/api/common/agent-role.ts`, `branch-scope.util.ts`, `roles.guard.ts`; Prisma `Role` enum + migration `20260404120000_add_role_agent`; `scripts/ensure-role-agent-enum.ts`.  
  - **Controllers/services:** `@Roles(..., AGENT_ROLE)` on admin modules (orders, walk-in, invoices, payments, feedback, analytics, catalog, etc.) — see diff of `b993de1`.  
  - **Clone action:** run migration or `npm run db:ensure-role-agent` (per your project scripts) so `AGENT` exists in Postgres before assigning users.

- **Orders list search:** `GET /admin/orders?search=…` — OR on order `id`, `user.name`, `user.phone` (with digit-aware phone matching when query is mixed).  
  - **Files:** `admin-list-orders-query.dto.ts`, `prisma-orders-repo.ts` (`adminList`), `orders-repo.port.ts`, fakes in `in-memory-repos.ts`.

- **Customer / payments fixes:** `eb482e5` — `admin-customers.controller.ts`, `admin-payments.service.ts` (align types with DTOs or repo).

- **Branding / storage (supporting assets):** `infra.module.ts`, `supabase-storage.adapter.ts`; optional `scripts/ensure-supabase-assets-bucket.ts`, `docs/DEV_SUPABASE_ENV.md`.

- **Shared enums:** `packages/shared/src/enums.ts` (+ `.d.ts`) for `AGENT` / role usage across API and apps.

---

## 3. Admin web — UI by area

### Layout & navigation

- **Sidebar:** Grouped sections with dividers; order: Dashboard / Orders / Walk-in / Customers → Final invoices / Subscriptions → catalog block → admin / analytics / feedback. Removed API/DB/user status and “Invalidate cache”. **Logout** sits under Feedback inside the scroll area.  
  - **Files:** `components/layout/Sidebar.tsx`.

- **Protected layout:** Sidebar `fixed`; main content `md:pl-56` / `md:pl-14` for collapsed vs expanded.  
  - **Files:** `components/layout/ProtectedLayout.tsx`.

### Branch scope (OPS + AGENT)

- Locked branch selector on relevant pages using `isBranchScopedStaff` / `LockedBranchSelect`.  
  - **Files:** `lib/auth.ts`, `lib/permissions.ts`, `components/shared/LockedBranchSelect.tsx`, and page files under `app/(protected)/` that pass branch props (orders, walk-in, feedback, analytics, catalog, subscriptions, etc. — see `b993de1` file list).

### Dashboard

- **Branch-scoped staff:** Skip or adjust KPI hooks / empty states so dashboard matches AGENT/OPS behaviour.  
- **Order preview card:** Under customer name, show **Mobile** label + **phone** (`previewSummary.customer.phone`).  
  - **Files:** `app/(protected)/dashboard/page.tsx` (KPI + `d18c3c5` phone row).

### Orders (list)

- **Single search field** (~400 ms debounce): order id, customer name, phone.  
- **Removed** from main UI: Status, Pincode, Service filters (API may still accept legacy query params).  
- **Order ID column:** `AdminOrderListOrderIdCell` for truncation/wrapping (also walk-in list).  
  - **Files:** `orders/page.tsx`, `walk-in-orders/page.tsx`, `hooks/useOrders.ts`, `types/order.ts`, `components/shared/AdminOrderListOrderIdCell.tsx`.

### Orders (detail) — invoices & header

- **Header:** Service types as **chips** beside title; **pickup** banner: day + 24h window (`formatPickupDayDisplay`, `formatTimeWindow24h` in `lib/format.ts`); walk-in shows walk copy; duplicate pickup lines removed from invoice blocks.  
- **Order details** label **bold**; right column **branding `businessName`** bold above PAN/GST.  
- **Cancelled:** Timeline step + destructive pill; **`InvoiceBuilder`** `disableEditing` — read-only lines, no add/tax/discount, comments disabled/muted.  
- **ACK tab UX:** No separate “Acknowledgment Invoice” tab; tabs = **Final Invoice** (+ Record Payment when applicable). ACK builder only until not issued. **Status** card opens **Acknowledgement invoice** modal when ACK issued; **Cancel order** only before ACK.  
- **New `AcknowledgementInvoiceDialog`:** Scrollable `InvoicePrintView`, sticky footer: **Print**, **Download PDF**, **Share on WhatsApp** (primary).  
- **Discount before tax (UI + copy):** `InvoiceBuilder` layout (discount left, tax right); order page summaries; `showPrepaidWhenZero` uses discount then tax on discounted base; `InvoicePrintView` totals order.  
- **Print layout:** Invoice header = **logo only** (centered); branch/business text removed from header band (details block unchanged). Sticky action bar in dialogs where applied.  
- **Branding merge:** `lib/invoice-display-branding.ts` — `mergeInvoiceDisplayBranding()` merges snapshot + live branding; fills `logoUrl` when missing; `logoUrlCacheBuster` on print. **CatalogItemIcon** beside line items when `catalogItemId` resolves.  
- **WhatsApp:** `phoneDigitsForWhatsApp`, `getOrderStatusLabel` export, `CUSTOMER_PWA_URL` in messages; mobile `navigator.share` + html2canvas JPEG/PDF; desktop download + `wa.me`. **Dependency:** `html2canvas` in `apps/admin-web/package.json`.  
- **Print CSS:** Order page + ACK dialog + `CustomerOrdersTable` invoice modal — visibility rules so print roots are not hidden by `body * { visibility: hidden }`.  
- **Line tag print:** `PrintLineTagDialog.tsx` — see §1 working-tree note (QR timing + 4"×2").  
- **Files (representative):** `orders/[id]/page.tsx`, `InvoicePrintView.tsx`, `InvoiceBuilder.tsx`, `AddItemsToInvoiceDialog.tsx`, `AcknowledgementInvoiceDialog.tsx`, `FinalInvoiceDialog.tsx`, `CustomerOrdersTable.tsx`, `StatusBadge.tsx`, `hooks/useIssuedInvoiceShareActions.ts`, `lib/customer-app-url.ts`, `CatalogItemIcon.tsx`.

### Catalog

- **Client-side search** (name, id, segment/service labels). Branch filter unchanged; export still branch-filtered.  
  - **File:** `app/(protected)/catalog/page.tsx`.

### Other admin pages touched (branch lock / consistency)

- `analytics/page.tsx`, `feedback/page.tsx`, `final-invoices/page.tsx`, `schedule/page.tsx`, `service-areas/page.tsx`, `subscription-invoice/[id]/page.tsx`, `subscription-plans/page.tsx`, `subscriptions/page.tsx`, `walk-in-orders/new/page.tsx`, etc. — align with `b993de1` diff if your clone diverges.

### Users

- **`AdminUserDialog` / `AdminUsersTable`:** Updates from feature branch + `b822922` type fix.

### Invoice print — customer phone

- **`InvoicePrintView`:** Under order details / customer name, line **Phone: {customer.phone}**.  
  - **Commit:** `d18c3c5`.

---

## 4. Customer mobile + PWA (Expo) — UI

- **Home:** Removed carousel pagination dots; single vertical `ScrollView` with `nestedScrollEnabled` for carousel + welcome + active orders; tighter spacing.  
  - **File:** `apps/customer-mobile/App.tsx`.

- **Book Now:** Sixth tile **Home linen** (`HOME_LINEN`) after Steam Iron.  
  - **File:** `apps/customer-mobile/src/types.ts`.

- **Add/Edit address:** PWA hides “Open Google Maps to search”; optional Maps URL only; URL not required on save (web). **Removed** “Use Google Maps link” button (all platforms).  
  - **File:** `App.tsx`.

- **Order detail — Final invoice:** **Removed Download** on Final invoice card; removed HTML/PDF helpers and static `expo-print` import for that path (subscription preview may still use dynamic print).  
  - **File:** `App.tsx`.

- **Branding favicon (web):** `getPublicBranding()` returns **`appIconUrl`**; web `useEffect` sets `document` `link[rel=icon]`, `shortcut icon`, `apple-touch-icon` to `brandingLogoFullUrl(appIconUrl || logoUrl)`.  
  - **Files:** `apps/customer-mobile/src/api.ts`, `App.tsx`.

- **PWA URL in admin copy:** `CUSTOMER_PWA_URL` default `https://customer.weyouthelaundryman.com/` — change in clone if your domain differs (`apps/admin-web/lib/customer-app-url.ts` + any `App.tsx` references from `8fb469b`).

---

## 5. Customer web (Next.js) — UI

- **Viewport / safe layout:** `layout.tsx` exports `viewport: { viewportFit: 'cover' }`.  
- **globals.css:** `html` / `body` `min-height: 100%` + `100dvh`.  
- **Login:** Outer container `min-h-[100dvh] min-h-screen w-full`.  
  - **Files:** `apps/customer-web/app/layout.tsx`, `globals.css`, `login/page.tsx`.

---

## 6. Dependencies & configuration

- **Admin web:** `html2canvas` (WhatsApp/share capture). Run `npm install` in `apps/admin-web` after merging `package.json` / lockfile.  
- **Customer PWA build:** `apps/customer-pwa/package.json` — build runs branding icon script → `expo export` → `postexport-pwa.js`.  
- **Env examples:** Root `.env.example`, `apps/api/.env.example`, `apps/admin-web/.env.local.example`, `apps/customer-mobile/.env.example`, `apps/customer-pwa/.env.example`, `docs/DEV_SUPABASE_ENV.md`.  
- **Gitignore:** Root + `apps/customer-mobile/.gitignore` (secrets, credentials).  

---

## 7. Assets (binary)

The large commit added/updated **branding** and **catalog** PNGs under `apps/api/assets/`. Copy these directories if you rely on seeded or bundled icons in dev.

---

## 8. Flat file list (from `b993de1` + follow-ups)

Copy or diff-merge these paths from source to clone (omit merge-only commits):

**Monorepo root:** `.env.example`, `.gitignore`, `package.json`, `package-lock.json`, `IMPLEMENTED_CHANGES_REFERENCE.md`, `INCREMENTAL_CHANGES_LOG.md`, `docs/DEV_SUPABASE_ENV.md`, `scripts/ensure-role-agent-enum.ts`, `scripts/ensure-supabase-assets-bucket.ts`, `scripts/purge-db.ts`, `scripts/seed.ts`, `packages/shared/src/enums.ts`, `packages/shared/src/enums.d.ts`

**API:** `apps/api/.env.example`, `schema.prisma`, migration `20260404120000_add_role_agent`, `infra.module.ts`, `supabase-storage.adapter.ts`, all controller/service/repo files listed in `git show b993de1 --name-only`, `agent-role.ts`, DTOs, ports, fakes.

**Admin web:** All paths under `apps/admin-web/` from that commit plus `d18c3c5` / `8fb469b` / `b822922` / `127a487` / `771cd15` as applicable (see §1 table).

**Customer mobile / PWA:** `App.tsx`, `src/api.ts`, `src/types.ts`, `scripts/update-icon-from-branding.js`, `.env.example`, `.gitignore`, `customer-pwa/package.json`, `customer-pwa/scripts/postexport-pwa.js`, `.env.example`.

**Customer web:** `globals.css`, `layout.tsx`, `login/page.tsx`.

---

## 9. Verification checklist (after port)

- [ ] API starts; `AGENT` role exists in DB; branch-scoped user sees locked branch and expected lists.  
- [ ] Orders list: search by id / name / phone; old filters gone from UI.  
- [ ] Order detail: ACK modal, Final invoice, print preview shows content; WhatsApp uses correct PWA URL.  
- [ ] Dashboard preview shows **Mobile** / phone.  
- [ ] `InvoicePrintView` shows **Phone** under customer.  
- [ ] Customer app: no Final invoice Download; Home linen tile; address UX on PWA.  
- [ ] PWA/customer web: favicon / `100dvh` / viewport-fit as expected.  
- [ ] **Print line tag:** QR visible in print preview; paper size **4in × 2in** (if latest `PrintLineTagDialog` is present).

---

## 10. Related docs in this repo

- [`INCREMENTAL_CHANGES_LOG.md`](../INCREMENTAL_CHANGES_LOG.md) — dated narrative bullets.  
- [`IMPLEMENTED_CHANGES_REFERENCE.md`](../IMPLEMENTED_CHANGES_REFERENCE.md) — stable reference by feature area.

---

*Document generated for clone porting. Regenerate or amend after large merges.*
