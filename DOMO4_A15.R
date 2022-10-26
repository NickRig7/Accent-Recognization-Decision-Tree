print("BIKASH DEKA")
print("Roll no: 15")

accent=read.table(file=file.choose(),sep=",",header = TRUE)
View(accent)
str(accent)
table(accent$language)

accent$language=factor(accent$language)
table(accent$language)
str(accent)

summary(accent)


#scalling
accent_scale=scale(accent[-1])
View(accent_scale)

#Creating the training and testing data
set.seed(1)
accent_sample=sample(329,229)
accent_sample

accent_train=accent[accent_sample,]
accent_test=accent[-accent_sample,]

#accent_train_label=accent[1:229,]
#accent_test_label=accent[230:329,]

#Train the model
#install.packages("C50")
library(C50)
#accent_model=C5.0(accent_train[-1],accent_train_label$language)

#
accent_model=C5.0(accent_train[-1],accent_train$language)
accent_model
summary(accent_model)

#Evaluate the model
accent_pred=predict(accent_model,accent_test)
table(accent_pred,accent_test$language)

#use 
accent_model=C5.0(accent_train[-1],accent_train$language,trials = 10)
#
#
#ok here i have used the C5.0 decision tree algorithm to get the 
#prediction of the accent as it chosses the entrpoy and reduces the
#entropy i.e the randomness or disorder and increases the homogeninty
#as we have to reduce the entropy whenever we are going to find the 
#split and by spliting the dat the entropy must decrease and 
#if the entrpoy is 0 that means the data is homogeneous
#higher the value of entrpoy hetrogeneuos the data is
#pruning the desicion tree can countinue to grow indefinetly and
#chossing a spliting feature and dividing the data into smaller and 
#smaller partion untill each example is perfectly classified 
#or the algorithm runs out of feautres to split out
#but if the tree growns very large then the data will be complex to 
#understand it. i.e it will be overfitted 
#the processs of pruning will reduce the sizze  such that it 
#journalises better so that the size of tree will be smaller
#enough so that we can easily understand the desicion tree
#in a better way and the decisions that is going to be 
#taken will be much relevant.