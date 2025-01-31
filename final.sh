#!/bin/bash

endpoint="/hello"



endpoint_no_slash="${endpoint:1}"

cp templates/endpoint_switch_case hello_endpoint
awk '/CBF-RESPONSE-CONTENT-INIT/ {while ((getline line < "templates/computation_hello") > 0) print line} 1' hello_endpoint
sed "s/CBF-ENDPOINT/\/$endpoint_no_slash/g" -i hello_endpoint

cp hello-endpoint.cbf hello-endpoint.c
awk '/CBF-ENDPOINT-SWITCH-CASE/ {while ((getline line < "hello_endpoint") > 0) print line} 1' hello-endpoint.c


gcc hello-endpoint.c -o endpoint-hello
