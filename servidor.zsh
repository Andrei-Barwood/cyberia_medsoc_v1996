#!/bin/zsh
set -euo pipefail

PROJECT_ROOT="${0:A:h}"
cd "$PROJECT_ROOT"

PORT="${PORT:-4567}"
URL="http://127.0.0.1:${PORT}/"

command -v bundle >/dev/null 2>&1 || {
  print -u2 -- "Error: falta Bundler. Ejecuta ./instalador.zsh primero."
  exit 1
}

bundle check >/dev/null 2>&1 || {
  print -u2 -- "Error: faltan dependencias. Ejecuta ./instalador.zsh primero."
  exit 1
}

if lsof -nP -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
  print -u2 -- "Error: el puerto $PORT ya está en uso."
  exit 1
fi

server_pid=""
cleanup() {
  if [[ -n "$server_pid" ]] && kill -0 "$server_pid" 2>/dev/null; then
    kill "$server_pid" 2>/dev/null || true
    wait "$server_pid" 2>/dev/null || true
  fi
}
trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

print -- "Iniciando CYBERIA-MED // SOC en $URL"
bundle exec rackup -o 127.0.0.1 -p "$PORT" config.ru &
server_pid=$!

ready=false
for attempt in {1..60}; do
  if ! kill -0 "$server_pid" 2>/dev/null; then
    wait "$server_pid" || true
    print -u2 -- "Error: el servidor terminó antes de estar disponible."
    exit 1
  fi

  if curl --silent --fail "$URL" --output /dev/null; then
    ready=true
    break
  fi
  sleep 0.5
done

if [[ "$ready" != true ]]; then
  print -u2 -- "Error: el servidor no respondió en $URL."
  exit 1
fi

open "$URL"
print -- "Consola abierta en el navegador. Pulsa Ctrl+C para detener el servidor."
wait "$server_pid"
