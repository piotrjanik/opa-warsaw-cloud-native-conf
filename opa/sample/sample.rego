package sample

default allow = false

allow = true {
  data.employees[e].name = input.name
  data.employees[e].city = input.city
}
