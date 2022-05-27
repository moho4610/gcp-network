
module "example" {
  source = "../../../terraform-modules"
  global_settings = var.global_settings
  projects = var.projects
  labels = local.labels
  networking = {
    vpcs =  var.vpcs
  }
  #compute = {
    #virtual_machines = var.virtual_machines
    #instance_templates = var.instance_templates
    #instance_groups = var.combined_objects_instance_groups
  #}
}