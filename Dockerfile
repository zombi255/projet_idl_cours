FROM python:3.12-slim

WORKDIR /app

# تثبيت المكتبات الأساسية للنظام
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# نسخ ملف المتطلبات من مجلد المشروع
COPY myproject/requirements.txt /app/requirements.txt

# تثبيت dependencies
RUN pip install --no-cache-dir -r requirements.txt

# نسخ كامل المشروع
COPY myproject/ /app/

# ضبط PORT الديناميكي لـ Render
ENV PORT 10000  # قيمة افتراضية فقط، Render سيعطي متغيره الخاص

# تشغيل الخادم باستخدام PORT الذي يوفره Render
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:$PORT"]
