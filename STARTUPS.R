
df <- read.csv('50_Startups.csv')
head(df)

str(df)

summary(df)

any(is.na(df))

num.cols <- sapply(df, is.numeric)
library(corrplot)

m <- df[, num.cols]
m
corr <- cor(m)
corr
corrplot(corr)

library(caTools)


sample <- sample.split(df$Profit, SplitRatio = 0.7)
train <- subset(df, sample == T)
test <- subset(df, sample == F)
head(train)

model <- lm(Profit ~ ., data = train)
summary(model)

preds <- predict(model, test)

data2 <- data.frame(test$Profit, preds)
data2









 