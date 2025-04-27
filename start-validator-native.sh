#!/bin/bash

# ----------------------------------------
# Native Solana Validator Startup Script
# ----------------------------------------
# - Stops and removes old Docker validator if running
# - Starts a native solana-test-validator process
# - Airdrops 100 SOL to the default wallet
# ----------------------------------------

# Sltop and remove any Docker validator if it exists
echo "🛑 Stopping Docker validator (if any)..."
docker stop solana-test-validator 2>/dev/null
docher rm solana-test-validator 2>/dev/null

# Start native validator
echo "🚀 Starting native solana-test validator..."
solana-test-validator --ledger /tmp/test-ledger --reset

# Capture validator PID
VALIDATOR_PID=$!

# Wait for validator to boot
echo "⏳ Waiting 10 seconds for validator to intialize..."
sleep 10

# Airdrop SOL
echo "💸 Airdropping 100 SOL to your wallet..."
solana airdrop 100

# Show wallet balance
echo "💰 Wallet balance:"
solana balance

# Wait for validator to keep running
wait $VALIDATOR_PID