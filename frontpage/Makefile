.PHONY: all clean

# No prerequisites, so it is always out-of-date and date is always updated
all:
	latex frontpage.tex
	dvips -Ppdf frontpage.dvi
	ps2pdf frontpage.ps

clean:
	rm -rf frontpage.aux frontpage.dvi frontpage.log frontpage.ps
