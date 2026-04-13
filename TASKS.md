# Wisdom Ignited — Task Board
*Source of truth until Plane is deployed. Import into Plane projects once live.*

---

## PROJECT 1 — Infrastructure

### 🔴 Urgent

| # | Task | Detail | Blocked By |
|---|---|---|---|
| I-1 | Regain Hetzner SSH access | Rescue mode — need desktop/laptop to paste key | iPad limitation |
| I-2 | Configure Nginx on Hetzner | Route api/admin/chat/plane subdomains | I-1 |
| I-3 | Deploy Mattermost | Clone wisdom-mattermost, run docker compose up | I-1 |
| I-4 | Deploy Plane | Clone wisdom-plane, run docker compose up | I-1 |
| I-5 | Deploy NotificationService | Clone wisdom-notify, npm install, pm2 start | I-1 |
| I-6 | Add SERVER_SSH_KEY secret to 4 repos | Private_block_chain_Template, wisdom-mattermost, wisdom-plane, wisdom-notify | I-1 |

### 🟡 High

| # | Task | Detail | Blocked By |
|---|---|---|---|
| I-7 | Set CIPHERNEX_API_HOST secret | MasseyRosupo → Settings → Secrets → `http://37.27.214.143` | Nothing |
| I-8 | Add Cloudflare DNS — api + admin | Already done ✅ | — |
| I-9 | Add Cloudflare DNS — chat + plane | Run wisdom-mattermost/scripts/add-dns.sh + wisdom-plane/scripts/add-dns.sh from Codespace | Nothing |
| I-10 | SSL upgrade on wisdomignited.com | `bash scripts/ssl.sh wisdomignited.com` → Cloudflare Full Strict | I-1 |
| I-11 | Update CIPHERNEX_ADMIN_URL in wisdom-platform .env | Change from IP to https://admin.wisdomignited.com | I-2 |

### 🟢 Normal

| # | Task | Detail | Blocked By |
|---|---|---|---|
| I-12 | Set up Mattermost channels | #ciphernex #entities #deploys #ops | I-3 |
| I-13 | Create Mattermost incoming webhooks | One per channel → wisdom-notify .env | I-12 |
| I-14 | Create Plane workspace + 3 projects | CipherNex, Entities, Infrastructure | I-4 |
| I-15 | Get Plane API token + project IDs | Plane → Profile → API Tokens | I-14 |
| I-16 | Fill wisdom-notify .env | Webhook URLs + Plane token + project IDs | I-13, I-15 |
| I-17 | Wire deploy notifications to Mattermost | Add notify step to all GitHub Actions deploy workflows | I-13 |

---

## PROJECT 2 — CipherNex

### 🔴 Urgent

| # | Task | Detail | Blocked By |
|---|---|---|---|
| C-1 | Generate XRPL hot wallet | Run xrpl.js Wallet.generate() from Codespace — save to vault | Nothing |
| C-2 | Get Trezor cold wallet address | Trezor Suite → Ethereum → m/44'/60'/0'/0/0 | Trezor device |
| C-3 | Set ETH record on CipherNex.ministry | Unstoppable Domains → cold wallet address | C-2 |
| C-4 | Set ETH record on CipherNex.tribe | Unstoppable Domains → hot wallet address | C-1 |
| C-5 | Update CIPR_ISSUER_ADDRESS in Hetzner .env | Real rAddress from Trezor | C-2, I-1 |
| C-6 | Update CIPR_HOT_WALLET_ADDRESS in Hetzner .env | Real rAddress from hot wallet | C-1, I-1 |
| C-7 | Restart CipherNex containers after env update | docker compose restart | C-5, C-6, I-1 |
| C-8 | Verify /ready endpoint shows true for both wallets | curl http://37.27.214.143:3001/ready | C-7 |

### 🟡 High

| # | Task | Detail | Blocked By |
|---|---|---|---|
| C-9 | Add xrpl.js SDK to blockchain repo | npm install xrpl — XRPL mainnet bridge | C-5, C-6 |
| C-10 | Build XRPL mainnet bridge | Submits CipherNex settlements to XRPL public ledger | C-9 |
| C-11 | Provision first member entity | POST /admin/members/provision — Trezor TrustSet + CIPR issue + NFT | C-8 |
| C-12 | Complete Trezor NFT signing in admin portal | admin-portal.html Trezor Connect UI for NFTokenMint | C-11 |
| C-13 | Wire CipherNex events to NotificationService | Add NOTIFICATION_URL to Hetzner .env | I-5, I-1 |

### 🟢 Normal

