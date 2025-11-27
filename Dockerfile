FROM python:3.12-slim

WORKDIR /app

# تثبيت المكتبات الأساسية للنظام
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# نسخ ملف المتطلبات
COPY myproject/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# نسخ المشروع كله
COPY myproject/ /app/

Copy entrypoint and set it
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# تشغيل Django على المنفذ الذي يوفره Render
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:$PORT"]



