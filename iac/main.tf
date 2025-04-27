terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.6.0"
    }
  }
}

variable "render_api_key" {
  type        = string
  description = "api key Render"
}

variable "render_service_id" {
  type        = string
  description = "ID del Web Service existente en Render"
}

import {
  to = render_web_service.mini_api
  id = var.render_service_id
}

resource "render_web_service" "mini_api" {
  name           = "mini-api"
  plan           = "starter"
  region         = "oregon"
  environment_id = "" //Here goes de ID for de environment in which are going to be set de variables
  runtime_source = {
    docker = {
      auto_deploy = true
      registry    = "docker.io"
      branch      = "master"
      repo_url    = "30281856/mini-api"
      image_url   = "30281856/mini-api"
      tag         = "latest"
    }
  }
}
