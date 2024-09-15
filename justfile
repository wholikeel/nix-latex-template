entry       := "main"

cache       := ".cache/latex"
src         := "./src"
build       := "./build"

pdf_viewer  := "zathura --fork"



build:
    mkdir -p {{cache}}
    mkdir -p {{build}}
    latexmk -interaction=nonstopmode \
        -auxdir={{cache}} \
        -pdf \
        -outdir={{build}} \
        "{{src}}/{{entry}}.tex"

watch:
    mkdir -p {{cache}}
    mkdir -p {{build}}
    latexmk -interaction=nonstopmode \
        -auxdir={{cache}} \
        -pdf \
        -outdir={{build}} \
        -pvc \
        "{{src}}/{{entry}}.tex" \

view:
    {{pdf_viewer}} "{{build}}/{{entry}}.pdf"

word-count:
    detex "{{src}}/{{entry}}.tex" | wc
    
