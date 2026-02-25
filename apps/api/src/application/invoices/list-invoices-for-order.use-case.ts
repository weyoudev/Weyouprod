import { AppError } from '../errors';
import type { OrdersRepo, InvoicesRepo, LaundryItemsRepo } from '../ports';

export interface ListInvoicesForOrderDeps {
  ordersRepo: OrdersRepo;
  invoicesRepo: InvoicesRepo;
  laundryItemsRepo?: LaundryItemsRepo;
}

/**
 * Returns invoices for an order. Caller must be the order owner (userId).
 * Throws ORDER_NOT_FOUND or ORDER_ACCESS_DENIED.
 * When laundryItemsRepo is provided, each item with catalogItemId gets its icon from the catalog.
 */
export async function listInvoicesForOrder(
  orderId: string,
  userId: string,
  deps: ListInvoicesForOrderDeps,
) {
  const order = await deps.ordersRepo.getById(orderId);
  if (!order) {
    throw new AppError('ORDER_NOT_FOUND', 'Order not found', { orderId });
  }
  if (order.userId !== userId) {
    throw new AppError('ORDER_ACCESS_DENIED', 'Not allowed to view this order');
  }
  const invoices = await deps.invoicesRepo.findByOrderId(orderId);
  const catalogItemIds = new Set<string>();
  for (const inv of invoices) {
    for (const item of inv.items ?? []) {
      if (item.catalogItemId) catalogItemIds.add(item.catalogItemId);
    }
  }
  const iconMap: Record<string, string | null> = {};
  if (deps.laundryItemsRepo && catalogItemIds.size > 0) {
    for (const id of catalogItemIds) {
      const catalogItem = await deps.laundryItemsRepo.getById(id);
      iconMap[id] = catalogItem?.icon ?? null;
    }
  }
  return invoices.map((inv) => ({
    id: inv.id,
    type: inv.type,
    status: inv.status,
    subtotal: inv.subtotal,
    tax: inv.tax,
    total: inv.total,
    discountPaise: inv.discountPaise ?? 0,
    issuedAt: inv.issuedAt,
    pdfUrl: inv.pdfUrl ?? `/api/invoices/${inv.id}/pdf`,
    items: (inv.items ?? []).map((item) => ({
      id: item.id,
      type: item.type,
      name: item.name,
      quantity: item.quantity,
      unitPrice: item.unitPrice,
      amount: item.amount,
      ...(item.catalogItemId != null && { catalogItemId: item.catalogItemId }),
      ...(item.catalogItemId != null && { icon: iconMap[item.catalogItemId] ?? null }),
    })),
  }));
}
