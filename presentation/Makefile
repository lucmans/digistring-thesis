.PHONY: all 1 clean

all: pres.pdf
	pdflatex pres.tex
	pdflatex pres.tex

1: pres.pdf
	pdflatex pres.tex

clean:
	rm -f pres.aux pres.log pres.nav pres.out pres.snm pres.toc
