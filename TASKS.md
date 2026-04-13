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

## PROJECT 5 — AI & Integrations

### 🔴 Urgent

| # | Task | Detail | Blocked By |
|---|---|---|---|
| A-1 | Create OpenRouter account | openrouter.ai → generate API key → add credits | Nothing |
| A-2 | Update wisdomignited.com AI to use OpenRouter | Replace Anthropic direct API with OpenRouter endpoint | A-1 |
| A-3 | Add OPENROUTER_API_KEY to Kamatera .env | Replace ANTHROPIC_API_KEY | A-1 |

### 🟡 High

| # | Task | Detail | Blocked By |
|---|---|---|---|
| A-4 | Build RAG knowledge base | Embed all markdown docs from all repos into pgvector | I-1, A-1 |
| A-5 | Wire RAG into AI assistant | Two-layer: Llama 3.1 retrieval + Claude Sonnet reasoning | A-4 |
| A-6 | Auto-index on deploy | Re-embed docs on every push to main | A-4 |

### 🟢 Normal

| # | Task | Detail | Blocked By |
|---|---|---|---|
| A-7 | Add entity + document live sync to RAG | Embed wisdomignited.com DB records on create/update | A-5 |
| A-8 | Add Plane task sync to RAG | AI assistant can answer questions about current tasks | A-5, I-4 |
| A-9 | Add Mattermost bot | AI responds to @mentions in channels | A-5, I-3 |

---

## 💡 IDEAS & BRAINSTORM
*Potential features and client-facing options — to be refined into tasks*

### Client-Facing Features

| Idea | Description | Potential Value |
|---|---|---|
| **Client Portal — CIPR Dashboard** | Each client entity sees their own CIPR balance, trust line status, NFT credential, and transaction history. Read-only, Firebase-authenticated | High — gives members visibility into their on-chain position |
| **Client Portal — Document Request** | Client submits a document request from masseyrosupo.com → creates Plane task automatically → Trustee fulfills → client notified via email | High — formalizes the filing intake process |
| **Client Portal — Bill of Exchange Composer** | Client-facing simplified version of the admin BoE composer. Fills in parties, amount, selects UCC tender type → Trustee reviews and approves before minting | High — removes manual back-and-forth |
| **Client Portal — Settlement Tracker** | Shows each instrument's status: Issued → Tendered → Accepted → Discharged. Visual timeline per document | Medium — transparency builds trust |
| **Entity Public Profile** | Public page per entity (no auth) showing name, tier, type, XRPL address, membership NFT token ID, CIPR balance. Linked from masseyrosupo.com routing map | Medium — proof of membership for outside parties |
| **Membership Certificate PDF** | Auto-generated PDF certificate of trust network membership. Includes entity name, tier, NFT token ID, issuance date, Trustee signature field | Medium — physical/digital credential for clients |

### Operational Features

| Idea | Description | Potential Value |
|---|---|---|
| **Automated UCC-1 Filing** | When a document is registered in DocumentService, automatically trigger a Delaware SOS UCC-1 filing via a registered filing service API | High — removes manual step |
| **IRS EIN Verification** | Validate entity EIN on entry via IRS TIN Matching API before allowing document registration | High — prevents bad data |
| **XRPL Transaction Explorer** | Embedded in wisdomignited.com ledger — click any XRPL hash to see full transaction detail from XRPL mainnet | Medium — auditability |
| **Polygon Document Hashing** | On document upload, hash the file and submit to Polygon. Store hash in document record. Proves document existed at a point in time | Medium — legal provenance |
| **Multi-sig Treasury** | XRPL multi-signature account requiring 2-of-3 Trustee signatures for any treasury movement above a threshold | High — security for large movements |
| **Automated Reserve Report** | Weekly PDF report of CIPR reserve ratio, circulating supply, active trust lines, retired documents. Sent to Trustee via Mattermost | Medium — compliance record |

### DAO Features

| Idea | Description | Potential Value |
|---|---|---|
| **Proposal Templates** | Pre-built proposal types: Distribution, New Member, Document Approval, Reserve Adjustment. Members select template, fill fields | High — lowers barrier to governance participation |
| **Voting Power by Tier** | Tier 2 = 10 votes, Tier 3 = 3 votes, Tier 4 = 1 vote. Weighted by CIPR allocation | High — fair representation |
| **Snapshot Voting** | CIPR balance at proposal creation time determines voting power — prevents last-minute token transfers to sway votes | High — governance integrity |
| **On-chain Vote Record** | Every vote recorded as a CipherNex transaction with UCC memo. Immutable audit trail | High — legal defensibility |
| **Public Proposal Feed** | masseyrosupo.com public page showing active proposals, voting period, current result (yes/no/abstain counts). No auth needed | Medium — transparency |

### Technical Ideas

