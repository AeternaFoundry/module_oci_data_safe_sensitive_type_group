resource "oci_data_safe_sensitive_type_group" "data_safe_sensitive_type_groups" {
  for_each = var.data_safe_sensitive_type_groups

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

