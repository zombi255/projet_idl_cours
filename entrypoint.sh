#!/bin/bash

# Exit on error
set -e
cd /app/api
# Apply database migrations
echo "Running migrations..."
python manage.py migrate --noinput

# Collect static files (optional)
# echo "Collecting static files..."
# python manage.py collectstatic --noinput

