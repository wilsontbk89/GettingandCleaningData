---
title: "README"
author: "Wilson Tan"
date: "Thursday, March 12, 2015"
output: html_document
---
#Getting and Cleaning Data Course Project

##Introduction
This repository contains the course project for the Coursera course "Getting and Cleaning data". 

##About the raw data
There are 561 variables (features) across 30 subjects and 6 activities which can be found in features.txt, subject_test.txt and y_test.txt respectively. These data are separated into the training set and test set.

##Aim
Here, we aim to create an R script that merge the test and training sets together, extract relevant information as well as producing a tidy dataset. In this analysis, the tidy dataset of interest is given the name "indeptidydataset.txt", which can also be found in this repository.

##Preliminary work
First, download the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Then, extract the UCI HAR Dataset in your working directory and name it "UCI HAR Dataset". Once, it is done, proceed to executing "run_analysis.R".

##Explanation of R Code
The script run_analysis.R performs the 5 steps described in the course project's definition. For more information, refer to the code book.

##About the Code Book
The CodeBook.md file explains the transformations performed and the resulting data and variables.
