/**
 * Format paise as INR (e.g. 10000 -> "₹100.00")
 */
export function formatMoney(paise: number): string {
  return new Intl.NumberFormat('en-IN', {
    style: 'currency',
    currency: 'INR',
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(paise / 100);
}

export function formatDate(iso: string): string {
  return new Intl.DateTimeFormat('en-IN', {
    dateStyle: 'medium',
  }).format(new Date(iso));
}

/**
 * Return YYYY-MM-DD for the **local** calendar date of an ISO timestamp.
 * Use this when grouping or filtering by "day" so UTC timestamps (e.g. 25 Feb 03:39 IST = 24 Feb 22:09 UTC)
 * show under the correct local date (25th), not the UTC date (24th).
 */
export function isoToLocalDateKey(iso: string | null | undefined): string | null {
  if (!iso || typeof iso !== 'string') return null;
  const d = new Date(iso);
  if (Number.isNaN(d.getTime())) return null;
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

/** Today's date as YYYY-MM-DD in local timezone (for default values and ranges). */
export function getTodayLocalDateKey(): string {
  const d = new Date();
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
}

export function formatDateTime(iso: string): string {
  return new Intl.DateTimeFormat('en-IN', {
    dateStyle: 'short',
    timeStyle: 'short',
  }).format(new Date(iso));
}

/**
 * Return the Google Maps URL stored on the address (from mobile app).
 * We do NOT convert address text to a maps search – just trust the saved link.
 */
export function getGoogleMapsUrl(googleMapUrl?: string | null): string {
  const url = (googleMapUrl ?? '').trim();
  if (!url) return '';
  return url;
}
