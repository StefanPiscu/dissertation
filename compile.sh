#!/bin/bash

# minted v3 removed the outputdir package option. Create a temporary shim
# that downgrades the fatal error to a warning so the option is silently ignored.
SYSTEM_MINTED=$(kpsewhich minted.sty)
MINTED_COMPAT_DIR=$(mktemp -d)
sed 's/outputdir\/.code=\\minted@error{/outputdir\/.code=\\minted@warning{/' "$SYSTEM_MINTED" > "$MINTED_COMPAT_DIR/minted.sty"

TEXINPUTS="$MINTED_COMPAT_DIR:" latexmk -pdf -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex > /dev/null

rm -rf "$MINTED_COMPAT_DIR"

mv build/main.pdf main.pdf
