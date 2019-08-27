package k8scheckingresshost

violation[{"msg": msg, "details": {"wrong_hosts": wrong_hosts}}] {
  input.review.object.kind = "Ingress"
  host_list_from_ingress := {host | host := input.review.object.spec.rules[_].host}
  namespace := input.review.object.metadata.namespace
  correct_hosts := {host_list_from_ingress[i] | re_match(namespace, host_list_from_ingress[i]) }
  wrong_hosts := host_list_from_ingress - correct_hosts
  count(wrong_hosts) > 0
  msg := sprintf("hostnames: %v in ingress controller should container namespace name: %v", [wrong_hosts,namespace])
}