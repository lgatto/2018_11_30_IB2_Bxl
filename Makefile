slides.pdf: slides.tex spatprot.tex spatprot2.tex sw.tex bioc.tex
	pdflatex slides.tex
	bibtex slides
	pdflatex slides.tex
	pdflatex slides.tex

sw.tex: sw.Rnw
	R CMD Sweave --engine=knitr::knitr sw.Rnw

bioc.tex: bioc.Rnw
	R CMD Sweave --engine=knitr::knitr bioc.Rnw

bioc.R: bioc.Rnw
	Rscript -e "knitr::purl('bioc.Rnw')"
