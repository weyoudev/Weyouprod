#!/bin/sh
# Entrypoint script for production container
# Usage: Set environment variable RUN_MIGRATIONS=true to run migrations before starting API

set -e

echo "🚀 Starting Weyou API container..."

# Check if we should run migrations first
if [ "$RUN_MIGRATIONS" = "true" ]; then
    echo "📦 RUN_MIGRATIONS is set to true"
    echo "🔄 Checking if Prisma CLI is available..."
    
    # Check if prisma is available
    if command -v npx >/dev/null 2>&1; then
        echo "✅ npx is available"
        
        # Check if schema exists
        if [ -f "src/infra/prisma/schema.prisma" ]; then
            echo "✅ Prisma schema found"
            echo "🔄 Running database migrations..."
            
            # Run migrations
            if npx prisma migrate deploy --schema=src/infra/prisma/schema.prisma; then
                echo "✅ Migrations completed successfully"
            else
                echo "❌ Migrations failed! Exiting..."
                exit 1
            fi
        else
            echo "⚠️  Prisma schema not found, skipping migrations"
        fi
    else
        echo "⚠️  npx not available, skipping migrations"
    fi
else
    echo "ℹ️  RUN_MIGRATIONS is not set (or set to false), skipping migrations"
    echo "💡 To run migrations, set environment variable: RUN_MIGRATIONS=true"
fi

echo "🌐 Starting API server..."
echo "📍 Server will listen on port ${PORT:-8080}"

# Start the API server
exec node -r tsconfig-paths/register dist/apps/api/src/bootstrap/main.js
