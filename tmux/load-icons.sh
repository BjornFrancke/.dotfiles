#!/bin/bash
# Reads icons.conf and sets tmux automatic-rename-format accordingly.
# Called by tmux.conf on load.

ICONS_FILE="$(dirname "$0")/icons.conf"

if [ ! -f "$ICONS_FILE" ]; then
    echo "icons.conf not found" >&2
    exit 1
fi

FORMAT=""
FALLBACK=""
VERSION_ICON=""
VERSION_LABEL=""

while IFS= read -r line; do
    # Skip comments and blank lines
    [[ "$line" =~ ^#  ]] && continue
    [[ -z "$line" ]] && continue

    # Parse: icon = name
    icon="${line%% = *}"
    rest="${line#* = }"

    if [[ "$rest" == "~default" ]]; then
        FALLBACK="$icon"
    elif [[ "$rest" == ~version* ]]; then
        VERSION_LABEL="${rest#~version }"
        VERSION_ICON="$icon"
    else
        name="$rest"
        FORMAT="${FORMAT}#{?#{==:#{pane_current_command},${name}},${icon} ${name},"
    fi
done < "$ICONS_FILE"

# Count closing braces needed
COUNT=$(echo "$FORMAT" | grep -o '#{?' | wc -l | tr -d ' ')

# Add version-pattern match if defined
if [ -n "$VERSION_ICON" ]; then
    FORMAT="${FORMAT}#{?#{m:[0-9]*.*,#{pane_current_command}},${VERSION_ICON} ${VERSION_LABEL},"
    COUNT=$((COUNT + 1))
fi

# Add fallback
FORMAT="${FORMAT}${FALLBACK} #{pane_current_command}"

# Close all conditionals
CLOSE=""
for ((i=0; i<COUNT; i++)); do
    CLOSE="${CLOSE}}"
done
FORMAT="${FORMAT}${CLOSE}"

tmux set-option -g automatic-rename-format "$FORMAT"
