package demo

test_smurf_can_get_book {
    allow with input as {
        "principal": {
            "name": "Random Smurf",
            "role": "smurf",
            "department": "forest",
            "age": 10
        },
        "action": "Get",
        "resource": {"name":"books", "title": "never ending story.."}
    }
}

test_stranger_cannot_access_forest_resources {
    not allow with input as {
        "principal": {
            "name": "Stranger",
            "role": "wizard",
            "department": "whoknows",
            "age": 200
        },
        "action": "Get",
        "resource": {"name":"books", "title": "never ending story.."}
    }
}

test_smurf_can_add_green_mushrom {
    allow with input as {
        "principal": {
            "name": "Random Smurf",
            "role": "smurf",
            "department": "forest",
            "age": 10
        },
        "action": "ADD",
        "resource": {"name":"mushrooms", "color": "green"}
    }
    allow with input as {"principal":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InNtdXJmIiwibmFtZSI6IlJlZ3VsYXIgU211cmYiLCJyb2xlIjoic211cmYiLCJkZXBhcnRtZW50IjoiZm9yZXN0IiwiaWF0IjoxNTU0NTgzNzkwfQ.nTpW9KbhpxMSbwZIoAhorayWRS6qxCHM4w1jKaWVQmw","action":"Get","resource":{"name":"mushrooms","color":"green"}}
}

test_papa_can_add_red_mushroom {
    allow with input as {
        "principal": {
            "name": "Papa",
            "role": "papa",
            "department": "forest",
            "age": 100
        },
        "action": "ADD",
        "resource": {"name":"mushrooms", "color": "red"}
    }
}
test_random_smurf_cannot_add_red_mushroom {
    not allow with input as {
        "principal": {
            "name": "Random Smurf",
            "role": "smurf",
            "department": "forest",
            "age": 10
        },
        "action": "ADD",
        "resource": {"name":"mushrooms", "color": "red"}
    }
    not allow with input as {
        "principal":{"id":"smurf","name":"Regular Smurf","role":"smurf","department":"forest"},
        "action":"ADD",
        "resource":{"name":"mushrooms","color":"red"}
    }
}

# test_kid_not_allowed_drinking_alcoholic_drinks {
#     not allow with input as {"role": "kid", "action": "drink", "resource": "alcoholic-drink"}
# }

# test_adult_allowed_all {
#     allow with input as {"role": "adult", "action": "drink", "resource": "whatever"}
# }
