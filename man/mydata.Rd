\name{mydata}
\alias{mydata}
\docType{data}
\title{
Package Data
}
\description{
The data set can be used to test the grey-zone and 2-group models.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(mydata)}
\format{
The data set is a data frame with 300 rows and 4 columns for patient survival time (time), censoring event (event), marker values (x), and true risk groups (xhigh=1 for high risk and 0 for low risk).
%  The format is:
% chr "survAUC"
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
The data were generated based on a Weibull distribution for survival times and normal distributions for marker values in both the high and low risk patients. 

}
\source{
The data were generated with the code in the Examples of \code{\link{genSurvData}} in this package.
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}

%\references{
%%  ~~ possibly secondary sources and usages ~~
%}
\examples{
data(mydata)
}
%\keyword{Weibull}
