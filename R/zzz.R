# zzz.R is the conventional location to define .onAttach()

.onAttach <- function(lib, pkg){

  pkg.info <- drop(read.dcf(file = system.file("DESCRIPTION",
                package = "LAGOSNE"), fields = c("Title", "Version", "Date")))

  gigascience_cite <-
  "https://lagoslakes.org/how-to-cite-lagos-ne/"

  if(interactive()){
    packageStartupMessage(paste0("Welcome to the LAGOSNE R package. To cite LAGOSNE in publications see: \n ",
    gigascience_cite))
  }
}
