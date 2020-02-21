data.obj <- read.csv("ucsbdata.csv")  # read the data file
data.obj$Index <- as.Date(data.obj$Index)  # change the data type of Index to date
train <- as.numeric(format(data.obj$Index, "%Y")) %in% c(2009:2018)  # select years from 2009 to 2018
lm.obj <- lm(R ~ CLOSE, data=data.obj[train, ])  # simple linear regression with one predictor, CLOSE
summary(lm.obj)  # show results
