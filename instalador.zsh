#!/bin/zsh
set -euo pipefail

PROJECT_ROOT="${0:A:h}"
cd "$PROJECT_ROOT"

fail() {
  print -u2 -- "Error: $1"
  exit 1
}

ensure_brew_ruby() {
  command -v brew >/dev/null 2>&1 || fail "Se necesita Ruby 3.2+ y Homebrew para instalarlo automáticamente."

  if ! brew list --versions ruby >/dev/null 2>&1; then
    print -- "Instalando Ruby con Homebrew..."
    brew install ruby
  fi

  local ruby_prefix
  ruby_prefix="$(brew --prefix ruby)"
  export PATH="$ruby_prefix/bin:$PATH"
}

if ! command -v ruby >/dev/null 2>&1 || ! ruby -rrubygems -e \
  'exit(Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.2") ? 0 : 1)' >/dev/null 2>&1; then
  ensure_brew_ruby
fi

if ! command -v bundle >/dev/null 2>&1 || ! ruby -e \
  'require "bundler"; exit(Bundler::VERSION == "4.0.23" ? 0 : 1)' >/dev/null 2>&1; then
  print -- "Instalando Bundler 4.0.23..."
  gem install bundler -v 4.0.23 --user-install --no-document
  export PATH="$(ruby -rrubygems -e 'print Gem.user_dir')/bin:$PATH"
fi

AEGIS_TARGET="$PROJECT_ROOT/bin/Aegis9CyberbrainEDR"
if [[ ! -x "$AEGIS_TARGET" ]]; then
  fail "No se encontró el ejecutable Aegis9 en bin/Aegis9CyberbrainEDR."
fi

print -- "Instalando dependencias Ruby del proyecto..."
bundle install

print -- "Instalación completada."
