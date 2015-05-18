\name{greyzoneSurv-package}
\alias{greyzoneSurv-package}
\docType{package}
\title{
\packageTitle{greyzoneSurv}
%Fit a Grey-Zone Model with Survival Data
}
\description{
\packageDescription{greyzoneSurv}
%Useful when one wants to classify patients into low, intermediate, and high risk groups for disease progression based on a continuous marker that is associated %with progression-free survival. 
}
\details{
%\tabular{ll}{
%Package: \tab greyzoneSurv\cr
%Type: \tab Package\cr
%Version: \tab 1.0\cr
%Date: \tab 2015-05-14\cr
%License: \tab What license is it under?\cr
%}
To fit the grey-zone model, one would need to call the functions in the order of \code{\link{em.func}}, \code{\link{cov.func}}, and \code{\link{greyzone.func}}. 

The package also provides a function \code{\link{bestcut2}} to fit a 2-group model, that is, it will find an optimal cutoff of the marker to divide patients into high and low 2 risk groups. Plus there is a function \code{\link{genSurvData}} to generate survival data with a fixed censoring rate. 
}
\author{
\packageAuthor{greyzoneSurv}

Maintainer: \packageMaintainer{greyzoneSurv}
%Pingping Qu and John Crowley
%Maintainer: Pingping Qu <pingpingq@crab.org> <quping@yahoo.com>
}

\references{
Pingping Qu, Bart Barlogie and John Crowley (2015) "Using a Latent Class Model to Refine Risk Stratification in Multiple Myeloma" (under review)
}
%~~ Optionally other standard keywords, one per line, from ~~
%~~ file KEYWORDS in the R documentation directory ~~
%\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%\}
%\examples{
%~~ simple examples of the most important functions ~~
%}
