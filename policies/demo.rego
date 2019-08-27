package demo

import data.policies
default allow = false

allow = true {
    check[_policies]
}

check[_policies] {
    check_principal[_policies]
    check_resource[_policies]
    check_action[_policies]
}

check_action[policies[p]] {
    policies[p].action = "*"
}

check_action[policy] {
    policies[p] = policy
    policy.action[_] = input.action
}

decode_jwt(p) = payload {
    is_string(p)
    io.jwt.decode(p, [header, payload, sig])
}

check_principal[policies[p]] {
    policies[p].principal = "*"
}

check_principal[policy] {
    token := decode_jwt(input.principal)
    principal := policies[p].principal
    keys := [ k | principal[k] ]
    token_reduced_fields := { k:v  | principal[k]; token[k]=v}
    principal = token_reduced_fields
    policies[p] = policy
}

check_resource[policies[p]] {
    policies[p].resources = "*"
}

check_resource[policy] {
    resource := policies[p].resources[r]
    keys := [ k | resource[k] ]
    input_resource_subset := { k:v  | resource[k]; input.resource[k]=v}
    resource = input_resource_subset
    policies[p] = policy
}