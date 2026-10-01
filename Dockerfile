FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all files into container root /app
COPY . .

# Set Python module path so Python finds packages inside Symbiosis-stack
ENV PYTHONPATH=/app/Symbiosis-stack:/app

EXPOSE 10000

# Run Uvicorn directly from /app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
