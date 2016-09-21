######################################################
#File description comment, including purpose of program, inputs
# and outputs
######################################################
# Set the working directory


######################################################
#Importing Lagos limno data
# setwd("/Users/farzan/Desktop/Dropbox/Summer\ 2015/Job/Lagos\ Package/LAGOS\ Package/Data/Limno")
# setwd("C:\\Users\\FWL\\Dropbox\\Summer 2015\\Job\\Lagos Package\\LAGOS Package\\Data\\Limno10541")

epi.nutr <- read.table("data/Limno10541/lagos_epi_nutr_10541.txt",
                       header = TRUE,
                       sep = "\t",
                       quote = "",
                       dec = ".",
                       strip.white = TRUE,
                       comment.char = "",
                       colClasses=c(sampledate = "POSIXct"))

lake.specific <- read.table("data/Limno10541/lagos_lakes_10541.txt",
                            header = TRUE,
                            sep = "\t",
                            quote = "",
                            dec = ".",
                            strip.white = TRUE,
                            comment.char = "")


secchi <- read.table('data/Limno10541/lagos_secchi_10541.txt',
                     header =T,
                     sep = "\t",
                     quote = "",
                     dec = ".",
                     strip.white=T,
                     comment.char="")


lagos.source <- read.table('data/Limno10541/lagos_source_10541.txt',
                           header =T,
                           sep = "\t",
                           quote = "",
                           dec = ".",
                           strip.white=T,
                           comment.char="")

lagos.program <- read.table('data/Limno10541/lagos_program_10541.txt',
                            header=T,
                            sep = "\t",
                            quote = "",
                            dec = ".",
                            strip.white=T,
                            comment.char="")

######################################################
#Importing Lagos Geo data
# setwd("/Users/farzan/Desktop/Dropbox/Summer\ 2015/Job/Lagos\ Package/LAGOS\ Package/Data/Geo")
# setwd("C:\\Users\\FWL\\Dropbox\\Summer 2015\\Job\\Lagos Package\\LAGOS Package\\Data\\Geo")
#######
#Importing Lagos Geo county data

county <- read.table("data/Geo/county.txt", header =T,
                     sep = "\t",
                     quote= "",
                     dec = "." ,
                     strip.white = TRUE,
                     comment.char = "")

county.chag <-  read.table("data/Geo/county_chag.txt", header =T,
                           sep = "\t",
                           quote= "",
                           dec = "." ,
                           strip.white = TRUE,
                           comment.char = "")

county.conn <-  read.table("data/Geo/county_conn.txt", header =T,
                           sep = "\t",
                           quote= "",
                           dec = "." ,
                           strip.white = TRUE,
                           comment.char = "")

county.lulc <-  read.table("data/Geo/county_lulc.txt", header =T,
                           sep = "\t",
                           quote= "",
                           dec = "." ,
                           strip.white = TRUE,
                           comment.char = "")
#######
#Importing Lagos Geo edu data

edu <- read.table("data/Geo/edu.txt", header =T,
                  sep = "\t",
                  quote= "",
                  dec = "." ,
                  strip.white = TRUE,
                  comment.char = "")

