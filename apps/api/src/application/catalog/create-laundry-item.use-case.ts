import type { LaundryItemsRepo, LaundryItemRecord } from '../ports';

export interface CreateLaundryItemDeps {
  laundryItemsRepo: LaundryItemsRepo;
}

export async function createLaundryItem(
  name: string,
  active: boolean,
  icon: string | null | undefined,
  deps: CreateLaundryItemDeps,
): Promise<LaundryItemRecord> {
  return deps.laundryItemsRepo.create(name, active, icon ?? null);
}
