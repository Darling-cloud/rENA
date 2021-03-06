% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ENAset.R
\docType{class}
\name{ENAset}
\alias{ENAset}
\title{ENAset R6class}
\format{An object of class \code{R6ClassGenerator} of length 24.}
\usage{
ENAset
}
\description{
ENAset R6class
}
\section{Fields}{

\describe{
\item{\code{enadata}}{An \code{\link{ENAdata}} object originally used to create the set}

\item{\code{points.raw}}{A data frame containing accumulated adjacency (co-occurrence) vectors per unit}

\item{\code{points.normed.centered}}{A data frame of centered normed accumulated adjacency (co-occurrence) vectors for each unit}

\item{\code{points.rotated}}{A data frame of point positions for number of dimensions specified in ena.make.set (i.e., the centered, normed, and rotated data)}

\item{\code{line.weights}}{A data frame of connections strengths per unit (Data frame of normed accumu- lated adjacency (co-occurrence) vectors for each unit)}

\item{\code{node.positions}}{- A data frame of positions for each code}

\item{\code{codes}}{- A vector of code names}

\item{\code{rotation.set}}{- An \code{\link{ENARotationSet}} object}

\item{\code{correlation}}{- A data frame of spearman and pearson correlations for each dimension specified}

\item{\code{variance}}{- A vector of variance accounted for by each dimension specified}

\item{\code{centroids}}{- A matrix of the calculated centroid positions}

\item{\code{function.call}}{- The string representation of function called}

\item{\code{function.params}}{- A list of all parameters sent to function call}
}}

\keyword{datasets}
