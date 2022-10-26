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
install.packages("C50")
library(C50)


accent_model=C5.0(accent_train[-1],accent_train$language)
accent_model
summary(accent_model)

#Evaluate the model
accent_pred=predict(accent_model,accent_test)
table(accent_pred,accent_test$language)

#use 
accent_model=C5.0(accent_train[-1],accent_train$language,trials = 10)

