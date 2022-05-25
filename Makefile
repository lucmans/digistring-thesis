.PHONY: all 1 thesis frontpage noimage clean

# Build both normal thesis and broken frontpaged version
all:
	# -B frontpage causes thesis.pdf target to run forcefully
	make -B frontpage --no-print-directory


# For quick remaking
1:
	pdflatex thesis.tex


# Only build thesis
thesis:
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"
	bibtex thesis
	pdflatex  "\\def\\noimage{}\\input{thesis.tex}"
	pdflatex thesis.tex


# Building frontpaged version
thesis.pdf: thesis.tex thesis.bib
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"
	bibtex thesis
	pdflatex  "\\def\\noimage{}\\input{thesis.tex}"
	pdflatex thesis.tex

frontpage: thesis.pdf
	pdflatex "\\def\\notitle{}\\input{thesis.tex}"
	make -C frontpage
	pdfunite frontpage/frontpage.pdf thesis.pdf frontpaged.pdf
	echo -e "\n\nImportant notice! pdfunite breaks internet PDF hyperlinks!\n"


# For quick building without images
noimage:
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"


clean:
	rm -rf thesis.aux thesis.bbl thesis.blg thesis.log thesis.out thesis.toc
	make -C frontpage clean --no-print-directory

cleanall:
	make clean --no-print-directory
	rm -f thesis.pdf frontpaged.pdf frontpage/frontpage.pdf
