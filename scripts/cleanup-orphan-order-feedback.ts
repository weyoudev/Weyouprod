/**
 * Delete orphaned ORDER feedback rows.
 * Orphaned = feedback type ORDER with no linked order (orderId is NULL).
 *
 * Safety:
 * - Dry-run by default (prints count only).
 * - Requires ORPHAN_FEEDBACK_CLEANUP_CONFIRM=YES to actually delete.
 *
 * Run from repo root:
 *   npx ts-node --transpile-only --project scripts/tsconfig.seed.json scripts/cleanup-orphan-order-feedback.ts
 *
 * Delete mode:
 *   ORPHAN_FEEDBACK_CLEANUP_CONFIRM=YES npx ts-node --transpile-only --project scripts/tsconfig.seed.json scripts/cleanup-orphan-order-feedback.ts
 */
import 'dotenv/config';
import { PrismaClient, FeedbackType } from '@prisma/client';

const prisma = new PrismaClient();

async function cleanup(): Promise<void> {
  const orphanWhere = {
    type: FeedbackType.ORDER,
    orderId: null as string | null,
  };

  const before = await prisma.feedback.count({ where: orphanWhere });
  console.log(`Orphan ORDER feedback rows: ${before}`);

  if (before === 0) {
    console.log('No orphan ORDER feedback rows found.');
    return;
  }

  if (process.env.ORPHAN_FEEDBACK_CLEANUP_CONFIRM !== 'YES') {
    console.log('Dry run complete. Set ORPHAN_FEEDBACK_CLEANUP_CONFIRM=YES to delete these rows.');
    return;
  }

  const result = await prisma.feedback.deleteMany({ where: orphanWhere });
  console.log(`Deleted orphan ORDER feedback rows: ${result.count}`);
}

cleanup()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
