# Sử dụng hình ảnh Python chính thức
FROM python:3.10-slim

# Đặt biến môi trường
ENV PYTHONUNBUFFERED 1

# Tạo thư mục làm việc
WORKDIR /app

# Sao chép tệp yêu cầu vào thư mục làm việc
COPY requirements.txt /app/

# Cài đặt các gói yêu cầu
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép toàn bộ mã nguồn vào thư mục làm việc
COPY . /app/

# Thiết lập biến môi trường cho Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Mở cổng 5000
EXPOSE 5000

# Chạy ứng dụng Flask
CMD ["flask", "run", "--host=0.0.0.0"]
