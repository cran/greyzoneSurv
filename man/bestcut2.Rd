\name{bestcut2}
\alias{bestcut2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Find an Optimal Cutoff for the 2-group Model
}
\description{
This function uses a brute force method to search for the best cutoff value for a marker based on the log rank test to divide patients into high and low risk groups given survival data.  
}
\usage{
bestcut2(data, stime, sind, var, leave = 20)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{A data frame or numerical matrix
}
  \item{stime}{A character string that tells the column name for survival time in the data
}
  \item{sind}{A character string that tells the column name for censoring indicator in the data
}
  \item{var}{A character string that tells the column name for marker values in the data
}
  \item{leave}{Minimum number of patients in the resulting high and low risk groups 
}
}
\value{
It returns a data frame with the input data as well as the final optimal high and low risk groupings saved in the column bestcut2 (1=high risk and 0=low risk). Additionally, it has columns such as the cutoff value for the marker, the chi-square statistics and the log rank p values for testing equality of survival in the resulting high and low risk groups from using each possible marker value as cutoff.  
}
\examples{
## Use the package data "mydata" to fit the 2-group model
data(mydata)
res=bestcut2(data=mydata, stime='time', sind='event', var='x')
table(res[,'bestcut2'])

#compare the true groupings and that from the 2-group model
table(res[,c('xhigh', 'bestcut2')]) 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
