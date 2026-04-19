import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Param,
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
import { Roles } from '../../common/roles.decorator';
import { RolesGuard } from '../../common/roles.guard';
import { AdminBranchesService } from '../services/admin-branches.service';
import { CreateBranchDto } from '../dto/create-branch.dto';
import { UpdateBranchDto } from '../dto/update-branch.dto';
import { branchAssetFileName } from '../utils/asset-upload-filenames';
import type { Express } from 'express';

const IMAGE_UPLOAD_LIMIT = 10 * 1024 * 1024;

@Controller('admin/branches')
@UseGuards(JwtAuthGuard, RolesGuard)
@Roles(Role.ADMIN, Role.BILLING, Role.OPS, AGENT_ROLE)
export class AdminBranchesController {
  constructor(private readonly adminBranchesService: AdminBranchesService) {}

  @Get()
  @Roles(Role.ADMIN, Role.BILLING, Role.OPS, AGENT_ROLE)
  async list() {
    return this.adminBranchesService.list();
  }

  @Get(':id')
  @Roles(Role.ADMIN, Role.BILLING, Role.OPS, AGENT_ROLE)
  async getById(@Param('id') id: string) {
    return this.adminBranchesService.getById(id);
  }

  @Post()
  @Roles(Role.ADMIN, Role.BILLING)
  async create(@Body() dto: CreateBranchDto) {
    return this.adminBranchesService.create({
      name: dto.name,
      address: dto.address,
      phone: dto.phone ?? null,
      email: dto.email ?? null,
      gstNumber: dto.gstNumber ?? null,
      panNumber: dto.panNumber ?? null,
      footerNote: dto.footerNote ?? null,
      upiId: dto.upiId ?? null,
      upiPayeeName: dto.upiPayeeName ?? null,
      upiLink: dto.upiLink ?? null,
      isDefault: dto.isDefault,
    });
  }

  @Patch(':id')
  @Roles(Role.ADMIN, Role.BILLING)
  async update(@Param('id') id: string, @Body() dto: UpdateBranchDto) {
    return this.adminBranchesService.update(id, {
      name: dto.name,
      address: dto.address,
      phone: dto.phone,
      email: dto.email,
      gstNumber: dto.gstNumber,
      panNumber: dto.panNumber,
      footerNote: dto.footerNote,
      upiId: dto.upiId,
      upiPayeeName: dto.upiPayeeName,
      upiLink: dto.upiLink,
      isDefault: dto.isDefault,
    });
  }

  @Delete(':id')
  @Roles(Role.ADMIN, Role.BILLING)
  async delete(@Param('id') id: string) {
    await this.adminBranchesService.delete(id);
    return { success: true };
  }

  @Post(':id/logo')
  @Roles(Role.ADMIN, Role.BILLING)
  @UseInterceptors(
    FileInterceptor('file', {
      storage: memoryStorage(),
      limits: { fileSize: IMAGE_UPLOAD_LIMIT },
    }),
  )
  async uploadLogo(
    @Param('id') id: string,
    @UploadedFile() file: Express.Multer.File,
  ) {
    if (!file?.buffer?.length) {
      throw new BadRequestException('File is required');
    }
    const fileName = branchAssetFileName(id, 'logo', file.originalname);
    return this.adminBranchesService.uploadLogo(id, fileName, file.buffer);
  }

  @Post(':id/upi-qr')
  @Roles(Role.ADMIN, Role.BILLING)
  @UseInterceptors(
    FileInterceptor('file', {
      storage: memoryStorage(),
      limits: { fileSize: IMAGE_UPLOAD_LIMIT },
    }),
  )
  async uploadUpiQr(
    @Param('id') id: string,
    @UploadedFile() file: Express.Multer.File,
  ) {
    if (!file?.buffer?.length) {
      throw new BadRequestException('File is required');
    }
    const fileName = branchAssetFileName(id, 'upi-qr', file.originalname);
    return this.adminBranchesService.uploadUpiQr(id, fileName, file.buffer);
  }
}
