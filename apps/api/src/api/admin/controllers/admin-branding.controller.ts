import {
  Controller,
  Get,
  Put,
  Post,
  Body,
  UseGuards,
  UseInterceptors,
  UploadedFile,
  BadRequestException,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { memoryStorage } from 'multer';
import { Role } from '@shared/enums';
import { AGENT_ROLE } from '../../common/agent-role';
import { JwtAuthGuard } from '../../common/jwt-auth.guard';
import { CurrentUser } from '../../common/current-user.decorator';
import { Roles } from '../../common/roles.decorator';
import { RolesGuard } from '../../common/roles.guard';
import type { AuthUser } from '../../common/roles.guard';
import { AdminBrandingService } from '../services/admin-branding.service';
import { UpdateBrandingDto } from '../dto/update-branding.dto';
import { brandingStableFileName } from '../utils/asset-upload-filenames';
import type { Express } from 'express';

const IMAGE_UPLOAD_LIMIT = 10 * 1024 * 1024;

function brandingMemoryInterceptor() {
  return FileInterceptor('file', {
    storage: memoryStorage(),
    limits: { fileSize: IMAGE_UPLOAD_LIMIT },
  });
}

@Controller('admin/branding')
@UseGuards(JwtAuthGuard, RolesGuard)
@Roles(Role.ADMIN, Role.BILLING, Role.OPS, AGENT_ROLE)
export class AdminBrandingController {
  constructor(private readonly adminBrandingService: AdminBrandingService) {}

  @Get()
  @Roles(Role.ADMIN, Role.BILLING, Role.OPS, AGENT_ROLE)
  async get() {
    return this.adminBrandingService.get();
  }

  @Put()
  @Roles(Role.ADMIN, Role.BILLING)
  async update(@CurrentUser() user: AuthUser, @Body() dto: UpdateBrandingDto) {
    const isSuperAdmin = user?.role === Role.ADMIN;
    return this.adminBrandingService.update({
      businessName: dto.businessName,
      address: dto.address,
      phone: dto.phone,
      footerNote: dto.footerNote ?? null,
      panNumber: dto.panNumber ?? null,
      gstNumber: dto.gstNumber ?? null,
      email: dto.email ?? null,
      upiId: dto.upiId ?? null,
      upiPayeeName: dto.upiPayeeName ?? null,
      upiLink: dto.upiLink ?? null,
      ...(isSuperAdmin && {
        termsAndConditions: dto.termsAndConditions ?? null,
        privacyPolicy: dto.privacyPolicy ?? null,
      }),
    });
  }

  @Post('logo')
  @Roles(Role.ADMIN, Role.BILLING)
  @UseInterceptors(brandingMemoryInterceptor())
  async uploadLogo(@UploadedFile() file: Express.Multer.File) {
    if (!file?.buffer?.length) {
      throw new BadRequestException('File is required');
    }
    const fileName = brandingStableFileName('logo', file.originalname);
    return this.adminBrandingService.uploadLogo(fileName, file.buffer);
  }

  @Post('upi-qr')
  @Roles(Role.ADMIN, Role.BILLING)
  @UseInterceptors(brandingMemoryInterceptor())
  async uploadUpiQr(@UploadedFile() file: Express.Multer.File) {
    if (!file?.buffer?.length) {
      throw new BadRequestException('File is required');
    }
    const fileName = brandingStableFileName('upi-qr', file.originalname);
    return this.adminBrandingService.uploadUpiQr(fileName, file.buffer);
  }

  @Post('welcome-background')
  @Roles(Role.ADMIN, Role.BILLING)
  @UseInterceptors(brandingMemoryInterceptor())
  async uploadWelcomeBackground(@UploadedFile() file: Express.Multer.File) {
    if (!file?.buffer?.length) {
      throw new BadRequestException('File is required');
    }
    const fileName = brandingStableFileName('welcome-bg', file.originalname);
    return this.adminBrandingService.uploadWelcomeBackground(fileName, file.buffer);
  }

  @Post('app-icon')
  @Roles(Role.ADMIN, Role.BILLING)
  @UseInterceptors(brandingMemoryInterceptor())
  async uploadAppIcon(@UploadedFile() file: Express.Multer.File) {
    if (!file?.buffer?.length) {
      throw new BadRequestException('File is required');
    }
    const fileName = brandingStableFileName('app-icon', file.originalname);
    return this.adminBrandingService.uploadAppIcon(fileName, file.buffer);
  }
}
