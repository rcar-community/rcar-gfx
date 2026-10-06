#!/bin/bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <deb paths>"
    exit 1
fi

CODENAME="trixie"

UpdateDeb () {
    local pkg_name
    pkg_name=$(basename "$1" | cut -f1 -d_)

    reprepro remove "$CODENAME" "$pkg_name"
    reprepro includedeb "$CODENAME" "$1"
}

for arg in "$@"; do
    UpdateDeb "$arg"
done
