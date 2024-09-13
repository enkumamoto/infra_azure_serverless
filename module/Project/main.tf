module "project" {
  source       = "./infra"
  rg_name      = "${var.project_alias}-Project"
  location     = var.location
  environment  = var.environment
  service_plan = "${var.project_alias}Project${var.environment}Plan"
  storacc_name = "${var.project_alias}storacc"
}
