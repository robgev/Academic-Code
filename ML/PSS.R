
#install.packages("ISLR")
#install.packages("ggplot2")
#install.packages("gridExtra")
install.packages("MASS")
library(MASS)
data(package = "MASS")
edit(Boston)


library(ISLR)
library(ggplot2)
library(gridExtra)
data(package = "ISLR")



###### Wage data ################################################

head(Wage)
edit(Wage)
str(Wage)
str(Wage$maritl)
summary(Wage$maritl)
summary(Wage)

dev.new()
g1 = ggplot(data = Wage, aes(y = wage, x = age ))+geom_point(color = "gray")+
  geom_point(color = "gray")+
  xlab("Age")+
  ylab("Wage")+
  geom_smooth(method = "loess", se = F, lwd = 1, color = "black")

  
plot(y = Wage$wage, x = Wage$age)  #simple plot, compare to the ggplot of the same data


g2 = ggplot(data = Wage, aes(y = wage, x = year )) +
  geom_point(color = "gray")+
  xlab("Year")+
  ylab("Wage")+
  geom_smooth(method = "lm", se = T, lwd = 1, color = "black") 


g3 = ggplot(data = Wage, aes(y = wage, x = education, color = education)) +
  xlab("Education Level")+
  scale_x_discrete(labels= c(1,2,3,4,5))+
  ylab("Wage")+
  geom_boxplot()+
  labs(color =  "Education Level")

dev.new()
grid.arrange(g1, g2, g3, nrow = 3)



########### Smarket Data ###############

head(Smarket$Year)
edit(Smarket$Today)

# reduce the data to a few columns you need
head(Smarket[c('Lag1','Lag2','Today')])

g11 = ggplot(data = Smarket, aes(x = Direction, y = Lag1))+
  geom_boxplot(fill = "gray")+
  xlab("Today's Direction")+
  ylab("Percentage change in S&P")+
  ggtitle("Yesterday")

g22 = ggplot(data = Smarket, aes(x = Direction, y = Lag2))+
  geom_boxplot(fill = "gray")+
  xlab("Today's Direction")+
  ylab("Percentage change in S&P")+
  ggtitle("Two Days Previous")

g33 = ggplot(data = Smarket, aes(x = Direction, y = Lag3))+
  geom_boxplot(fill = "gray") +
  xlab("Today's Direction")+
  ylab("Percentage change in S&P")+
  ggtitle("Three Days Previous")

grid.arrange(g11, g22, g33, ncol = 3)


############# Advertising Data ###################

data_adv = read.csv("C:/Users/user/Desktop/PSS for AUA/Advertising.csv")
edit(data_adv)


g_tv = ggplot(data = data_adv, aes(x = TV, y = Sales))+
  geom_point(pch = 1, col = "red") + geom_smooth(method ="lm", se = T)+
  coord_cartesian(xlim = c(0,300))
g_radio = ggplot(data = data_adv, aes(x = Radio, y = Sales))+
  geom_point(pch = 1, col = "red") + geom_smooth(method ="lm", se = T)+
  coord_cartesian(xlim = c(0,60))
g_pap = ggplot(data = data_adv, aes(x = Newspaper, y = Sales))+
  geom_point(pch = 1, col = "red") + geom_smooth(method ="lm", se = F)+
  coord_cartesian(xlim = c(0,150))

grid.arrange(g_tv, g_radio, g_pap, ncol = 3)

dev.new()


###################################################################
###################################################################
###################################################################
###################!!!!Linear Regression!!!########################
###################################################################
###################################################################
###################################################################


# install.packages('forecast')
library(forecast)
library(MASS) 
library(ISLR) 

edit(Boston) # data from MASS library

#?Boston for help
#medv - median house value
#rm - average number of rooms per house
#age - average age of houses
#lstat - percent of hoseholds with low socioeconomic status

dev.new()
# The problem is predict "medv" using the remaining 13 predictors
names(Boston)
pairs(Boston)

#simple linear regression
lm_fit = lm(medv ~ lstat, data = Boston)
lm_fit

summary(lm_fit)
names(lm_fit)

plot(Boston$medv, Boston$lstat)
par(new = T)
plot(lm_fit$fitted.values, col = 'red')
par(new = F)


plot(lm_fit$residuals, xlab = 'X', ylab = 'Residuals')
Acf(lm_fit$residuals) # residuals are correlated Auto-Regressive process 
Pacf(lm_fit$residuals) # better result. Moving average process



plot(Boston$medv,Boston$lstat, ylim = c(0,40))
abline(lm_fit, col = 'red')

# confidence intervals for model parameters
confint(lm_fit)


# confidence intervals and prediction intervals for the prediction 
# of medv for a given value of lstat
predict(lm_fit, data.frame(lstat = c(150)), interval='confidence')
predict(lm_fit, data.frame(lstat = c(150)), interval='prediction')

# Diagnostic plots
par(mfrow = c(2,2))
plot(lm_fit)


# Multiple linear regression

lm_fit =lm(medv ~ lstat+age, data=Boston)
summary(lm_fit)

# All features included
lm_fit = lm(medv ~ ., data=Boston)
summary(lm_fit)


# All features included, except 'age' and 'indus' columns
lm_fit = lm(medv ~ .-age-indus, data=Boston)
summary(lm_fit)


lm_fit = lm(medv ~ .-age-indus-tax, data=Boston)
summary(lm_fit)

vif(lm_fit) # variance inflation factor

par(mfrow = c(2,2))
plot(lm_fit)

# interaction terms
lm.fit = lm(medv ~ lstat*age, data = Boston)
summary(lm_fit)

# interaction terms (other way of writing the above fitting)
lm.fit = lm(medv ~ lstat + age + lstat:age, data = Boston)
summary(lm_fit)

# non-linear terms
lm_fit2 = lm(medv ~ lstat +I(lstat^2), data = Boston)
summary(lm_fit2)

par(mfrow=c(2,2))
plot(lm_fit2)


# including higher powers

lm_fit5=lm(medv ~ poly(lstat,5))
summary(lm_fit5)


# This suggests that including additional polynomial terms, up to fifth order,
# leads to an improvement in the model fit!



# qualitative variables

fix(Carseats)
names(Carseats)


lm_fit =lm(Sales~ .+ Income:Advertising + Price:Age, data=Carseats)
summary (lm_fit)







