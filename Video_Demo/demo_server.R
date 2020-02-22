# Prediction model:
data.obj <- read.csv("ucsbdata_demo.csv")  # read the data file
data.obj$Index <- as.Date(data.obj$Index)  # change the data type of Index to date
train <- as.numeric(format(data.obj$Index, "%Y")) %in% c(2009:2018)  # select years from 2009 to 2018
lm.obj <- lm(R ~ CLOSE, data=data.obj[train, ])  # simple linear regression with one predictor, CLOSE
summary(lm.obj)  # show results

#
pred <- predict(lm.obj, newdata=data.obj[nrow(data.obj), ])  # prediction about R on 12/31/2018
cash <- 10000; market <- 0; buy <- 0; sell <- 0  # initial values
if (pred > 0) { 
  buy <- cash*0.5 
} else { 
  sell <- market*0.5 
}
write.table(c(pred, buy, sell), "output.txt", row.names = FALSE,col.names = FALSE)

