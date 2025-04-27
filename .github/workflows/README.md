# Quick Overview: Deploy on Tag (Master)

- **Triggers**:
  - Push to `master` branch.
  - Push of a tag starting with `v` (e.g., `v1.0.0`).

- **Runs On**: `ubuntu-latest`.

- **Main Steps**:
  - Checkout the repository (`actions/checkout@v4`).
  - Login to Docker Hub using `DOCKER_TOKEN` secret.
  - Build Docker image: `30281856/mini-api:latest`.
  - Push the Docker image to Docker Hub.
  - Trigger deployment via Render.com API (`RENDER_SERVICE_ID` and `RENDER_SERVICE_KEY` secrets).

---

