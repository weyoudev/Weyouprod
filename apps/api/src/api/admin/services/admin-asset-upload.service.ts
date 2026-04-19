import { Inject, Injectable } from '@nestjs/common';
import type { StorageAdapter } from '../../../application/ports';
import { STORAGE_ADAPTER } from '../../../infra/infra.module';

function contentTypeForPath(storagePath: string): string {
  const lower = storagePath.toLowerCase();
  if (lower.endsWith('.png')) return 'image/png';
  if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
  if (lower.endsWith('.webp')) return 'image/webp';
  return 'application/octet-stream';
}

/**
 * Takes Multer-buffered uploads and persists via {@link StorageAdapter}.
 * Supabase returns a permanent public URL (stored in DB). Local adapter writes under LOCAL_STORAGE_ROOT.
 */
@Injectable()
export class AdminAssetUploadService {
  constructor(@Inject(STORAGE_ADAPTER) private readonly storageAdapter: StorageAdapter) {}

  /**
   * @param pathKey Relative path for storage (e.g. branding/logo.png, carousel/carousel-1.jpg).
   * @param fallbackApiAssetUrl URL returned when using local disk only (same shape as before).
   */
  async persistUpload(pathKey: string, buffer: Buffer, fallbackApiAssetUrl: string): Promise<string> {
    const ct = contentTypeForPath(pathKey);
    const urlOrVoid = await this.storageAdapter.putObject(pathKey, buffer, ct);
    if (typeof urlOrVoid === 'string' && urlOrVoid.length > 0) {
      return urlOrVoid;
    }
    return fallbackApiAssetUrl;
  }
}
