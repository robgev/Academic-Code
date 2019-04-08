x <- 1:10 #Sequence, cannot specify the step
x <- seq(from = 1, to = 10, by = 2) #In case you need to specify the step
x <- cars$speed #Built in data in R, use data() to see more tables
hist(x, freq = F, main = "My own histogram")
#Here by right = F we change the convention
#Instead of right point convention it will use left point convention
hist(x, freq = F, main = "Historgram with left point convention", right = F)
hist(x, breaks = c(0, 3, 15, 20, 30)) # Change the bins
bins <- c(0:10, seq(11, 30, by = 2)) # Or,for example 1:30
hist(x, breaks = bins) # You can use any vector as breaks. Example seq(1, 30, by = 0.3) or the one written here
x[x > 20] # Choose all elems from the array which are bigger than 20
which(x > 20) # Choose indices of all elems from the array which are bigger than 20
x <- rexp(10000) # 100 random numbers distributed exponentially with rate/lambda = 1
hist(x, freq = F, xlim = c(0, 10), ylim = c(0, 1), col = "blue", ylab = "A")
par(new = T) # for making 2 graphs on the same plot
plot(dexp, xlim = c(0, 10), ylim = c(0, 1), col = "red", lwd = 2, ylab = "A") # or add = TRUE. col for color