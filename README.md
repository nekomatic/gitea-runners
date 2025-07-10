
# 🐳 Gitea Act Runner with Ansible

This Docker image extends the official `gitea/act_runner` with Ansible and custom Python dependencies installed via `requirements.txt`.

It supports automatic registration to a Gitea instance using environment variables.

---

## 🚀 Quick Start with Docker

### 🔧 Required Environment Variables

| Variable              | Description                                 | Example                       |
|-----------------------|---------------------------------------------|-------------------------------|
| `GITEA_INSTANCE_URL`  | URL of your Gitea server                    | `https://gitea.example.com`   |
| `GITEA_RUNNER_TOKEN`  | Registration token from Gitea               | `ghp_xxxxxx`                  |
| `GITEA_RUNNER_NAME`   | Name for this runner                        | `my-ansible-runner`           |
| `GITEA_RUNNER_LABELS` | Labels this runner supports                 | `ubuntu-latest:docker`        |

---

### 🐳 Run with `docker run`

```bash
docker run -d \
  --name gitea-ansible-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v gitea_runner_data:/data \
  -e GITEA_INSTANCE_URL=https://gitea.example.com \
  -e GITEA_RUNNER_TOKEN=your_token_here \
  -e GITEA_RUNNER_NAME=my-ansible-runner \
  -e GITEA_RUNNER_LABELS=ubuntu-latest:docker \
  bsmeding/gitea-act-runner-ansible:latest
```

---

## 📦 Use with Docker Compose

### 1. `.env` file

Create a `.env` file in the same directory as your `docker-compose.yml`:

```dotenv
GITEA_INSTANCE_URL=https://gitea.example.com
GITEA_RUNNER_TOKEN=your_token_here
GITEA_RUNNER_NAME=my-ansible-runner
GITEA_RUNNER_LABELS=ubuntu-latest:docker
```

### 2. `docker-compose.yml`

```yaml
version: "3"

services:
  gitea-ansible-runner:
    image: bsmeding/gitea-act-runner-ansible:latest
    container_name: gitea-ansible-runner
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - gitea_runner_data:/data
    env_file:
      - .env

volumes:
  gitea_runner_data:
```

### Start it

```bash
docker compose up -d
```

---

## 📎 Notes

- The runner registers automatically on first run.
- If `/data/config.yaml` exists, re-registration is skipped.
- Python packages (e.g., Ansible) are installed from `requirements.txt`.

---

## 🧪 Verify Ansible

```bash
docker run bsmeding/gitea_runner
```

---

## 🧑‍💻 Author

Maintained by **https://netdevops.it**. Based on `gitea/act_runner`.