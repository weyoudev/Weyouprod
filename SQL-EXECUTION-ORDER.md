# SQL Execution Order for 10-04-2026.sql

## Problem
The original SQL file has the `User` table at line 1176, but tables like `Address` (line 32), `Feedback` (line 189), `Order` (line 764), and `Subscription` (line 1081) reference it via foreign keys. This causes the error: `ERROR: 42P01: relation "User" does not exist`

## Solution: Correct Table Creation Order

Run the table sections from the original file in this exact order. Each section includes the CREATE TABLE statement and its INSERT data.

### **TIER 1: Tables with NO dependencies** (run in any order)
1. `_prisma_migrations` - Lines 17-27
2. `Branch` - Lines 83-107
3. `BrandingSettings` - Lines 109-135
4. `CarouselImage` - Lines 137-152
5. `customer_addresses` - Lines 154-170
6. `DryCleanItem` - Lines 172-187
7. `Holiday` - Lines 223-240
8. `SegmentCategory` - Lines 935-957
9. `ServiceCategory` - Lines 980-999
10. `ServicePriceConfig` - Lines 1002-1019
11. `SubscriptionPlan` - Lines 1113-1134
12. `SlotConfig` - Lines 1022-1078

### **TIER 2: Tables that depend on Tier 1 only**
13. **`User`** - Lines 1176-1218 (depends on: Branch)
14. `LaundryItem` - Lines 613-672 (no deps)
15. `OperatingHours` - Lines 748-761 (depends on: Branch)
16. `ServiceArea` - Lines 960-977 (depends on: Branch)
17. `SubscriptionPlanBranch` - Lines 1137-1148 (depends on: SubscriptionPlan, Branch)

### **TIER 3: Tables that depend on Tier 2**
18. `Address` - Lines 32-80 (depends on: User)
19. `Feedback` - Lines 189-221 (depends on: User)
20. `LaundryItemBranch` - Lines 674-688 (depends on: LaundryItem, Branch)
21. `LaundryItemPrice` - Lines 690-745 (depends on: LaundryItem)
22. `ItemSegmentServicePrice` - Lines 471-611 (depends on: LaundryItem)

### **TIER 4: Tables that depend on Tier 3**
23. `Subscription` - Lines 1081-1110 (depends on: User, SubscriptionPlan, Address, Branch)
24. `Order` - Lines 764-870 (depends on: User, Address, Subscription, Branch)

### **TIER 5: Tables that depend on Tier 4**
25. `OrderItem` - Lines 873-890 (depends on: Order, LaundryItem)
26. `Payment` - Lines 893-932 (depends on: Order, Subscription)
27. `Invoice` - Lines 242-345 (depends on: Order, Branch)

### **TIER 6: Tables that depend on Tier 5**
28. `InvoiceItem` - Lines 347-469 (depends on: Invoice, LaundryItem)
29. `SubscriptionUsage` - Lines 1153-1172 (depends on: Subscription, Order, Invoice)

---

## Quick Fix Option

If manually copying sections is tedious, you have two easier options:

### **Option A: Disable Foreign Key Checks Temporarily**

Add this at the beginning of the original SQL file (after line 12):
```sql
-- Disable foreign key checks
SET session_replication_role = replica;
```

And this at the end (before the closing statements):
```sql
-- Re-enable foreign key checks
SET session_replication_role = DEFAULT;
```

This allows tables to be created in any order, and PostgreSQL will validate all foreign keys at the end.

### **Option B: Use the Corrected File**

I've created `10-04-2026-CORRECTED.sql` which has all tables in the correct order. You can use this file directly in Supabase SQL Editor.

---

## All Tables Summary (29 total)

1. _prisma_migrations
2. Branch
3. BrandingSettings
4. CarouselImage
5. customer_addresses
6. DryCleanItem
7. Holiday
8. SegmentCategory
9. ServiceCategory
10. ServicePriceConfig
11. SubscriptionPlan
12. SlotConfig
13. **User** ⚠️ (was at line 1176, needs to be here)
14. LaundryItem
15. OperatingHours
16. ServiceArea
17. SubscriptionPlanBranch
18. Address
19. Feedback
20. LaundryItemBranch
21. LaundryItemPrice
22. ItemSegmentServicePrice
23. Subscription
24. Order
25. OrderItem
26. Payment
27. Invoice
28. InvoiceItem
29. SubscriptionUsage

---

## Foreign Key Dependencies Map

```
Branch (no deps)
  └─ User
  │    └─ Address
  │    │    └─ Order
  │    │    │    └─ OrderItem
  │    │    │    └─ Payment
  │    │    │    └─ Invoice
  │    │    │         └─ InvoiceItem
  │    │    │    └─ SubscriptionUsage
  │    │    └─ Subscription
  │    │         └─ Payment
  │    │         └─ SubscriptionUsage
  │    └─ Feedback
  │    └─ Order (also refs Address, Subscription)
  │    └─ Subscription (also refs Address, SubscriptionPlan)
  └─ OperatingHours
  └─ ServiceArea
  └─ SubscriptionPlanBranch
  └─ Invoice

SubscriptionPlan (no deps)
  └─ Subscription
  └─ SubscriptionPlanBranch

LaundryItem (no deps)
  └─ LaundryItemBranch
  └─ LaundryItemPrice
  └─ ItemSegmentServicePrice
  └─ OrderItem
  └─ InvoiceItem
```

---

## Recommended Approach

**Easiest**: Use Option A - Add `SET session_replication_role = replica;` at the start and `SET session_replication_role = DEFAULT;` at the end of the original file. This requires minimal changes and lets you run the file as-is.

**Most Correct**: Use the tiered approach above to run sections in order. This ensures proper constraint validation during table creation.
