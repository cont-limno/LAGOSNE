# zzz.R is the conventional location to define .onAttach()

.onAttach <- function(lib, pkg){

  pkg.info <- drop(read.dcf(file = system.file("DESCRIPTION",
                package = "LAGOS"), fields = c("Title", "Version", "Date")))

  gigascience_cite <-
    "Soranno, P.A., Bissell, E.G., Cheruvelil, K.S., Christel, S.T., Collins,
    S.M., Fergus, C.E., Filstrup, C.T., Lapierre, J.F., Lottig, N.R., Oliver,
    S.K., Scott, C.E., Smith, N.J., Stopyak, S., Yuan, S., Bremigan, M.T.,
    Downing, J.A., Gries, C., Henry, E.H., Skaff, N.K., Stanley, E.H.,
    Stow, C.A., Tan, P.N., Wagner, T. and Webster, K.E. 2015. Building a
    multi-scaled geospatial temporal ecology database from disparate data
    sources: fostering open science and data reuse. Gigascience, 4(1)"

  packageStartupMessage(paste0("Welcome to LAGOS version ",
    pkg.info["Version"] , ". To cite LAGOS in publications use: \n \n",
    gigascience_cite))
}
