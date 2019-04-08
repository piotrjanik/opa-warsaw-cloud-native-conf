package demo

import data.policies
default allow = false
default conditions = false

allow = false {
    check[_policies]
    check_deny[_policies]
} else = true {
    check[_policies]
    not check_deny[_policies]
}

check[_policies] {
    check_principal[_policies]
    check_resource[_policies]
    check_action[_policies]
}

check_deny[policy] = true {
    policies[p].effect = "Deny"
    policies[p] = policy
}

check_action[policy] {
    policies[p] = policy
    policy.action[_] = input.action
}

check_action[policy] {
    policies[p] = policy
    policy.action[_] = "*"
}

unpack_token(p) = p {
    is_object(p)
}

unpack_token(p) = payload {
    is_string(p)
    io.jwt.decode(p, [header, payload, sig])
}

check_principal[policy] {
    input_principal := unpack_token(input.principal)
    policies[p].principal.role[_] = input_principal.role
    policies[p].principal.department = input_principal.department
    policies[p] = policy
}

check_principal[policy] {
    input_principal := unpack_token(input.principal)
    policies[p].notPrincipal.role[_] != input_principal.role
    policies[p] = policy
}

check_principal[policy] {
    input_principal := unpack_token(input.principal)
    policies[p].notPrincipal.department != input_principal.department
    policies[p] = policy  
}

check_resource[policy] {
    resource := policies[p].resources[r]
    keys := [ k | resource[k] ]
    input_resource_subset := { k:v  | resource[k]; input.resource[k]=v}
    resource = input_resource_subset
    policies[p] = policy
}

check_conditions[policy] {
    policies[p] = policy
    policy.conditions[c].operator = "equals"
    condition = policy.conditions[c]
    walk(input, [condition.key,value])
    value = condition.value
}

check_conditions[policy] {
    policies[p] = policy
    policy.conditions[c].operator = "contains"
    condition = policy.conditions[c]
    walk(input, [condition.key,value])
    value > condition.value
}