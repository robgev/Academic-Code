# install.packages("MASS")
library(MASS)
nrow(Boston)
ncol(Boston)

# Not working? :D layout(matrix(c(1,2, 3, 4), 2, 2, byrow = TRUE))
ggplot(Boston, aes(x = nox, y = crim)) + geom_point()
ggplot(Boston, aes(x = rm, y = crim)) + geom_point()
ggplot(Boston, aes(x = age, y = crim)) + geom_point()
ggplot(Boston, aes(x = dis, y = crim)) + geom_point()
ggplot(Boston, aes(x = lstat, y = crim)) + geom_point()

# First let's see the crime rate hist
hist(Boston$crim, breaks = 50)
# Now take rates > 20
nrow(Boston[Boston$crim > 20, ])
range(Boston$crim)

# Same procedure for the other 2
hist(Boston$tax, breaks = 50)
nrow(Boston[Boston$tax > 650, ])
nrow(Boston[Boston$tax > 690, ])
range(Boston$tax)

hist(Boston$ptratio, breaks = 50)
nrow(Boston[Boston$ptratio > 20, ])
range(Boston$ptratio)

nrow(Boston[Boston$chas == 1, ])
