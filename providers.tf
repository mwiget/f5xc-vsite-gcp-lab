provider "restapi" {
  uri = var.f5xc_api_url
  create_returns_object = true
  headers = {
    Authorization = format("APIToken %s", var.f5xc_api_token)
    Content-Type  = "application/json"
  }
}

provider "google" {
  alias = "europe_west6"
  region  = "europe-west6"
  project = var.gcp_project_id
  credentials = file(var.gcp_credentials_file)
}
