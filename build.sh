#!/bin/sh
PROJECTS="frontend2 products books orders policies"

for p in $1
do
  (cd $p && docker build -t piotrjanik/opa-demo-$p:latest . && docker push piotrjanik/opa-demo-$p:latest)
done