| # | Task | Detail | Blocked By |
|---|---|---|---|
| C-14 | Enable Protocol Microservice | PROTOCOL_SERVICE_ENABLED=true | I-1 |
| C-15 | Add MetaMask to all team members | RPC: 37.27.214.143:8545, Chain ID: 777287 | Nothing |
| C-16 | Import genesis accounts to MetaMask | From Genesis-accounts.json on server | C-15, I-1 |
| C-17 | Begin DAO GovernanceService design | Proposals, voting, quorum, treasury | C-11 |

---

## PROJECT 3 — Entities

### 🔴 Urgent

| # | Task | Detail | Blocked By |
|---|---|---|---|
| E-1 | Re-execute W-8BEN | Expired Oct 2024 — item 12311982-TAM-W8BEN | Nothing |
| E-2 | Re-notarize Certificate of Trust | Expired notary commission | Nothing |
| E-3 | Open Mercury Bank account | mercury.com — WIBT EIN 92-6269777 | Nothing |
| E-4 | Open TreasuryDirect Entity account | EIN 92-6269777 | Nothing |
| E-5 | Apply for EDGAR Filer Access | efts.sec.gov | Nothing |
| E-6 | File Unsigned UCC-3 Amendment | Item 12311982-TAM-CAD | Nothing |
| E-7 | Retrieve SAM.gov Registration | 866-606-8220 | Nothing |
| E-8 | Confirm MPRS Capital EIN | IRS 800-829-4933 | Nothing |

### 🟡 High

| # | Task | Detail | Blocked By |
|---|---|---|---|
| E-9 | Set XRPL wallet address for each entity | wisdomignited.com → entity → blockchain.xrpl field | C-1 |
| E-10 | Provision all Tier 3 entities as members | POST /api/entities/:id/provision | C-8, E-9 |
| E-11 | Provision all Tier 4 entities as members | Same | E-10 |
| E-12 | Complete Trezor NFT mint for all members | One per entity via admin portal | C-12 |
| E-13 | Wire urgent docs to NotificationService | wisdom-platform → POST /notify/entities on doc.status=urgent | I-16 |

### 🟢 Normal

| # | Task | Detail | Blocked By |
|---|---|---|---|
| E-14 | Form Ecclesiastical Trust Instrument | Foundation document | Nothing |
| E-15 | Form Wisdom Tribe Fellowship | 508c1a declaration | Nothing |
| E-16 | Form KWA — Articles + Form 1023 | 501c3 formation | Nothing |
| E-17 | Form Wise Legacy Estates LLC | Articles + Operating Agreement | Nothing |
| E-18 | Form Wisdom Analytica LLC | Articles + Operating Agreement | Nothing |
| E-19 | Form Wiz-Dev Tech LLC | Articles + Operating Agreement | Nothing |
| E-20 | Form Divine Signs LLC | Articles + Operating Agreement | Nothing |
| E-21 | Form Wisdom Academy | Charter application under KWA | E-16 |
| E-22 | Ann B. Wiseman — IRS Registration | Withholding agent designation | Nothing |
| E-23 | Add Massey & Rosupo to wisdomignited.com entities | Currently in masseyrosupo.com but not in platform | Nothing |

---

## PROJECT 4 — masseyrosupo.com

### 🟡 High

| # | Task | Detail | Blocked By |
|---|---|---|---|
| M-1 | Add CIPHERNEX_API_HOST GitHub secret | `http://37.27.214.143` — triggers working admin portal deploy | Nothing |
| M-2 | Update CIPHERNEX_CONFIG_JSON secret | Once subdomains live — per-service URLs | I-2 |
| M-3 | Complete Trezor NFT signing UI in admin portal | admin-portal.html Trezor Connect integration | C-12 |
| M-4 | Wire document registration to AdminGateway | index.html form → POST /admin/document | I-2 |

### 🟢 Normal

| # | Task | Detail | Blocked By |
|---|---|---|---|
| M-5 | Add public CIPR reserve status page | Read-only view of reserve ratio + trust lines | I-2 |
| M-6 | Add wisdomignited.com member directory link | wisdomignited.com integration hook | Nothing |

---

## DAO (Future)

| # | Task | Detail | Blocked By |
|---|---|---|---|
| D-1 | Design GovernanceService.js | Proposals, voting weights, quorum rules | C-17 |
| D-2 | Build GovernanceService | New CipherNex microservice port 3007 | D-1 |
| D-3 | DAO panel in wisdomignited.com | Create proposals, cast votes, treasury view | D-2 |
| D-4 | Public proposal page on masseyrosupo.com | Governance transparency layer | D-3 |

---

*Last updated: 2026-04-13 by Claude-onChain*
*Import this file into Plane once I-4 is complete.*
