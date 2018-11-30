slides.pdf: slides.tex spatprot.tex sw.tex
	pdflatex slides.tex
	bibtex slides
	pdflatex slides.tex
	pdflatex slides.tex

sw.tex: sw.Rnw
	R CMD Sweave --engine=knitr::knitr sw.Rnw

sw.R: sw.Rnw
	Rscript -e "knitr::purl('sw.Rnw')"
