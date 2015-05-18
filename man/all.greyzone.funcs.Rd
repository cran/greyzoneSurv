\name{greyzone.funcs}
%\alias{greyzone}
\alias{em.func}
\alias{cov.func}
\alias{greyzone.func}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
\packageTitle{greyzoneSurv}
%Find a Grey Zone Solution with Survival Data
}
\description{
Find two cutoffs for a marker by fitting a grey-zone model that will define high, intermediate, and low risk groups when the outcome is survival.
}
\usage{
em.func(error = 0.001, max.iter = 300, initial.values=NULL, y, delta, x)

cov.func(em.results, y, delta, x)

greyzone.func(cov.results, y, delta, x, plot.logistic=T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{error}{
    Convergence criterion as largest difference in parameter estimates between two consecutive iterations
}
  \item{max.iter}{
    Maximum number of iterations
}
  \item{initial.values}{
    A list of initial parameters with such components as z, lamda, beta, and gamma with the default being NULL.
    
    z is an initial guess of dimension nx1 regarding whether each subject or patient is at high risk (=1) or low risk (=0); lamda is an initial guess about the scale parameter for a Weibull distribution (lamda=1 for an exponential distribution); beta is an initial guess on the regression coefficients which include an intercept and a slope linking the latent class variable and the survival outcome, and gamma is an initial guess on the regression coefficients which include an intercept and a slope linking the latent class variable and the marker values.     
}
  \item{y}{A nx1 vector of survival time in years
}
  \item{delta}{A nx1 vector of censoring indicator
}
  \item{x}{A nx2 matrix, with the 1st column being all 1s and the 2nd column being the marker values
}

\item{em.results}{
    Results from calling em.func
}
  \item{cov.results}{Results from calling cov.func
}
  \item{plot.logistic}{A logical variable. If T, it will plot the fitted logistic function between the marker values and the fitted probability of high risk for each patient 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The package assumes higher marker values correspond to shorter survival times, so it is important to make sure this is the case with your data. If initial.values is NULL, the function will generate initial values automatically based on this assumption.  
}
\value{
The function \code{\link{em.func}} returns a list with components such as parameter estimates and number of iterations from the EM algorithm as well as whether the EM algorithm fitting generated an error.

The function \code{\link{cov.func}} returns a list with components such as the variance-covariance matrix, standard errors and 95\% confidence limits for the parameter estimates estimated from calling \code{\link{em.func}}. An additional component it returns is the estimated probability of being at high risk for each patient given patient survival and marker data. 

The function \code{\link{greyzone.func}} returns a list with components such as the grey zone cutoffs greyzone.ll and greyzone.ul so that patient will be classified as low risk if marker value is < greyzone.ll, high risk if marker value is >= greyzone.ul, and intermediate risk (or in the grey zone) if marker value is >= greyzone.ll and < greyzone.ul.
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
%
\seealso{
%\code{\link{em.func}}, \code{\link{cov.func}}
\code{\link{genSurvData}}, \code{\link{cox.summary}}
}
\examples{
#use the package data "mydata" to fit the grey-zone model in 3 steps
data(mydata)
dim(mydata)
head(mydata)

#~step 1: extract information needed for fitting the model and 
#make some initial guesses of some parameter values 
n=nrow(mydata)
y=mydata$time/365.25
delta=mydata$event
score=mydata$x
x=cbind(rep(1, n), score)

#~step 2: get EM estimates and variance-covariance matrix
results.em=em.func(initial.values=NULL, y=y, delta=delta, x=x)
is.na(results.em$em.error)
#only if above is true, you should proceed; otherwise try a different set 
#of intial values and try calling em.func again
names(results.em)
#after you successfully get an EM solution proceed to get the variance-covariance matrix
results.cov=cov.func(results.em, y=y, delta=delta, x=x)
names(results.cov)

#~step 3: when there are no errors above proceed to calculate the grey zone
results=greyzone.func(results.cov, y, delta, x, plot.logistic=FALSE)
names(results)
!is.na(results$greyzone.ll) & !is.na(results$greyzone.ul)
#only when above is true, you have a grey-zone solution and you can proceed
#sometimes there is not a grey-zone solution even if the EM fitting is successful.
#In that case, it means the grey-zone model is not a good fit for the data.
score3=rep(0, n)
score3[score>=results$greyzone.ll & score<results$greyzone.ul]=1
score3[score>=results$greyzone.ul]=2
#if you get through steps 1-3, you are done fitting the grey-zone model!

#now you may want to compare with a 2-group model, so fit a 2-group model 
res=bestcut2(data=mydata, stime='time', sind='event', var='x')
score2=res[,'bestcut2']

#then compare the 2-group and grey-zone models, but note here we compare on the training data
#ideally we want to compare them on a test data set
cox.2group=cox.summary(stime=mydata$time, sind=mydata$event, var=score2)
cox.3group=cox.summary(stime=mydata$time, sind=mydata$event, var=score3)
cox.2group
cox.3group
fit.2group = survfit(Surv(mydata$time, mydata$event)~score2)
fit.3group = survfit(Surv(mydata$time, mydata$event)~score3)
par(mfrow=c(1,2))
plot(fit.2group, lty=1:2, main='2-group model', las=1, 
    ylab='Probability of Survival', xlab='Days from Time 0')
plot(fit.3group, lty=1:3, main='grey-zone model', las=1, 
    ylab='Probability of Survival', xlab='Days from Time 0')

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{EM algorithm }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
