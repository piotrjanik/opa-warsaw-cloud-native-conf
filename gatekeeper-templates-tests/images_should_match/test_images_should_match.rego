package k8simagesshouldmatch


test_incorrect_image_should_be_rejected {
     count(violation) > 0 with input as 
        {"review":
            {"object":
                {"spec":{"template":{"spec": 
                    {"containers": [
                        {"image": "incorrect/images:sometag"}
                    ]}
                }}}},
            "parameters": {
                "imageMatches": [
                    "^correct"
                ]}}
}

test_correct_image_should_be_allowed {
     count(violation) = 0 with input as 
        {"review":
            {"object":
                {"spec":{"template":{"spec": 
                    {"containers": [
                        {"image": "correct/images:sometag"}
                    ]}
                }}}},
            "parameters": {
                "imageMatches": [
                    "^correct"
                ]}}
}
