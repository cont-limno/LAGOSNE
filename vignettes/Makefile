all:
	Rscript -e "rmarkdown::render('lagos_structure.Rmd')"
	Rscript -e "rmarkdown::render('working_with_lagos.Rmd')"
	sed  -i '1i <\%@meta language="R-vignette" content="-------------------------------- \
DIRECTIVES FOR R: \
\
  \%\VignetteIndexEntry{Working with LAGOS} \
  \%\VignetteAuthor{Joseph Stachelek} \
  \%\VignetteEngine{R.rsp::rsp} \
--------------------------------------------------------------------"\%>' working_with_lagos.md
	sed  -i '1i <\%@meta language="R-vignette" content="-------------------------------- \
DIRECTIVES FOR R: \
\
  \%\VignetteIndexEntry{The Structure of LAGOS} \
  \%\VignetteAuthor{Samantha Oliver} \
  \%\VignetteEngine{R.rsp::rsp} \
--------------------------------------------------------------------"\%>' lagos_structure.md

