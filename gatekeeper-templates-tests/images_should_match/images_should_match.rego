package k8simagesshouldmatch

violation[{"msg": msg, "details": {"wrong_images": wrong_images}}] {
  all_images_from_object := {images | images := input.review.object.spec.template.spec.containers[_].image}
  regex_list:= {regex | regex := input.parameters.imageMatches[_]}
  single_regex := regex_list[_]
  wrong_images := {all_images_from_object[i] | not re_match(single_regex, all_images_from_object[i]) }
  count(wrong_images) > 0
  msg := sprintf("these images are not allowed: %v", [wrong_images])
}