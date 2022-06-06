.PHONY: all 1 noimage clean

# Only make all should ever be used

# Build both normal thesis and broken frontpaged version
all:
	# -B frontpaged.pdf causes thesis.pdf target to run forcefully
	make -B frontpaged.pdf --no-print-directory


# For quick remaking
1:
	pdflatex thesis.tex

# For quick building without images
noimage:
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"


# Only build thesis
thesis.pdf: thesis.tex thesis.bib
	pdflatex "\\def\\noimage{}\\input{thesis.tex}"
	bibtex thesis
	pdflatex  "\\def\\noimage{}\\input{thesis.tex}"
	pdflatex thesis.tex


# Building frontpaged version
no_title.pdf: thesis.pdf
	mv thesis.pdf thesis.pdf.backup
	pdflatex "\\def\\notitle{}\\input{thesis.tex}"
	mv thesis.pdf no_title.pdf
	mv thesis.pdf.backup thesis.pdf

frontpaged.pdf: no_title.pdf
	make -C frontpage
	pdfunite frontpage/frontpage.pdf no_title.pdf frontpaged.pdf
	echo -e "\n\nImportant notice! pdfunite breaks PDF links!\n"


clean:
	rm -f thesis.aux thesis.bbl thesis.blg thesis.log thesis.out thesis.toc
	make -C frontpage clean --no-print-directory

cleanall:
	make clean --no-print-directory
	rm -f no_title.pdf
	rm -f thesis.pdf frontpaged.pdf frontpage/frontpage.pdf
