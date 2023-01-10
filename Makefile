# Make 2 pages-per-sheet PostScript for printing
weaver.ps : 2pages.pdf
	pdf2ps 2pages.pdf
	a2ps -r --rows=1 --columns=2  2pages.ps -o weaver.ps

# Make 2 pages PDF
2pages.pdf : pacific.pdf
	pdfunite pacific.pdf  pacific.pdf 2pages.pdf

# Make pdf from TeX
pacific.pdf : pacific.tex
	xelatex pacific.tex

# Remove all files made
clean :
	rm -f index.latex *.ps* *.pdf *.out *.aux *.log 

test : Dockerfile pacific.tex
	cp pacific.tex index.latex
	docker build -t texlive-xelatex-cmu . && docker run -v $$PWD:/mnt texlive-xelatex-cmu && echo OK



	


