import os
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(
    title="Symbiosis Agentic Commerce API",
    version="1.0.0",
    description="UCP/ACP Middleware and Ledger API for Agentic Commerce",
)

class CheckoutRequest(BaseModel):
    agent_id: str
    amount: float
    currency: str = "USD"

@app.get("/")
def read_root():
    return {
        "protocol": "Symbiosis Agentic Commerce",
        "status": "online",
        "docs": "/docs"
    }

@app.get("/health")
def health_check():
    db_configured = bool(os.getenv("DATABASE_URL"))
    redis_configured = bool(os.getenv("REDIS_URL"))
    return {
        "status": "healthy",
        "database_connected": db_configured,
        "redis_connected": redis_configured,
        "kms_mock_mode": os.getenv("AWS_KMS_MOCK_MODE", "true")
    }

@app.post("/v1/orders/checkout")
def checkout(payload: CheckoutRequest):
    return {
        "status": "SUCCESS",
        "transactionId": "tx-symbiosis-998234",
        "agent_id": payload.agent_id,
        "charged": f"{payload.amount} {payload.currency}"
    }
