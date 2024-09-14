module "Project" {
  source        = "../infra"
  project_alias = var.project_alias
  rg_name       = "${var.project_alias}-Project"
  location      = var.location
  environment   = var.environment
  service_plan  = "${var.project_alias}SP"
  storacc_name  = "${var.project_alias}storacc"
}
