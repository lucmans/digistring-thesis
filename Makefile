
all:
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"
	bibtex thesis
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"
	pdflatex thesis.tex

1:
	pdflatex thesis.tex

noimage:
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"


clean:
	rm -rf thesis.aux thesis.bbl thesis.blg thesis.log thesis.out thesis.toc