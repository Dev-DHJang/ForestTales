#!/bin/sh
set -eu

if ! command -v npx >/dev/null 2>&1; then
	echo "npx is required to start the local Penpot MCP server" >&2
	exit 1
fi

exec npx -y @penpot/mcp@stable
