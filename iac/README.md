## Terraform Configuration Overview

- **Terraform Setup**:
  - Configures the `render-oss/render` provider, version `~> 1.6.0`.

- **Defined Variables**:
  - `render_api_key`: Render API key for authentication.
  - `render_service_id`: ID of the existing Render Web Service.

- **Resource Import**:
  - Imports an existing `render_web_service` using the provided `render_service_id`.

- **Resource: `render_web_service` (`mini_api`)**:
  - **Service Name**: `mini-api`.
  - **Plan**: `starter`.
  - **Region**: `oregon`.
  - **Environment ID**: Placeholder (must be updated with the correct environment ID).
  - **Runtime Source**:
    - Deployment from **Docker**.
    - **Auto Deploy**: Enabled (`true`).
    - **Registry**: `docker.io`.
    - **Branch**: `master`.
    - **Repository URL**: `30281856/mini-api`.
    - **Image URL**: `30281856/mini-api`.
    - **Image Tag**: `latest`.
