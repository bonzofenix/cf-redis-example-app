#!/usr/bin/env bash

set -euo pipefail

function read_key(){
  local app_name="$1"
  local app_guid="$(cf app $app_name --guid)"
  local app="$(cf curl /v2/apps/$app_guid/stats |  jq -r '.[] | .stats.uris[0]' )"

  curl -X GET $app/foo
  echo
}

read_key $1
