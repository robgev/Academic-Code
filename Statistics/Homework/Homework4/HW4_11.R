eruptions <- faithful$eruptions
waiting <- faithful$waiting
layout(matrix(c(1,2), 1, 2, byrow = TRUE))
boxplot(eruptions, main = "Eruptions Boxplot")
boxplot(waiting, main = "Waiting Boxplot")
