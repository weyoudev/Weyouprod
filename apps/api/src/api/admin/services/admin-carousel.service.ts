import { BadRequestException, Inject, Injectable } from '@nestjs/common';
import type { CarouselRepo } from '../../../application/ports';
import { CAROUSEL_REPO } from '../../../infra/infra.module';

const MAX_IMAGES = 3;
const POSITIONS = [1, 2, 3] as const;

@Injectable()
export class AdminCarouselService {
  constructor(
    @Inject(CAROUSEL_REPO) private readonly carouselRepo: CarouselRepo,
  ) {}

  async list() {
    const images = await this.carouselRepo.list();
    const byPosition: Record<number, { id: string; imageUrl: string; createdAt: string; updatedAt: string } | null> = {
      1: null,
      2: null,
      3: null,
    };
    for (const img of images) {
      if (img.position >= 1 && img.position <= MAX_IMAGES) {
        byPosition[img.position] = {
          id: img.id,
          imageUrl: img.imageUrl,
          createdAt: img.createdAt.toISOString(),
          updatedAt: img.updatedAt.toISOString(),
        };
      }
    }
    return { slots: [byPosition[1], byPosition[2], byPosition[3]] };
  }

  async upload(fileName: string, position: number) {
    if (!POSITIONS.includes(position as 1 | 2 | 3)) {
      throw new BadRequestException('Position must be 1, 2, or 3');
    }
    const imageUrl = `/api/assets/carousel/${fileName}`;
    const record = await this.carouselRepo.setImage(position, imageUrl);
    return {
      position: record.position,
      imageUrl: record.imageUrl,
      id: record.id,
    };
  }

  async remove(position: number) {
    if (!POSITIONS.includes(position as 1 | 2 | 3)) {
      throw new BadRequestException('Position must be 1, 2, or 3');
    }
    await this.carouselRepo.removeImage(position);
    return { removed: position };
  }
}
