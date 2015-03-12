---
title: "Codebook"
author: "Wilson Tan"
date: "Thursday, March 12, 2015"
output: html_document
---
#Getting and Cleaning Data Course Project
##Codebook
###Introduction to data
The data set was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

###Variables
The 3-axial time domain signals from accelerometer and gyroscope were captured at a constant rate of 50 Hz. Then they were filtered to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another filter. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these time domain signals to obtain frequency domain signals.

The set of variables that were estimated from these signals are:

- mean(): Mean value

- std(): Standard deviation

- mad(): Median absolute deviation

- max(): Largest value in array

- min(): Smallest value in array

- sma(): Signal magnitude area

- energy(): Energy measure. Sum of the squares divided by the number of values.

- iqr(): Interquartile range

- entropy(): Signal entropy

- arCoeff(): Autoregression coefficients with Burg order equal to 4

- correlation(): Correlation coefficient between two signals

- maxInds(): Index of the frequency component with largest magnitude

- meanFreq(): Weighted average of the frequency components to obtain a mean frequency

- skewness(): Skewness of the frequency domain signal

- kurtosis(): Kurtosis of the frequency domain signal

- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

- angle(): Angle between some vectors.

A full description is available at the site where the data was obtained is found in: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In this analysis, we are only interested in the variables which involve the mean and standard deviation.

###Data transformation
The raw data sets are processed with run_analysis.R script to create a tidy data set. The steps in run_analysis.R script are as follows:

1. Read all the separate pieces of information as individual data.frames using read.table(). Then, join them using rbind() command.
2. Use grep() to subset out the information/variables of interest (mean and standard deviation) from the whole dataset. After extracting these columns, they are given the correct names, obtained from features.txt using the gsub() command.
3. We match the activity indicated by values 1:6 in the data set with the actual names of the activities shown by the variable activity_labels.txt.
4. Use cbind to bind the dataset to their relevant subject ids and activities, producing a full tidy dataset, herein known as the variable "tidyData".
5. Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called indeptidydataset.txt, and uploaded to this repository.




