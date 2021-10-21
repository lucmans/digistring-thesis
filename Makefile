
all:
	pdflatex thesis.tex
	bibtex thesis
	pdflatex thesis.tex
	pdflatex thesis.tex

1:
	pdflatex thesis.tex

clean:
	rm -rf thesis.aux thesis.bbl thesis.blg thesis.log thesis.out