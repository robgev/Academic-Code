# In R studio, go to Session -> Set Working
# Directory -> To Source File Location
data <- read.csv(file="data.csv", header=TRUE, sep=",")
open <- data$Open
adjclose <- data$Adj.Close
returns <- 1:length(adjclose)
for(i in 1:length(adjclose)) {
  returns[i] <- (adjclose[i] - open[i]) / adjclose[i]
}
returns
hist(returns)
stem(returns)
