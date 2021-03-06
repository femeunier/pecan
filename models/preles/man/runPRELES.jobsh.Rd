% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runPRELES.jobsh.R
\name{runPRELES.jobsh}
\alias{runPRELES.jobsh}
\title{Function to process ncdf file, run PRELES model, and convert output .nc file in CF standard}
\usage{
runPRELES.jobsh(met.file, outdir, parameters, sitelat, sitelon, start.date,
  end.date)
}
\arguments{
\item{outdir}{Location of PRELES model output}

\item{in.path}{location on disk where inputs are stored}

\item{in.prefix}{prefix of input and output files}

\item{start_date}{Start time of the simulation}

\item{end_date}{End time of the simulation}
}
\description{
Function to process ncdf file, run PRELES model, and convert output .nc file in CF standard
}
\author{
Tony Gardella, Michael Dietze
}