edu.chag <-  read.table("data/Geo/edu_chag.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "")

edu.conn <-  read.table("data/Geo/edu_conn.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "")

edu.lulc <-  read.table("data/Geo/edu_lulc.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "")
#######
#Importing Lagos Geo huc4 data


hu4 <- read.table("data/Geo/hu4.txt", header =T,
                  sep = "\t",
                  quote= "",
                  dec = "." ,
                  strip.white = TRUE,
                  comment.char = "",
                  colClasses=c("hu4"="factor"))

hu4.chag <-  read.table("data/Geo/hu4_chag.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "",
                        as.is=TRUE)

hu4.conn <-  read.table("data/Geo/hu4_conn.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "",
                        as.is=TRUE)

hu4.lulc <-  read.table("data/Geo/hu4_lulc.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "",
                        as.is=TRUE)
#######
#Importing Lagos Geo huc4 data


hu8 <- read.table("data/Geo/hu8.txt", header =T,
                  sep = "\t",
                  quote= "",
                  dec = "." ,
                  strip.white = TRUE,
                  comment.char = "",
                  colClasses=c("hu8"="factor")
)

hu8.chag <-  read.table("data/Geo/hu8_chag.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "",
                        as.is=TRUE)

hu8.conn <-  read.table("data/Geo/hu8_conn.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "",
                        as.is=TRUE)

hu8.lulc <-  read.table("data/Geo/hu8_lulc.txt", header =T,
                        sep = "\t",
                        quote= "",
                        dec = "." ,
                        strip.white = TRUE,
                        comment.char = "",
                        as.is=TRUE)
#######
#Importing Lagos Geo huc12 data


hu12 <- read.table("data/Geo/hu12.txt", header =T,
                   sep = "\t",
                   quote= "",
                   dec = "." ,
                   strip.white = TRUE,
                   comment.char = "",
                   colClasses=c("hu12"="factor"))

hu12.chag <-  read.table("data/Geo/hu12_chag.txt", header =T,
                         sep = "\t",
                         quote= "",
                         dec = "." ,
                         strip.white = TRUE,
                         comment.char = "",
                         as.is=TRUE)

hu12.conn <-  read.table("data/Geo/hu12_conn.txt", header =T,
                         sep = "\t",
                         quote= "",
                         dec = "." ,
                         strip.white = TRUE,
                         comment.char = "",
                         as.is=TRUE)

hu12.lulc <-  read.table("data/Geo/hu12_lulc.txt", header =T,
                         sep = "\t",
                         quote= "",
                         dec = "." ,
                         strip.white = TRUE,
                         comment.char = "",
                         as.is=TRUE)
#################################
# Importing Lagos Geo iws data
iws <- read.table("data/Geo/iws.txt", header =T,
                  sep = "\t",
                  quote= "",
                  dec = "." ,
                  strip.white = TRUE,
                  comment.char = "")

iws.conn <- read.table("data/Geo/iws_conn.txt", header =T,
                       sep = "\t",
                       quote= "",
                       dec = "." ,
                       strip.white = TRUE,
                       comment.char = "")

iws.lulc <- read.table("data/Geo/iws_lulc.txt", header =T,
                       sep = "\t",
                       quote= "",
                       dec = "." ,
                       strip.white = TRUE,
                       comment.char = "")
#######
#Importing Lagos Geo state data

state <- read.table("data/Geo/state.txt", header =T,
                    sep = "\t",
                    quote= "",
                    dec = "." ,
                    strip.white = TRUE,
                    comment.char = "")

state.chag <-  read.table("data/Geo/state_chag.txt", header =T,
                          sep = "\t",
                          quote= "",
                          dec = "." ,
                          strip.white = TRUE,
                          comment.char = "")

state.conn <-  read.table("data/Geo/state_conn.txt", header =T,
                          sep = "\t",
                          quote= "",
                          dec = "." ,
                          strip.white = TRUE,
                          comment.char = "")

state.lulc <-  read.table("data/Geo/state_lulc.txt", header =T,
                          sep = "\t",
                          quote= "",
                          dec = "." ,
                          strip.white = TRUE,
                          comment.char = "")
#######################
# buffer
lakes4ha.buffer100m <- read.table("data/Geo/lakes4ha_buffer100m.txt", header =T,
                                  sep = ",",
                                  quote= "",
                                  dec = "." ,
                                  strip.white = TRUE,
                                  comment.char = "")
names(lakes4ha.buffer100m)[names(lakes4ha.buffer100m)==
                             "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

lakes4ha.buffer100m.lulc <- read.table("data/Geo/lakes4ha_buffer100m_lulc.txt", header =T,
                                       sep = "\t",
                                       quote= "",
                                       dec = "." ,
                                       strip.white = TRUE,
                                       comment.char = "")

names(lakes4ha.buffer100m.lulc)[names(lakes4ha.buffer100m.lulc)==
                                  "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

lakes4ha.buffer500m <- read.table("data/Geo/lakes4ha_buffer500m.txt", header =T,
                                  sep = ",",
                                  quote= "",
                                  dec = "." ,
                                  strip.white = TRUE,
                                  comment.char = "")

names(lakes4ha.buffer500m)[names(lakes4ha.buffer500m)==
                             "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"


lakes4ha.buffer500m.conn <- read.table("data/Geo/lakes4ha_buffer500m_conn.txt", header =T,
                                       sep = "\t",
                                       quote= "",
                                       dec = "." ,
                                       strip.white = TRUE,
                                       comment.char = "")

names(lakes4ha.buffer500m.conn)[names(lakes4ha.buffer500m.conn)==
                                  "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"

lakes4ha.buffer500m.lulc <- read.table("data/Geo/lakes4ha_buffer500m_lulc.txt", header =T,
                                       sep = "\t",
                                       quote= "",
                                       dec = "." ,
                                       strip.white = TRUE,
                                       comment.char = "")

names(lakes4ha.buffer500m.lulc)[names(lakes4ha.buffer500m.lulc)==
                                  "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"
#######################

lagoslakes <-  read.table("data/Geo/lagoslakes_10400.txt", header =T,
                          sep = "\t",
                          quote= "",
                          dec = "." ,
                          strip.white = TRUE,
                          comment.char = "")
#######

limno <- list(epi.nutr = epi.nutr,lake.specific = lake.specific,
              secchi=secchi ,lagos.source = lagos.source,
              lagos.program= lagos.program
)
#rm(epi.nutr, lake.specific, secchi, lagos.source)
geo <- list(county = county
            ,county.chag = county.chag
            ,county.conn = county.conn
            ,county.lulc = county.lulc
            ,edu = edu
            ,edu.chag = edu.chag
            ,edu.conn = edu.conn
            ,edu.lulc = edu.lulc
            ,hu4 = hu4
            ,hu4.chag = hu4.chag
            ,hu4.conn = hu4.conn
            ,hu4.lulc = hu4.lulc
            ,hu8 = hu8
            ,hu8.chag = hu8.chag
            ,hu8.conn = hu8.conn
            ,hu8.lulc = hu8.lulc
            ,hu12 = hu12
            ,hu12.chag = hu12.chag
            ,hu12.conn = hu12.conn
            ,hu12.lulc = hu12.lulc
            ,iws = iws
            ,iws.conn = iws.conn
            ,iws.lulc = iws.lulc
            ,state = state
            ,state.chag = state.chag
            ,state.conn = state.conn
            ,state.lulc = state.lulc
            ,lakes4ha.buffer100m = lakes4ha.buffer100m
            ,lakes4ha.buffer100m.lulc = lakes4ha.buffer100m.lulc
            ,lakes4ha.buffer500m = lakes4ha.buffer500m
            ,lakes4ha.buffer500m.conn = lakes4ha.buffer500m.conn
            ,lakes4ha.buffer500m.lulc = lakes4ha.buffer500m.lulc
            ,lagoslakes = lagoslakes)
#data1 <- merge( lake.specific[,c(1,15,17,19,21,23)],epi.nutr,
#               by.x="lagoslakeid", by.y="lagoslakeid" )
###################################################################
## Creating information table

name <- c(names(geo), names(limno))
type <- c(rep("geo",length(geo)), rep("limno", length(limno)))
identifier <- c("county_zoneid","county_zoneid","county_zoneid","county_zoneid",
                "edu_zoneid", "edu_zoneid", "edu_zoneid", "edu_zoneid",
                "hu4_zoneid", "hu4_zoneid", "hu4_zoneid", "hu4_zoneid",
                "hu8_zoneid", "hu8_zoneid", "hu8_zoneid", "hu8_zoneid",
                "hu12_zoneid", "hu12_zoneid", "hu12_zoneid", "hu12_zoneid",
                "iws_zoneid","iws_zoneid", "iws_zoneid",
                "state_zoneid", "state_zoneid", "state_zoneid", "state_zoneid",
                "lagoslakeid", "lagoslakeid",
                "lagoslakeid", "lagoslakeid", "lagoslakeid",
                "hub", "lagoslakeid, eventida10400, programname", "hub",
                "lagoslakeid, eventidc10400, programname", "sourceid","programname, sourceid")
# number of varibales of each dataframe in the table
variables <- rep(0, length(name))
for(i in 1: length(name)){
  if(type[i]=="geo"){
    j <- which(names(geo)==name[i])
    variables[i] <- ncol(geo[[j]])
  }else{
    j <- which(names(limno)==name[i])
    variables[i] <- ncol(limno[[j]])
  }
}
# Number of observation of each dataframe in the table
observations <- rep(0, length(name))
for(i in 1: length(name)){
  if(type[i]=="geo"){
    j <- which(names(geo)==name[i])
    observations[i] <- nrow(geo[[j]])
  }else{
    j <- which(names(limno)==name[i])
    observations[i] <- nrow(limno[[j]])
  }
}
group <- c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,
           4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6,
           7, 7, 7, 7, 10, 10, 10, 10, 10, 0, 11,
           0, 11, 13, 12)
informationTable <- data.frame(name= I(name),
                               type= I(type),
                               variables=I(variables),
                               observations=I(observations),
                               identifier= I(identifier),
                               group = I(group))
#################################################
# Saving the Data frame
rm(i,identifier,j,name, type, variables, observations,group)
# setwd("/Users/farzan/Desktop/Dropbox/Summer\ 2015/Job/Lagos\ Package/LAGOS\ Package")
# setwd("C:\\Users\\FWL\\Dropbox\\Summer 2015\\Job\\Lagos Package\\LAGOS Package")
save.image(file="data_1.054.1.RData")
