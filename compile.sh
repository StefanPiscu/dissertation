latexmk -pdf -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -outdir=build main.tex > /dev/null
mv build/main.pdf main.pdf