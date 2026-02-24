/**
 * Centralized API config. Uses EXPO_PUBLIC_API_URL (no trailing /api).
 * Works in development (Expo Go) and EAS production builds.
 */

const raw = process.env.EXPO_PUBLIC_API_URL;
export const API_BASE_URL: string = typeof raw === 'string' && raw.trim() !== '' ? raw.trim().replace(/\/$/, '') : '';

if (!API_BASE_URL) {
  if (__DEV__) {
    console.warn('[API config] EXPO_PUBLIC_API_URL is not set. Set it in .env (e.g. https://your-api.onrender.com) and restart Expo.');
  }
}

/** Max timeout for API calls (ms). */
export const API_TIMEOUT_MS = 10000;

/** Base URL for API requests (with /api path). */
export function getApiBase(): string {
  if (!API_BASE_URL) return '';
  const base = API_BASE_URL.replace(/\/api\/?$/, '');
  return `${base}/api`;
}

/**
 * Health check: GET /api/health. Returns true if status 200.
 * Uses API_TIMEOUT_MS. Logs meaningful errors on failure.
 */
export async function checkApiConnection(): Promise<boolean> {
  const base = getApiBase();
  if (!base) {
    console.warn('[API] checkApiConnection: EXPO_PUBLIC_API_URL not set. Skipping health check.');
    return false;
  }
  const url = `${base}/health`;
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), API_TIMEOUT_MS);
  try {
    const res = await fetch(url, { method: 'GET', signal: controller.signal });
    clearTimeout(timeoutId);
    if (res.ok) return true;
    console.warn('[API] checkApiConnection: health returned', res.status, res.statusText);
    return false;
  } catch (err) {
    clearTimeout(timeoutId);
    if (err instanceof Error) {
      if (err.name === 'AbortError') {
        console.warn('[API] checkApiConnection: request timed out after', API_TIMEOUT_MS / 1000, 's');
      } else {
        console.warn('[API] checkApiConnection: failed', err.message);
      }
    } else {
      console.warn('[API] checkApiConnection: failed', err);
    }
    return false;
  }
}
