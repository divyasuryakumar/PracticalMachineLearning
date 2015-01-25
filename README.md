PracticalMachineLearning
========================
Link to html file: https://rpubs.com/divyasuryakumar/PML

Data 
The training data for this project are available here: 
https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv
The test data are available here: 
https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv

The data for this project come from this source: http://groupware.les.inf.puc-rio.br/har. If you use the document you create for this class for any purpose please cite them as they have been very generous in allowing their data to be used for this kind of assignment. 
What you should submit

The goal of your project is to predict the manner in which they did the exercise. This is the "classe" variable in the training set. You may use any of the other variables to predict with. You should create a report describing how you built your model, how you used cross validation, what you think the expected out of sample error is, and why you made the choices you did. You will also use your prediction model to predict 20 different test cases. 
1. Your submission should consist of a link to a Github repo with your R markdown and compiled HTML file describing your analysis. Please constrain the text of the writeup to < 2000 words and the number of figures to be less than 5. It will make it easier for the graders if you submit a repo with a gh-pages branch so the HTML page can be viewed online (and you always want to make it easy on graders :-).
2. You should also apply your machine learning algorithm to the 20 test cases available in the test data above. Please submit your predictions in appropriate format to the programming assignment for automated grading. See the programming assignment for additional details. 

Reproducibility 
Due to security concerns with the exchange of R code, your code will not be run during the evaluation by your classmates. Please be sure that if they download the repo, they will be able to view the compiled HTML version of your analysis.

Executive Summary 

This document presents the results of the Practical Machine Learning Peer Assessments in a report using a single R markdown document that can be processed by knitr and be transformed into an HTML file.

Since we have a data set with to many columns and we need make a class prediction, we decide implement a random forests model, that’s no need cross-validation or a separate test set to get an unbiased estimate of the test set error. Before apply the dataset to our prediction modelo, we decide remove all the columns that having less than 60% of data filled, instead try to filled it with some center measure. Our model accuracy over validation dataset is equal to 99.9235%. This model promoted a excelente prediction results with our testing dataset and generated the 20th files answers to submit for the Assignments. The Assignments returned to us that he 20th files answers as being correct!

Requisites of This Assignment This assignment instructions request to: 1. predict the manner in which they did the exercise. This is the “classe” variable in the training set. All other variables can be use as predictor. 2. Shwo how I built my model, how I used cross validation, what I think the expected out of sample error is, and why I made the choices I did. 3. This prediction model alsi to predict 20 different test cases from the test data are available here: https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv
