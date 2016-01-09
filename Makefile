PHONY: main.pdf all clean

all: 7688.pdf

main.pdf: 7688.tex
	latexmk -pdf -pdflatex="xelatex" -use-make $<

clean:
	latexmk -CA
	rm *.nav *.snm *.vrb
