% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/env_grid_filter.R
\name{env_grid_filter}
\alias{env_grid_filter}
\title{Filter occurrences in environmental space}
\usage{
env_grid_filter(
  occ.cl,
  env.data,
  grid.res,
  institution.code = "institutionCode",
  collection.code = "collectionCode",
  catalog.number = "catalogNumber",
  year = "year",
  date.identified = "dateIdentified",
  species = "species",
  identified.by = "identifiedBy",
  decimal.latitude = "decimalLatitude",
  decimal.longitude = "decimalLongitude",
  basis.of.record = "basisOfRecord",
  media.type = "mediaType",
  occurrence.id = "occurrenceID"
)
}
\arguments{
\item{occ.cl}{data frame with occurrence records information already
classified by \code{\link{classify_occ}} function.}

\item{env.data}{data frame with rows for occurrence observation and columns for
each environmental variable}

\item{grid.res}{numeric vector. Each value represents the width of each bin
in the scale of the environmental variable. The order in this vector is
assumed to be the same order in the of the variables in the \code{env.data}
data frame.}

\item{institution.code}{column name of \code{occ.cl} with the name (or acronym)
in use by the institution having custody of the object(s) or information
referred to in the record.}

\item{collection.code}{column name of \code{occ.cl} with The name, acronym,
code, or initials identifying the collection or data set from which the
record was derived.}

\item{catalog.number}{column name of \code{occ.cl} with an identifier
(preferably unique) for the record within the data set or collection.}

\item{year}{Column name of \code{occ.cl} the four-digit year in which the
Event occurred, according to the Common Era Calendar.}

\item{date.identified}{Column name of \code{occ.cl} with the date on which the
subject was determined as representing the Taxon.}

\item{species}{column name of \code{occ} with the species names.}

\item{identified.by}{column name of \code{occ.cl} with the name of who
determined the species.}

\item{decimal.latitude}{column name of \code{occ.cl} latitude in decimal
degrees.}

\item{decimal.longitude}{column name of \code{occ.cl} longitude in decimal
degrees.}

\item{basis.of.record}{column name with the specific nature of the data
record. See details.}

\item{media.type}{column name of \code{occ.cl} with the media type of recording.
See details.}

\item{occurrence.id}{column name of \code{occ} with link or code for the
occurrence record. See in
\href{https://dwc.tdwg.org/terms/#dwc:occurrenceID}{Darwin Core Format}}
}
\value{
Data frame with the same columns of \code{occ.cl}.
}
\description{
Filter the occurrence with the most realible species identification in the
environmental space. This function is based in the function envSample
provided by Varela et al. (2014) and were adapted to the naturaList package to
select the occurrence with the most realible species identification in each
environmental grid.
}
\examples{

\dontrun{
library(naturaList)
library(tidyverse)

data("cyathea.br")
data("speciaLists")
data("r.temp.prec")

occ <- cyathea.br \%>\%
  filter(species == "Cyathea atrovirens")

occ.cl <- classify_occ(occ, speciaLists, spec.ambiguity = "is.spec")

# temperature and precipitaion data
env.data <- raster::extract(
  r.temp.prec,
  occ.cl[,c("decimalLongitude", "decimalLatitude")]
) \%>\% as.data.frame()

# the bins for temperature has 5 degrees each and for precipitation has 100 mm each
grid.res <- c(5, 100)

occ.filtered <- env_grid_filter(
  occ.cl,
  env.data,
  grid.res
)

}

}
\references{
Varela et al. (2014). Environmental filters reduce the effects
  of sampling bias and improve predictions of ecological niche models.
  *Ecography*. 37(11) 1084-1091.
}
\seealso{
\code{\link[naturaList]{classify_occ}}
}
