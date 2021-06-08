#!/bin/bash

curl -o run_infersharp.sh https://raw.githubusercontent.com/microsoft/infersharp/xinshi/updateexecutescript/run_infersharp_azurepipelines.sh
chmod +x run_infersharp.sh
./run_infersharp.sh $1

var="$( cat infer-out/report.txt )"
var="${var//'%'/'%25'}"
var="${var//$'\n'/'%0A'}"
var="${var//$'\r'/'%0D'}"
echo "::set-output name=results::$var"