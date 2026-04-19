# Admin image storage (branding, carousel, catalog icons, branch assets)

This document describes how user-uploaded **images** are stored in the Weyou platform and what to do after deploys.

## Behavior (as implemented)

1. **Upload path**  
   Admin endpoints accept files in memory (Multer `memoryStorage`), then call `AdminAssetUploadService.persistUpload`, which uses the shared **`StorageAdapter`** from `InfraModule`.

2. **When Supabase is configured** (`SUPABASE_URL` + `SUPABASE_SERVICE_ROLE_KEY` in `apps/api/.env`)  
   - Files are uploaded to the Storage bucket named by **`SUPABASE_STORAGE_BUCKET`** (default **`assets`**).  
   - Keys mirror the logical paths used when serving assets, for example:
     - `branding/logo.png`, `branding/upi-qr.png`, …
     - `carousel/carousel-1.jpg`
     - `catalog-icons/icon-<key>.png`
     - `branding/branches/branch-<id>-logo.png`
   - The adapter returns the **public Supabase URL**. That URL is what gets stored in the database for branding, carousel, branches, etc. Clients that already handle `http(s)://` URLs (e.g. mobile `brandingLogoFullUrl`, `carouselImageFullUrl`) continue to work.

3. **When Supabase is not configured** (local dev)  
   - `LocalStorageAdapter` writes under **`LOCAL_STORAGE_ROOT`** (default `./storage`) using the same keys (`branding/…`, etc.).  
   - `persistUpload` returns the **fallback** `/api/assets/…` URL because `putObject` does not return a string for local disk.

4. **Serving (`AssetsService`)**  
   Still prefers a file on **local disk** under the assets root if present, then falls back to **`storageAdapter.getObjectStream`** for the same path key. After this change, production images live primarily in **Supabase Storage**, so they persist across Dokploy/container restarts and multiple instances.

## Environment variables (API)

| Variable | Purpose |
|----------|---------|
| `SUPABASE_URL` | Project URL |
| `SUPABASE_SERVICE_ROLE_KEY` | Server-side uploads (keep secret) |
| `SUPABASE_STORAGE_BUCKET` | Bucket name (default `assets`) |
| `LOCAL_STORAGE_ROOT` | Local filesystem root when Supabase is **not** used |

No new variables were added for this feature. Existing production env on Dokploy is sufficient if these are already set.

## One-time bucket setup

From the repo root (with API env loaded):

```bash
npm run supabase:ensure-assets-bucket
```

Ensures the **`assets`** bucket exists and is **public** (required for public URLs returned by `putObject`).

## After deploying this behavior

1. Deploy the new API build.  
2. In **Supabase → Storage → `assets`**, confirm new uploads appear under `branding/`, `carousel/`, `catalog-icons/`, `branding/branches/` after using admin UI.  
3. **Re-upload** any images that previously existed only on ephemeral server disk so they are copied into Storage.  
4. Smoke-test from **two devices or networks** using the same image URLs.

## Related code

- `apps/api/src/api/admin/services/admin-asset-upload.service.ts` — `persistUpload`
- `apps/api/src/infra/storage/supabase-storage.adapter.ts` — upload + `getPublicUrl`
- `apps/api/src/infra/infra.module.ts` — selects Supabase vs local adapter
- `apps/api/src/api/assets/assets.service.ts` — serves assets (local first, then adapter)
- `apps/api/src/api/admin/utils/asset-upload-filenames.ts` — stable filenames matching previous disk behavior

## Admin web: multipart uploads

The admin SPA uses Axios with a default `Content-Type: application/json`. For `FormData` uploads, `apps/admin-web/lib/api.ts` clears `Content-Type` on the request so the browser sets `multipart/form-data` **with** the required boundary. Do **not** set `Content-Type: multipart/form-data` manually on upload requests (that omits the boundary and can cause HTTP 400 / empty file on the API).

## Related docs

- [SUPABASE-STORAGE-INDEX.md](./SUPABASE-STORAGE-INDEX.md) — overview of Storage documentation  
- [SUPABASE-STORAGE-SETUP.md](./SUPABASE-STORAGE-SETUP.md) — broader Storage setup  
