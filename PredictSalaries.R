df<- read.csv('Salary_Data.csv')
head(df)
str(df)

any(is.na(df))

library(caTools)

sample <- sample.split(df$Salary, SplitRatio = 2/3)

train <- subset(df, sample==T)
test <- subset(df, sample==F)


##TRAIN MODEL

regressor <- lm(Salary ~ ., data = train)

summary(regressor)

y_pred <- predict(regressor, test)

y_pred

df2 <- data.frame(y_pred, test$Salary)
df2

library(ggplot2)
pl <- ggplot(train, aes(YearsExperience, Salary, color='red'))
pl + geom_point() + geom_line(aes(YearsExperience,predict(regressor, train), color='blue'))



