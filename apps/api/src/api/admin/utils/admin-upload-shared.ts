import * as path from 'path';
import { memoryStorage } from 'multer';

/** Multer parses multipart; buffers are persisted via StorageAdapter (Supabase or local disk). */
export function multerMemoryOptions(maxFileMb = 15) {
  return {
    storage: memoryStorage(),
    limits: { fileSize: maxFileMb * 1024 * 1024 },
  };
}

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
