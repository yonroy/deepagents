#!/usr/bin/env bash
# Download the Chinook SQLite database next to this script.
set -euo pipefail
cd "$(dirname "$0")"
curl -sSL -o chinook.db \
  https://raw.githubusercontent.com/lerocha/chinook-database/master/ChinookDatabase/DataSources/Chinook_Sqlite.sqlite
echo "Saved $(pwd)/chinook.db"
