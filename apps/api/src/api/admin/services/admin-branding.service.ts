import { Inject, Injectable } from '@nestjs/common';
import { getBranding } from '../../../application/branding/get-branding.use-case';
import { updateBranding } from '../../../application/branding/update-branding.use-case';
import type { BrandingUpsertData, BrandingRepo } from '../../../application/ports';
import { BRANDING_REPO } from '../../../infra/infra.module';
import { AdminAssetUploadService } from './admin-asset-upload.service';

@Injectable()
export class AdminBrandingService {
  constructor(
    @Inject(BRANDING_REPO) private readonly brandingRepo: BrandingRepo,
    private readonly adminAssetUpload: AdminAssetUploadService,
  ) {}

  async get() {
    return getBranding({ brandingRepo: this.brandingRepo });
  }

  async update(data: BrandingUpsertData) {
    return updateBranding(data, { brandingRepo: this.brandingRepo });
  }

  async uploadLogo(fileName: string, buffer: Buffer) {
    const pathKey = `branding/${fileName}`;
    const fallback = `/api/assets/${pathKey}`;
    const url = await this.adminAssetUpload.persistUpload(pathKey, buffer, fallback);
    await this.brandingRepo.setLogoUrl(url);
    return this.get();
  }

  async uploadUpiQr(fileName: string, buffer: Buffer) {
    const pathKey = `branding/${fileName}`;
    const fallback = `/api/assets/${pathKey}`;
    const url = await this.adminAssetUpload.persistUpload(pathKey, buffer, fallback);
    await this.brandingRepo.setUpiQrUrl(url);
    return this.get();
  }

  async uploadWelcomeBackground(fileName: string, buffer: Buffer) {
    const pathKey = `branding/${fileName}`;
    const fallback = `/api/assets/${pathKey}`;
    const url = await this.adminAssetUpload.persistUpload(pathKey, buffer, fallback);
    await this.brandingRepo.setWelcomeBackgroundUrl(url);
    return this.get();
  }

  async uploadAppIcon(fileName: string, buffer: Buffer) {
    const pathKey = `branding/${fileName}`;
    const fallback = `/api/assets/${pathKey}`;
    const url = await this.adminAssetUpload.persistUpload(pathKey, buffer, fallback);
    await this.brandingRepo.setAppIconUrl(url);
    return this.get();
  }
}
