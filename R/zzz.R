# zzz.R is the conventional location to define .onAttach()

.onAttach <- function(lib, pkg){

  pkg.info <- drop(read.dcf(file=system.file("DESCRIPTION", package="LAGOS"),
                            fields=c("Title","Version","Date")))

  packageStartupMessage("Welcome to the LAGOS Package, Here is citation information:")
}
