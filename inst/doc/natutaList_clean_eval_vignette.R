## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  eval = TRUE,
  echo = TRUE,
  message = FALSE,
collapse = TRUE,
comment = "#"
)

## ----install, message=FALSE---------------------------------------------------
library(naturaList)
library(raster)
library(rnaturalearth)
library(dplyr)

## ----load_data----------------------------------------------------------------

data("cyathea.br") # occurrence dataset
data("speciaLists") # specialists dataset


## ----classification-----------------------------------------------------------

occ.class <- classify_occ(occ = cyathea.br, spec = speciaLists)


## ----table_res----------------------------------------------------------------

table(occ.class$naturaList_levels)


## ----clim_data----------------------------------------------------------------

# download and load the bioclim raster layers
bioclim <- getData('worldclim', var='bio', res=10)

# Transform occurrence data in SpatialPointsDataFrame
spdf.occ.cl <- SpatialPoints(occ.class[, c("decimalLongitude", "decimalLatitude")])

# redefine the extent of bioclim layers 
c.bioclim <- crop(bioclim, spdf.occ.cl) 


# select two layers
raster.temp.prec <- c.bioclim[[c("bio1", "bio12")]]
df.temp.prec <- as.data.frame(raster.temp.prec)


## ----env_space----------------------------------------------------------------

### Define the environmental space for analysis
env.space <- define_env_space(df.temp.prec, buffer.size = 0.05, plot = F)


## ----geo_space----------------------------------------------------------------

# delimit the geographic space
# land area
data('BR')


## ----compare------------------------------------------------------------------
# filter by year to be consistent with the environmental data
occ.class.1970 <- 
  occ.class %>% 
  dplyr::filter(year >= 1970)

# cleaning evaluation process
cl.eval_all <- clean_eval(occ.cl = occ.class.1970,
                              env.space = env.space,
                              geo.space = BR,
                              r = raster.temp.prec) 

# the amount of area remained after cleaning process 
area_remained <- cl.eval_all$area 


## ----clean_evaluation---------------------------------------------------------
rich.before.clean <- rasterFromXYZ(cbind(cl.eval_all$site.coords,
                                         cl.eval_all$rich$rich.BC))
rich.after.clean <- rasterFromXYZ(cbind(cl.eval_all$site.coords,
                                         cl.eval_all$rich$rich.AC))



## ----plotRich-----------------------------------------------------------------

plot(rich.before.clean, main = "Richness before cleaning")
plot(rich.after.clean, main = "Richness after cleaning")


