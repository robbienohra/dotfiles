#!/bin/bash

script_dir=$(dirname "$0")

while IFS= read -r package; do
  if brew list --formula | grep -q "^${package}$"; then
    echo "Package ${package} is already installed."
  else
    brew install "${package}"
  fi
done <"${script_dir}/brew_packages"
