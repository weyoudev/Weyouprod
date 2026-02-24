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
