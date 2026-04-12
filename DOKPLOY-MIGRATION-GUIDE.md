# How to Run Prisma Migrations in Dokploy

## The Problem

Your API was getting `SCHEMA_OUT_OF_DATE` error because database migrations weren't being applied in production.

## The Solution

We've updated the Dockerfile to include a **migrator stage** that has Prisma available. Now you need to run migrations in Dokploy using one of these methods:

---

## Method 1: Run Migration via Dokploy Shell (Quick Fix)

### Step 1: Access Container Shell
1. Open your **Dokploy dashboard**
2. Go to your **API container/service**
3. Click on **Shell** or **Exec** to open a terminal in the running container

### Step 2: Run Migration Manually
```bash
# Navigate to API directory
cd /app/apps/api

# Run migrations
npx prisma migrate deploy --schema=src/infra/prisma/schema.prisma
```

### Step 3: Restart Container
After migrations complete successfully, restart the container from Dokploy dashboard.

---

## Method 2: Use Init Container (Recommended for Production)

### Update Your Dokploy Configuration

If Dokploy supports init containers or pre-start commands, add this:

```yaml
# In your Dokploy deployment configuration
initCommand: |
  cd /app
  npm ci --ignore-scripts
  npx prisma migrate deploy --schema=apps/api/src/infra/prisma/schema.prisma
```

---

## Method 3: Two-Step Deployment (Most Reliable)

### Step 1: Create Migration Script

Create a separate deployment just for migrations:

1. In Dokploy, create a **new service** called "api-migrations"
2. Use the same Dockerfile but with this CMD:
   ```dockerfile
   CMD ["sh", "-c", "cd /app && npm ci --ignore-scripts && npx prisma migrate deploy --schema=apps/api/src/infra/prisma/schema.prisma"]
   ```
3. Run this service **before** deploying the API
4. Once migrations complete, the service will exit

### Step 2: Deploy API
After migrations succeed, deploy your API service normally.

---

## Method 4: Manual Migration from Local Machine

If you have database access from your local machine:

```bash
# From repo root
npm run prisma:migrate

# Or specifically for production
DATABASE_URL="your-production-database-url" npx prisma migrate deploy --schema=apps/api/src/infra/prisma/schema.prisma
```

---

## Verify Migration Success

### Check Migration Status
```bash
# In container shell or locally
npx prisma migrate status --schema=apps/api/src/infra/prisma/schema.prisma
```

### Check Database
Connect to your database and verify tables exist:
```sql
SELECT table_name FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;
```

---

## What We Changed

### Updated Dockerfile
- Added **migrator stage** with full Prisma dependencies
- Production container stays lightweight (no Prisma CLI)
- Migrations run separately from API startup

### Why This Approach?
✅ **Smaller production image** - Prisma CLI not in final container  
✅ **Faster startup** - API doesn't wait for migrations on every restart  
✅ **Safer deployments** - Migrations can be verified before API starts  
✅ **Better separation of concerns** - Migration and runtime are separate  

---

## Recommended Workflow for Future Deployments

1. **Push code changes** to repository
2. **Run migrations first** (Method 1 or 4)
3. **Deploy API** in Dokploy
4. **Verify** API is working
5. **Test** login and features

---

## Troubleshooting

### Migration Fails with Connection Error
- Check `DATABASE_URL` environment variable in Dokploy
- Verify database is accessible from the container
- Check firewall/network settings

### Migration Says "Already Up to Date"
- This is good! It means schema is already synced
- The `SCHEMA_OUT_OF_DATE` error was from something else
- Check Prisma client was generated correctly

### Container Still Crashes
- Check container logs in Dokploy
- Verify all environment variables are set:
  - `DATABASE_URL`
  - `JWT_SECRET`
  - `PORT` (should be 8080 for Docker)
  - `NODE_ENV=production`

---

## Quick Fix Right Now

**Do this immediately to get your API working:**

1. Open Dokploy dashboard
2. Access API container shell
3. Run:
   ```bash
   cd /app/apps/api
   npx prisma migrate deploy --schema=src/infra/prisma/schema.prisma
   ```
4. Restart container
5. API should work now!

---

## Need Help?

Check container logs in Dokploy for specific error messages. Common issues:
- Database connection problems
- Missing environment variables
- Migration conflicts
- Prisma schema syntax errors
