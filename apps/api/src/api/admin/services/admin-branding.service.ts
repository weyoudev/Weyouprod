import { Inject, Injectable } from '@nestjs/common';
import { getBranding } from '../../../application/branding/get-branding.use-case';
import { updateBranding } from '../../../application/branding/update-branding.use-case';
import type { BrandingUpsertData, BrandingRepo } from '../../../application/ports';
import { BRANDING_REPO } from '../../../infra/infra.module';

@Injectable()
export class AdminBrandingService {
  constructor(
    @Inject(BRANDING_REPO) private readonly brandingRepo: BrandingRepo,
  ) {}

  async get() {
    return getBranding({ brandingRepo: this.brandingRepo });
  }

  async update(data: BrandingUpsertData) {
    return updateBranding(data, { brandingRepo: this.brandingRepo });
  }

  async uploadLogo(fileName: string) {
    const url = `/api/assets/branding/${fileName}`;
    await this.brandingRepo.setLogoUrl(url);
    return this.get();
  }

  async uploadUpiQr(fileName: string) {
    const url = `/api/assets/branding/${fileName}`;
    await this.brandingRepo.setUpiQrUrl(url);
    return this.get();
  }

  async uploadWelcomeBackground(fileName: string) {
    const url = `/api/assets/branding/${fileName}`;
    await this.brandingRepo.setWelcomeBackgroundUrl(url);
    return this.get();
  }

  async uploadAppIcon(fileName: string) {
    const url = `/api/assets/branding/${fileName}`;
    await this.brandingRepo.setAppIconUrl(url);
    return this.get();
  }
}
