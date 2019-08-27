package k8srequiredlabels

test_missing_labels {
     count(violation) > 0 with input as 
        {"review":
            {"object":
                {"metadata":{"labels":{
                    "wrong":"label"
            }}}},
            "parameters": {
                "labels": [
                    "correct"
                ]}}
}

test_correct_labels {
     count(violation) = 0 with input as 
        {"review":
            {"object":
                {"metadata":{"labels":{
                    "correct":"label"
            }}}},
            "parameters": {
                "labels": [
                    "correct"
                ]}}
}