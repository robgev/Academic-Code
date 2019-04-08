experiment <- function() {
  numbers <- rnorm(200, mean=0.7, sd=1.1)
  rawOutliers <- boxplot(numbers, plot=F)$out
  outliers <- which(numbers %in% rawOutliers)
  return(length(outliers))
}

data <- integer(100) # or sum <- 0
for (i in 1:100) {
  data[i] = experiment()
}

mean(data)