## ----eval=FALSE----------------------------------------------------------
#  # Import LAGOS data into R
#  dt <- lagos_load(version = "1.087.1", format = "rds")

## ---- message=FALSE, echo=FALSE------------------------------------------
library(LAGOS)
dt <- lagos_load("1.087.1")

## ------------------------------------------------------------------------
names(dt)

## ----load printr, echo=FALSE,message=FALSE,results='hide'----------------
loadNamespace("printr")

## ----Read metadata for individual tables---------------------------------
help.search("datasets", package = "LAGOS")

## ----unload printr, echo=FALSE-------------------------------------------
unloadNamespace("printr")

## ---- message = FALSE, eval=FALSE----------------------------------------
#  library(rgdal)
#  
#  # get huc4 polygons from github
#  load(url("https://github.com/limnoliver/CSI-Nutrient-Time-Series/blob/72c8269902e53c7ec6a2cfbe13a0239d13062dc8/Data/huc4.RData?raw=true"))
#  plot(huc4, lty = 1, lwd=1, border=TRUE, col = "lightgray")

