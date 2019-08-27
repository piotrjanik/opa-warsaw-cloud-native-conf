package k8scheckingresshost

test_host_contains_namespace_name {
    count(violation) = 0 with input as {
    "review": {
        "object": {
            "apiVersion": "networking.k8s.io/v1beta1",
            "metadata": {
                "namespace": "hello"
            },
            "kind": "Ingress",
            "spec": {
                "rules": [
                    {
                        "host": "hello.dev"
                    }
                ]
            }
        }
    }}
}

test_host_doesnt_contain_namespace_name {
    count(violation) > 0  with input as {
    "review": {
        "object": {
            "apiVersion": "networking.k8s.io/v1beta1",
            "metadata": {
                "namespace": "hello"
            },
            "kind": "Ingress",
            "spec": {
                "rules": [
                    {
                        "host": "booo.dev"
                    }
                ]
            }
        }
    }}
}