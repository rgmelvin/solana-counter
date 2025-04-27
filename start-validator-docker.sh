#!/bin/bash

# --------------------------------------------------
# Solana Validator Startup Script (Docker)
#--------------------------------------------------
# - Stops and removes any old validator
# - Starts a fresh validator
# - Waits for validator to initialize
# - Airdrops 100 SOL into the default wallet
# - Displays wallet balance
# --------------------------------------------------

# Stop and remove any old container if it exists
echo "🛑 Stopping and removing old validator (if any)..."
docker stop solana-test-validator 2>/dev/null
docker rm -f solana-test-validator 2>/dev/null

# Start a new validator container
echo "🚀 Starting fresh validator..."
docker run --name solana-test-validator -d -p 8899:8899 -p 8900:8900 solanalabs/solana:v1.18.8 solana-test-validator --ledger /validator-ledger --rpc-port 8899 --no-bpf-jit

# Wait for the validator to fully boot up
echo "⏳ Waiting 10 seconds for the validator to initialize..."
sleep 10

# Airdrop 100 SOL to the default wallet
echo "💸 Airdroping 100 SOL to your wallet..."
solana airdrop 100

# Display the new wallet balance
echo "💰 Wallet balance:"
solana balance

echo "✅ Validator is running and wallet is funded! Ready for development."