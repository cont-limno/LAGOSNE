## ---- eval=FALSE, results = 'hide', message=FALSE------------------------
#  devtools::install()

## ---- results = 'hide', message=FALSE------------------------------------
library(LAGOS)

## ----eval=FALSE----------------------------------------------------------
#  # Import LAGOS data into R
#  dt <- lagos_load(version = "1.087.1", format = "rds")

## ----echo=FALSE----------------------------------------------------------
data(lg_subset)
dt <- lg_subset

## ------------------------------------------------------------------------
names(dt)

## ---- message=FALSE, results="hide", echo=FALSE--------------------------
library(dplyr)

## ---- fig.show = 'hold', fig.height = 4, fig.width = 4, eval=FALSE-------
#  # plot number of sampling events per lake
#  n.events <- count(as.tbl(dt$epi.nutr), lagoslakeid)
#  hist(log10(n.events$n), xlab = "Sampling Events Per Lake",
#       xaxt = 'n', main = '', mgp = c(2,.8,0), bty = 'n')
#  axis(1, labels = c(1,10,100,1000), at = c(0,1,2,3))
#  
#  # plot number of years of observations per lake
#  n.years <- count(as.tbl(dt$epi.nutr), lagoslakeid, sampleyear)
#  n.years <- count(n.years, lagoslakeid)
#  hist(n.years$nn, xlab = "Years of Observations Per Lake",
#       main = '', mgp = c(2,.8,0), breaks = 15, bty = 'n')

## ---- message = FALSE, eval=FALSE----------------------------------------
#  library(rgdal)
#  
#  # get huc4 polygons from github
#  load(url("https://github.com/limnoliver/CSI-Nutrient-Time-Series/blob/72c8269902e53c7ec6a2cfbe13a0239d13062dc8/Data/huc4.RData?raw=true"))
#  plot(huc4, lty = 1, lwd=1, border=TRUE, col = "lightgray")