| Idea | Description | Potential Value |
|---|---|---|
| **Mobile App (React Native)** | wisdomignited.com as a native app. Access entity manager, ledger, AI assistant, Mattermost notifications from phone | High — iPad/iPhone access without browser limitations |
| **Offline Admin Mode** | Admin portal works offline — queues transactions locally, syncs when back online. Critical for air-gapped Trezor signing | High — security for cold wallet ops |
| **Hardware Security Module** | Replace software JWT secrets with HSM-backed keys. IBM Cloud HSM or AWS CloudHSM | Medium — enterprise-grade secret management |
| **IPFS Document Storage** | Upload documents to IPFS instead of local server. Hash stored on-chain. Documents survive server changes | Medium — decentralized storage |
| **Webhook Marketplace** | External parties can subscribe to CipherNex events (member provisioned, CIPR issued) via authenticated webhooks. Enables B2B integrations | Low — future monetization |

---

*Last updated: 2026-04-13 by Claude-onChain*
*Import this file into Plane once I-4 is complete.*

---

## PROJECT 5 — Ideas & Brainstorm

*Parking lot for concepts to explore — not yet scoped or scheduled.*

### 🧠 AI & Infrastructure

| # | Idea | Notes |
|---|---|---|
| B-1 | OpenRouter API integration | Replace direct Anthropic API calls with OpenRouter — one key, multiple models, pay per token. Use free Llama 3.1 8B for RAG retrieval, Claude Sonnet for reasoning |
| B-2 | RAG knowledge base | pgvector on ops server — embed all markdown docs, entity records, tasks, vault files. Powers smarter AI assistant in wisdomignited.com |
| B-3 | Two-layer AI architecture | Cheap model (Llama via OpenRouter) for retrieval → Claude Sonnet for final answer. Minimal cost, maximum quality |
| B-4 | Local LLM for Trezor sessions | Offline AI for cold wallet signing operations — no external API calls during sensitive operations. Needs dedicated ARM server (Hetzner CAX31 ~€7/mo) — defer until needed |
| B-5 | DAO GovernanceService | Proposals, voting weighted by CIPR balance + tier, quorum rules, treasury — new CipherNex microservice port 3007 |

### 🔗 Blockchain & Tokens

| # | Idea | Notes |
|---|---|---|
| B-6 | XRPL mainnet bridge | Connect CipherNex private chain to XRPL public ledger — every settlement produces a public XRPL tx hash stored in wisdomignited.com |
| B-7 | NFT member credentials (XLS-20) | Non-transferable, Trustee-burnable — one per entity. Architecture built, Trezor signing UI still needed in admin portal |
| B-8 | Public CIPR reserve status page | Read-only view on masseyrosupo.com — circulating supply, reserve ratio, trust lines |
| B-9 | Polygon document hashing | Hash each registered document on Polygon — immutable proof of existence. Already has hash fields in DB |

### 🏛️ Platform & DAO

| # | Idea | Notes |
|---|---|---|
| B-10 | wisdomignited.com DAO tab | Create proposals, cast votes, view treasury — after GovernanceService is built |
| B-11 | Public governance page on masseyrosupo.com | Transparency layer — proposal viewer, no auth required |
| B-12 | Member directory on wisdomignited.com | All 15 entities as members with CIPR balance, NFT status, tier, role |
| B-13 | External entity onboarding flow | Outside private entities joining the trust network — Firebase auth + AdminGateway observer/co-trustee provisioning |

---

## SESSION LOG — 2026-04-13

*What was accomplished this session — for continuity.*

| Done | Item |
|---|---|
| ✅ | All 3 repos merged to main (MasseyRosupo, Private_block_chain_Template, wisdom-platform) |
| ✅ | wisdom-vault created — all credentials, servers, DNS, recovery docs |
| ✅ | wisdom-mattermost, wisdom-plane, wisdom-notify repos created and pushed |
| ✅ | All 7 repos tagged v1.0.0 with GitHub Releases |
| ✅ | Remote feature branches deleted — all repos clean on main only |
| ✅ | Cloudflare DNS — api + admin subdomains added manually (pointing to 37.27.214.143) |
| ✅ | DNS confirmed live — api.wisdomignited.com resolving |
| ✅ | Decision: OpenRouter API instead of direct Anthropic for app AI |
| ✅ | Decision: Second Hetzner CX32 for ops (Mattermost + Plane + Notify) |
| ✅ | Decision: Option C architecture — CipherNex isolated, ops on separate server |
| ⏳ | Hetzner SSH access — workaround via second device in progress |
| ⏳ | Trezor now available — XRPL wallet generation next |
| ⏳ | Cloudflare DNS — chat + plane subdomains still pending |

## NEXT SESSION PRIORITIES

| Priority | Task | Notes |
|---|---|---|
| 1 | Regain Hetzner SSH via second device | Run rescue mode key generation |
| 2 | Generate XRPL hot wallet | node xrpl.js Wallet.generate() from Codespace |
| 3 | Set Trezor cold wallet address | Trezor Suite → Ethereum → m/44'/60'/0'/0/0 |
| 4 | Set UD ETH records | CipherNex.ministry + CipherNex.tribe |
| 5 | Provision new CX32 ops server | New Hetzner server for Mattermost + Plane |
| 6 | Update OpenRouter in wisdom-platform | Replace Anthropic direct API calls |
| 7 | Deploy Mattermost on ops server | Once SSH access restored |
| 8 | Deploy Plane on ops server | Import TASKS.md automatically via API |
