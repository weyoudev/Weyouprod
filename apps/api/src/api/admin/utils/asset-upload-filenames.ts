import * as path from 'path';

export function sanitizeOriginalName(name: string): string {
  return (name || 'file').replace(/[^a-zA-Z0-9._-]/g, '_').slice(0, 100) || 'file';
}

export function sanitizeIconKey(name: string): string {
  return (name || 'default').replace(/[^a-zA-Z0-9_-]/g, '_').slice(0, 80) || 'default';
}

export function extFromName(name: string): string {
  const clean = sanitizeOriginalName(name);
  const ext = path.extname(clean).toLowerCase();
  if (ext === '.png' || ext === '.jpg' || ext === '.jpeg' || ext === '.webp') return ext;
  return '.png';
}

/** Matches legacy diskStorage naming for branding uploads (logo, upi-qr, welcome-bg, app-icon). */
export function brandingStableFileName(prefix: string, originalName: string): string {
  const stableBase = prefix || 'logo-';
  const ext = extFromName(originalName);
  return `${stableBase}${ext}`;
}

export function carouselFileName(position: number, originalName: string): string {
  const pos = [1, 2, 3].includes(position) ? position : 1;
  const base = `carousel-${pos}`;
  const ext = extFromName(originalName);
  return `${base}${ext}`;
}

export function catalogIconFileName(iconKey: string, originalName: string): string {
  const key = sanitizeIconKey(iconKey);
  const base = `icon-${key}`;
  const ext = extFromName(originalName);
  return `${base}${ext}`;
}

export function branchAssetFileName(
  branchId: string,
  kind: 'logo' | 'upi-qr',
  originalName: string,
): string {
  const base = `branch-${branchId}-${kind}`;
  const ext = extFromName(originalName);
  return `${base}${ext}`;
}
