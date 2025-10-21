setwd("P:/projects/PEP/OMalkowski/Intrinsic capacity") # Set working directory
install.packages("tidyverse") # Install the tidyverse package
library(tidyverse) # Load the library
mcmcmlirt_rsnew<-read.csv(file.choose()) # Choose .csv file for analyses
View(mcmcmlirt_rsnew) # View dataset

install.packages("sirt") # Install the package to run the Bayesian Multilevel Item Response Theory (MLIRT) analyses
library(sirt) # Load the library
install.packages("coda") # Install the package to run the Bayesian MLIRT analyses
library(coda) # Load the library
group <- mcmcmlirt_rsnew$interval # Set the interval variable as the group identifier - allows the different intervals to be included as random effects
# Set the number of burn-in iterations and iterations for all examples
burnin <- 100 ; iter <- 5000

#***
# dat identifies the dataframe for the Bayesian MLIRT analyses and uses items in columns 4-28 to create the latent score (i.e., omitting the first three columns: STUDYID, interval, nmcount)
# Model 1: no intercept variance, no slopes
mod1 <- sirt::mcmc.2pno.ml( dat=mcmcmlirt_rsnew[,4:28], group=group, est.b.Var="n",
                             burnin=burnin, iter=iter, link="normal", progress.iter=20 )
options(max.print=1000000) # Remove limits on the amount of information printed in the console (enables the full output to be displayed)
summary(mod1) # Summarize results

#***
# Model 2a (Model 2 in article): itemwise intercept variance, no slopes
mod2a <- sirt::mcmc.2pno.ml( dat=mcmcmlirt_rsnew[,4:28], group=group, est.b.Var="i",
                              burnin=burnin, iter=iter, link="normal", progress.iter=20 )
options(max.print=1000000)
summary(mod2a)

#***
# Model 2b (Model 3 in article): homogeneous intercept variance, no slopes
mod2b <- sirt::mcmc.2pno.ml( dat=mcmcmlirt_rsnew[,4:28], group=group, est.b.Var="j",
                              burnin=burnin, iter=iter, link="normal", progress.iter=20 )
options(max.print=1000000)
summary(mod2b)

#***
# Model 3 (Model 4 in article): intercept variance and slope variances
#          hierarchical item and slope parameters
mod3 <- sirt::mcmc.2pno.ml( dat=mcmcmlirt_rsnew[,4:28], group=group,
                             est.b.M="h", est.b.Var="i", est.a.M="h", est.a.Var="i",
                             burnin=burnin, iter=iter, link="normal", progress.iter=20 )
options(max.print=1000000)
summary(mod3)

data4<-mod2b$person # Extract person parameter estimates from the final model and assign them to a dataset "data4"
View(data4) # View data
range(data4$EAP,na.rm=TRUE) # Returns the range of the estimates

library(scales) # Load the library
dat<-rescale((data4$EAP), to = c(0, 100)) # Transform the latent trait score into a 0-100 scale and assign the results to a dataset "dat"
View(dat) # View data
datnew<-round(dat, digits = 0) # Round the values to 0 decimal places and assign the results to a new dataset "datnew"
View(datnew) # View data

mcmcmlirt_rsnew$ICscore<-datnew # Append the transformed intrinsic capacity scores to the full dataset that was originally imported into R for analyses
View(mcmcmlirt_rsnew) # View dataset

install.packages("foreign") # Install the foreign package
require(foreign) # Load the library
# Export dataset in .csv format
write.csv(mcmcmlirt_rsnew, "P:/projects/PEP/OMalkowski/Intrinsic capacity/mcmcmlirtrsnewdata.csv")