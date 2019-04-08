package sample

test_john_from_warsaw_is_approved {
    allow with input as {"name":"John","city": "Warsaw"}
}

test_john_from_moon_is_rejected {
    not allow with input as {"name":"John","city": "Moon"}
}
