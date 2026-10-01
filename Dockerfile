FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Add all potential package paths to PYTHONPATH
ENV PYTHONPATH=/app/Symbiosis-stack:/app/Symbiosis-stack/app:/app

EXPOSE 10000

CMD ["uvicorn", "Symbiosis-stack.main:app", "--host", "0.0.0.0", "--port", "10000"]
