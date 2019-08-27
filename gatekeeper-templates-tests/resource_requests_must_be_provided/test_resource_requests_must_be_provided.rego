package containerresourcerequired

test_correct_resource {
     count(violation) = 0 with input as 
        {"review":{
          "object":
                {"spec":{"template":{"spec": 
                    {"containers": [
                        {"resource": {
                          "requests":{"cpu": "100m","memory": "40Mi"},
                          "limits":{"cpu": "100m","memory": "40Mi"}
                        }}
                    ]}
                }}}},
          "parameters": {
              "requests": ["memory","cpu"],
              "limits": ["memory","cpu"]
          }}
}

test_correct_resource_limits {
     count(violation) = 0 with input as 
        {"review":{
          "object":
                {"spec":{"template":{"spec": 
                    {"containers": [
                        {"resource": {
                          "limits":{
                            "cpu": "100m",
                            "memory": "40Mi"
                          }}}
                    ]}
                }}}},
          "parameters": {
              "limits": ["memory","cpu"]
          }}
}

test_missing_resource_requests {
     count(violation) > 0 with input as 
        {"review":{
          "object":
                {"spec":{"template":{"spec": 
                    {"containers": [
                        {"resource": {
                          "limits":{
                            "cpu": "100m",
                            "memory": "40Mi"
                          }}}
                    ]}
                }}}},
          "parameters": {
              "requests": ["memory","cpu"],
              "limits": ["memory","cpu"]
          }}
}

test_missing_resource_limits {
     count(violation) > 0 with input as 
        {"review":{
          "object":
                {"spec":{"template":{"spec": 
                    {"containers": [
                        {"resource": {
                          "requests":{
                            "cpu": "100m",
                            "memory": "40Mi"
                          }}}
                    ]}
                }}}},
          "parameters": {
              "requests": ["memory","cpu"],
              "limits": ["memory","cpu"]
          }}
}