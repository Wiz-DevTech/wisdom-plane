# wisdom-plane

Self-hosted project management for **Wisdom Ignited Business Trust**.
Replaces ClickUp. Live at **https://plane.wisdomignited.com**

**Server:** Hetzner Cloud `ciphernex-node-1` — `37.27.214.143`

---

## First-Time Setup

```bash
# 1. SSH into Hetzner
ssh -i ciphernex-hetzner root@37.27.214.143

# 2. Clone repo
git clone https://github.com/Wiz-DevTech/wisdom-plane.git /opt/wisdom-plane
cd /opt/wisdom-plane

# 3. Create env file
cp .env.template .env
# Generate secret key:
python3 -c "import secrets; print(secrets.token_hex(25))"
nano .env   # set PLANE_DB_PASSWORD and PLANE_SECRET_KEY

# 4. Create shared Docker network (if not exists)
docker network create wisdom-ops-net 2>/dev/null || true

# 5. Start
docker compose up -d

# 6. Add DNS record (from Codespace)
bash scripts/add-dns.sh
```

## After First Login

1. Visit **https://plane.wisdomignited.com** — complete setup wizard
2. Create workspace: `wisdom-ignited`
3. Create three projects:
   - **CipherNex** — blockchain + member provisioning tasks
   - **Entities** — entity formation + compliance actions
   - **Infrastructure** — server + deployment tasks
4. Go to **Profile → API Tokens → Add Token**
5. Copy token → paste into `wisdom-notify` `.env` as `PLANE_API_TOKEN`
6. Copy each project ID → paste into `wisdom-notify` `.env`

## Required GitHub Secret

| Secret | Value |
|---|---|
| `SERVER_SSH_KEY` | `ciphernex-hetzner` ED25519 private key |
