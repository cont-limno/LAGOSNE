## ----lagos_load----------------------------------------------------------
library(LAGOS)

dt <- lagos_load("1.087.1")

## ----avg_chl_by_state, message=FALSE, results = 'hide', warning = FALSE----
library(dplyr)
library(ggplot2)

lg <- left_join(dt$epi_nutr, dt$locus)
lg <- left_join(lg, dt$state)
lg <- group_by(lg, state)
lg <- filter(lg, !is.na(state))

## ------------------------------------------------------------------------
levels(lg$state)
state_easting <- summarize(lg, 
                    mean_easting = mean(nhd_long, na.rm = TRUE))
state_easting <- arrange(state_easting, mean_easting)

lg$state <- factor(lg$state, levels = state_easting$state)


## ----warning=FALSE-------------------------------------------------------
ggplot(lg) + 
  geom_boxplot(aes(x = state, y = chla), outlier.shape = NA) + 
  ylim(c(0, 80)) + ylab("Chlorophyll a (ug/L)")


## ----pa_chl_map, message=FALSE, results = 'hide'-------------------------
library(maps)
library(sf)

states <- st_as_sf(map("state", plot = FALSE, fill = TRUE))
pa <- filter(states, ID == "pennsylvania")

## ------------------------------------------------------------------------
pa_chl <- filter(lg, state == "PA")
pa_chl <- group_by(pa_chl, lagoslakeid)
pa_chl <- summarize(pa_chl, 
                      mean_chl  = mean(chla, na.rm = TRUE), 
                      mean_long = mean(nhd_long, na.rm = TRUE), 
                      mean_lat  = mean(nhd_lat, na.rm = TRUE))
pa_chl <- filter(pa_chl, !is.na(mean_chl))

## ------------------------------------------------------------------------
pa_chl <- st_as_sf(pa_chl, coords = c("mean_long", "mean_lat"), crs = 4326)

ggplot() + 
  geom_sf(data = pa) +
  geom_sf(data = pa_chl, aes(color = log(mean_chl))) + 
  theme_bw() + scale_color_gradient(low = "white", high = "darkgreen") +
  labs(color = "log(Chlorophyll a (ug/L))")


