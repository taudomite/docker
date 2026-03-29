#!/bin/sh
# Example: /app/lookbusy/lookbusy -c 16-21 -r curve
# Usage: pass MB as first arg (e.g. "4000MB") or set LOOKBUSY_MB env var
MB="${1:-${LOOKBUSY_MB:-4000MB}}"

# If user passed only digits (e.g. "4000"), append the "MB" suffix.
case "$MB" in
	''|*[!0-9]*)
		;;
	*)
		MB="${MB}MB"
		;;
esac

/app/lookbusy/lookbusy -c 0 -m "$MB"
