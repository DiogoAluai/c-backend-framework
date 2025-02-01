#!/bin/bash


# Check arguments
if [ $# -lt 1 ]; then
  echo "Usage: $0 <endpoint_specification.c>"
  exit 1
fi

endpoint_specification="$1"

generate-endpoint-code() {
  # Usage: generate-endpoint-code endpoint c_function
  endpoint="$1"
  c_function="$2"

  endpoint_no_slash="${endpoint:1}"
  endpoint_code_file="$endpoint_no_slash"_endpoint
  cp templates/endpoint_switch_case "$endpoint_code_file"
  sed "s/\/\/ CBF-RESPONSE-CONTENT-INIT/response_content=$c_function();/g" -i "$endpoint_code_file"
  sed "s/CBF-ENDPOINT/\/$endpoint_no_slash/g" -i "$endpoint_code_file"
  awk "/CBF-ENDPOINT-SWITCH-CASE/ {while ((getline line < \"$endpoint_code_file\") > 0) print line} 1" backend.c  > temp && mv temp backend.c
}

cat "$endpoint_specification" backend.cbf > backend.c

for endpoint_line in $(cat -n "$endpoint_specification" | grep "//" | grep -i "GET" | cut -d $'\t' -f1); do
  function_line=$((endpoint_line + 1))
  endpoint=$(sed -n "$endpoint_line"p "$endpoint_specification" | awk -F '[()]' '{print $2}' | awk -F '[""]' '{print $2}')
  c_function_raw_signature=$(sed -n "$function_line"p "$endpoint_specification")
  c_function=$(echo "$c_function_raw_signature" | awk -F '[ (]' '{print $2}')

  if echo "$c_function_raw_signature" | grep -q "char\*"; then
    echo "Generating endpoint: $endpoint $c_function"
  else
    echo "[ERROR] Return type of endpoint function must be 'char*' for line: "
    echo "$c_function_raw_signature"
  fi

  generate-endpoint-code "$endpoint" "$c_function"  

done





gcc backend.c -o backend
