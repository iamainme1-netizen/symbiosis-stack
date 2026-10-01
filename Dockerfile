FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all files into container
COPY . .

# Set PYTHONPATH to search inside the nested Symbiosis-stack directory
ENV PYTHONPATH=/app/Symbiosis-stack:/app/Symbiosis-stack/app:/app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

EXPOSE 10000

# Start Uvicorn pointing directly to main:app or app.main:app via module resolution
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "10000"]
