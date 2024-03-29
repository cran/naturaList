% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/define_env_space.R
\name{define_env_space}
\alias{define_env_space}
\title{Define environmental space for species occurrence}
\usage{
define_env_space(env, buffer.size, plot = TRUE)
}
\arguments{
\item{env}{matrix or data frame with two columns containing two
environmental variables. The variables must be numeric, even for data frames.}

\item{buffer.size}{numeric value indicating a buffer size around each point
which will delimit the environmental geographical border for the occurrence
point. See details.}

\item{plot}{logical. whether to plot the polygon. Default is TRUE.}
}
\value{
An object of sfc_POLYGON class
}
\description{
Based on two continuous environmental variables, it defines a
bi-dimensional environmental space.
}
\details{
The environmental variables are standardized by range, which turns
 the range of each environmental variable from 0 to 1. Then, it is delimited
 a buffer of size equal to \code{buffer.size} around each point in this
 space and a polygon is draw to link these buffers. The function returns the
 polygon needed to link all points, and the area of the polygon indicates
 the environmental space based in the variables used.
}
\examples{
\dontrun{
library("raster")

# load climate data
data("r.temp.prec")
env.data <- raster::as.data.frame(r.temp.prec)

define_env_space(env.data, 0.05)
}






}
