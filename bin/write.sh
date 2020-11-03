#!/usr/bin/env bash

set -euo pipefail

function write(){
  app_name="$1"
  app_guid="$(cf app $app_name --guid)"
  app="$(cf curl /v2/apps/$app_guid/stats |  jq -r '.[] | .stats.uris[0]' )"

  curl -X PUT $app/foo -d 'data=bar'
  echo
}

write $1
