##Load data##
library(tidyverse)
library(Hmisc)
GlobalGap <- GGI2013

#remove rows with missing data
GlobalGap_O <- na.omit(GlobalGap)

##  histogram and smoothed density estimate##

###Normality assessments-- two of these are required by the assignment. QQ plot and shapiro wilke are not. 
##histograms--na.rm only needed if running this on the data before it has had na.omit run on it
ggplot()+
  geom_histogram(data = GlobalGap_O, na.rm = TRUE,
                 aes(x= `2013`, y=..density..),
                 binwidth = 0.01,color="black",fill="lightblue")+
  geom_density(data = GlobalGap_O, na.rm = TRUE, aes(x = `2013`),
               color="sienna1",size=1.5)


##create boxplots 

boxplot(GlobalGap_O$`2006`, GlobalGap_O$`2010`, GlobalGap_O$`2013`, names=c("2006","2010" , "2013"))

#Q-Q Plots
qqnorm(GlobalGap_O$`2013`)
qqline(GlobalGap_O$`2013`)
qqnorm(GlobalGap_O$`2010`)
qqline(GlobalGap_O$`2010`)
qqnorm(GlobalGap_O$`2006`)
qqline(GlobalGap_O$`2006`)


##Summary stats for each year##
summary(GlobalGap_O$`2006`)
summary(GlobalGap_O$`2010`)
summary(GlobalGap_O$`2013`)


# paired t-test

t.test(GlobalGap_O$`2006`, GlobalGap_O$`2013`, paired = TRUE, var.equal = FALSE, alternative = "two.sided")


