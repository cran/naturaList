% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internal_functions.R
\name{func.det.by.esp}
\alias{func.det.by.esp}
\title{Internal function of naturaList - Detect if a string has a specialist name}
\usage{
func.det.by.esp(sp.df, i, specialist)
}
\arguments{
\item{sp.df}{reduced version of occurrence data frame provided
in {\link[naturaList]{classify_occ}}}

\item{i}{row number of specialist data frame}

\item{specialist}{specialist data}
}
\value{
integer with the row numbers of the \code{sp.df} data frame which was
 identified by the specialist name in row \code{i}.
}
\description{
Detect if a string with identifiers name has a specialist name. It is used inside
 {\link[naturaList]{classify_occ}}
}
\keyword{internal}
