\name{genSurvData}
\alias{genSurvData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulate Survival Outcome Given Marker Values
}
\description{
This function simulates survival outcome with a fixed censoring rate based on a Weibull distribution given input values such as study recruitment period, patient marker values, their true risk groupings (1=high risk and 0=low risk), and true regression coefficients. 
}
\usage{
genSurvData(n, recruitment.yrs=2, baseline.hazard=365.25*5, shape=1, censoring.rate=0, 
            beta.continuous, beta.binary=0, x, xhigh, ran.seed)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
    Sample size
}
  \item{recruitment.yrs}{
    Patient recruitment period in years (default=2)
}
  \item{baseline.hazard}{
  Baseline hazard, which is the mean survival time (in days) when covariates=0 (default=365.25*5 days)
  }
  
  \item{shape}{
    The shape parameter for the Weibull distribution (it is exponential when shape=1)
}
  \item{censoring.rate}{
    Censoring rate
}
  \item{beta.continuous}{
    A true regression coefficient that links the continuous marker values to the survival outcome 
}
  \item{beta.binary}{
    A true regression coefficient that links the high risk group to the survival outcome
}
  \item{x}{
    A nx1 vector for the marker values
}
  \item{xhigh}{
    A nx1 vector of 1s and 0s indicating patient true risk identities (1=high risk and 0=low risk)
}
  \item{ran.seed}{
    Seed number for random number generation
}
}
\details{
The function can be used to generate survival data if you do not have any to try the grey-zone model.
}
\value{
It returns a list with two components: the simulated survival data in days and the final censoring rate (which should be the same as the input censoring rate).
}

%\references{
%% ~put references to the literature/web site here ~
%}
%\author{
%%  ~~who you are~~
%}
%\note{
%%  ~~further notes~~
%}
%% ~Make other sections like Warning with \section{Warning }{....} ~
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{em.func}}, \code{\link{cov.func}}, \code{\link{greyzone.func}}
}
\examples{
## Generate package data called "mydata"
## Simulate high/low risk groupings, continuous marker values for each group, and survival data 
## so that the higher maker values correspond to shorter survival. 
n=300
censoring.rate=0.3
rate.lrisk=0.7   #rate of low risk
n.lrisk=n*rate.lrisk
n.hrisk=n-n.lrisk
mu=3  
beta.continuous=0.5
beta.binary=0.5
ran.seed=1000
set.seed(ran.seed)
x0=rnorm(n.lrisk, 0, 1)   #low risk patients have marker values distributed as Normal(0,1)
set.seed(ran.seed)
x1=rnorm(n.hrisk, mu, 1)   #high risk patients have maker values distributed as Normal(mu,1)
score=c(x0, x1)
score.high=c(rep(0, n.lrisk), rep(1, n.hrisk))
mydata=genSurvData(n=n, censoring.rate=censoring.rate,
                beta.continuous=beta.continuous, beta.binary=beta.binary, 
                x=score, xhigh=score.high, ran.seed=ran.seed)$data
dim(mydata)
head(mydata)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
