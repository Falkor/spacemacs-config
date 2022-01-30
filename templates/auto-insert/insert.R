#!/usr/bin/env R
# Time-stamp: < >
################################################################################
## %f
##
## Copyright (c) %y %U %a
## .             %o
## 
## Description: %@
##
## More details on R: 
##  * http://www.r-project.org/
##  * [RStudio, an complete R IDE](http://www.rstudio.com/)
##  * http://www.statmethods.net/index.html
################################################################################

## store the current directory
initial.dir<-getwd()

## ---------------------------------------------------------------
## Prepare workspace
## ---------------------------------------------------------------

rm(list=ls())
## library(...)
## if (!interactive()) sink('script file name.log',split=TRUE)

## set the output file
##sink("example.out")

## ---------------------------------------------------------------
## Load data
## ---------------------------------------------------------------

## load('xxx.Rdata')
## dta = read.csv(...)



## ---------------------------------------------------------------
## Process data
## ---------------------------------------------------------------



## ---------------------------------------------------------------
## Create plots
## ---------------------------------------------------------------

## pdf(...)
##
## dev.off()


## ---------------------------------------------------------------
## Write output files
## ---------------------------------------------------------------
## close the output file
##sink()
## unload the libraries
##detach("package:nlme")
## change back to the original directory
setwd(initial.dir)
## write.csv(...)
## save(list=c(...), file='')
