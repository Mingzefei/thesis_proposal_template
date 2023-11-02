build:
	xelatex main.tex
	-bibtex main.aux
	xelatex main.tex
	xelatex main.tex
clean:
	find . -name '*.aux' -print0 | xargs -0 rm -rf
	rm -rf *.lof *.log *.lot *.out *.toc *.bbl *.blg *.thm
depclean: clean
	rm -rf *.pdf
