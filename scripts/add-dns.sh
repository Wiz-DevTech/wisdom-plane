#!/bin/bash
# Adds plane.wisdomignited.com → 37.27.214.143 to Cloudflare
# Run from Codespace: bash scripts/add-dns.sh
set -e
CF_TOKEN="cfat_kxUu6SqUtwJ8JFJP4OuwigFEtRkb8OpgKgGw04EL1db53869"
ZONE_ID=$(curl -s "https://api.cloudflare.com/client/v4/zones?name=wisdomignited.com" \
  -H "Authorization: Bearer ${CF_TOKEN}" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['result'][0]['id'])")
echo "Zone: $ZONE_ID"
curl -s -X POST "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records" \
  -H "Authorization: Bearer ${CF_TOKEN}" \
  -H "Content-Type: application/json" \
  --data '{"type":"A","name":"plane","content":"37.27.214.143","ttl":1,"proxied":true}' \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print('✅ plane.wisdomignited.com created' if d['success'] else '❌ '+str(d['errors']))"
