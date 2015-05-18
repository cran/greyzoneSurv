\name{cox.summary}
\alias{cox.summary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Summarize after Fitting Cox regression

}
\description{
A wrapper function to summarize 2-group and grey-zone (3-group) models with \eqn{R^2} and c-index after fitting Cox regression.
}
\usage{
cox.summary(stime, sind, var)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{stime}{A nx1 vector of survival time
}
  \item{sind}{A nx1 vector of censoring indicator
}
  \item{var}{A nx1 vector of risk groupings to correlate with survival. For the 2-group and 3-group models, it is a categorical vector
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
It returns a vector with components such as the p value from fitting a Cox regression model, AIC (Akaike information criterion), and the c-index [1, 2], \eqn{R^2} from the XO method [3], the OXS method [4] and the Nagelkerke method.
}
\references{
Harrell F, Califf R, Pryor D, Lee K and Rosati R. Evaluating the yield of medical tests. \emph{JAMA: The Journal of the American Medical Association} 1982; 247(18):2543-2546.

Harrell F, Lee K, Califf R, Pryor D and Rosati R. Regression modeling strategies for
improved prognostic prediction. \emph{Statistics in Medicine} 1984; 3(2):143-152.

Xu R and O`Quigley J. A \eqn{R^2} type measure of dependence for proportional hazards models. \emph{Nonparametric Statistics} 1999; 12:83-107.

O`Quigley J, Xu R and Stare J. Explained randomness in proportional hazards models. \emph{Statistics in Medicine} 2005; 24:479-489.

}
%\author{
%%  ~~who you are~~
%}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{greyzone.func}}
}
\examples{
#See Examples for greyzone.func in this package.
}
%\keyword{ }
%\keyword{ }% __ONLY ONE__ keyword per line
