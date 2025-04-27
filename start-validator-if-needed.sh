#!/bin/bash

# ------------------------------------
# Start Solana Validator (Only if Needed)
# ------------------------------------

CONTAINER_NAME="solana-test-validator"

# Check if Docker container is running
if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}\$"; then
    echo "✅ Validator already running: $CONTAINER_NAME"
else
    echo "🚀 Starting validator container: $CONTAINER_NAME"
    docker start $CONTAINER_NAME 2>/dev/null || docker run --name $CONTAINER_NAME -d -p 8899:8899 solanalabs/solana:v1.18.8 solana-test-validator --ledger /validator-ledger --rpc-port 8899 -no=bpf-jit
    echo "⏳ Waiting 10 seconds for validator to initialize..."
    sleep 10
    echo "💸 Airdropping 100 SOL to your wallet..."
    solana airdrop 100
    echo "💰 Wallet balance:"
    solana balance
fi