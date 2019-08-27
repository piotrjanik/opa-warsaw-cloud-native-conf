package containerresourcerequired

violation[{"msg": msg, "details": {"wrong_containers": wrong_containers}}] {
  containers := {c | c := input.review.object.spec.template.spec.containers[_]}

  required_types := { k |  input.parameters[k] }

  wrong_containers := { containers[c] |
    type_to_check = required_types[_]
    
    required_keys := {k | k=input.parameters[type_to_check][_]}
    provided_keys := {k | containers[c].resource[type_to_check][k]}
    
    missing_keys := required_keys - provided_keys
    count(missing_keys) > 0
    
  }
  
  count(wrong_containers) > 0
  msg := sprintf("Please add resource requests to these containers: %v", [wrong_containers])
}