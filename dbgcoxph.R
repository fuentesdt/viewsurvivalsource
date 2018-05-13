#  Usage:
#   > source('dbgcoxph.R')
#   gdb --args Rscript dbgcoxph.R; b coxfit6; r
#  
#  build from source (may need different version on different linux)
# wget https://cran.r-project.org/src/contrib/Archive/survival/survival_2.38-1.tar.gz
# tar -xvf survival_2.38-1.tar.gz
# cp Makevars > /home/fuentes/.R/Makevars;  R CMD INSTALL  survival
       


library(survival)
print(packageVersion("survival"))

# print package directories
print(.libPaths())

head(lung)
class(lung)
dim(lung)

fit <- coxph(Surv(time, status)~sex, data=lung)
print("coxph summary")
print(summary(fit))
logrankme <- survdiff(Surv(time, status)~sex, data=lung)
print("log rank summary")
print(logrankme)


