#!/bin/bash

awk '/CBF-ENDPOINT-SWITCH-CASE/ {while ((getline line < "templates/endpoint_switch_case") > 0) print line} 1' hello-endpoint.cbf > hello-endpoint.c


gcc hello-endpoint.c -o endpoint-hello
