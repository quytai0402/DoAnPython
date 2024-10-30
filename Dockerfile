# Sử dụng hình ảnh Python chính thức
FROM python:3.10-slim

# Đặt thư mục làm việc trong container
WORKDIR /app

# Cài đặt các thư viện phát triển PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc

# Sao chép các tệp yêu cầu vào container
COPY requirements.txt requirements.txt

# Cài đặt các gói yêu cầu
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Thiết lập biến môi trường
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Mở cổng 5000
EXPOSE 5000

# Chạy ứng dụng Flask
CMD ["python", "app.py"]
