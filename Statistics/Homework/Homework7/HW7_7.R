  n = 25;
  exp_count = 1000;
  mins = integer(exp_count)
  maxs = integer(exp_count)
  for (i in 1:exp_count) {
    data <- runif(n, min = -1, max = 1)
    mins[i] = min(data)
    maxs[i] = max(data)
  }
  layout(matrix(c(1,2), 1, 2, byrow = TRUE))
  hist(
    mins, 
    xlim = c(-1, -0.4), 
    ylim = c(0, 10), 
    freq = F,
    xlab = 'Minimums',
    ylab = 'Density and Function Values',
    main = 'KDE PDF and Density Histogram of Minimums'
  )
  f <- density(mins)
  par(new = T)
  plot(
    f, 
    col = "red", 
    lwd = 2, 
    xlim = c(-1, -0.4), 
    ylim = c(0, 10), 
    xlab = 'Minimums',
    ylab = 'Density and Function Values',
    main = 'KDE PDF and Density Histogram of Minimums'
  )
  
  
  hist(
    maxs,
    xlim = c(0.4, 1), 
    ylim = c(0, 10), 
    freq = F,
    xlab = 'Maximums',
    ylab = 'Density and Function Values',
    main = 'KDE PDF and Density Histogram of Maximums'
  )
  f <- density(maxs)
  par(new = T)
  plot(
    f, 
    col = "red", 
    lwd = 2, 
    xlim = c(0.4, 1),
    ylim = c(0, 10), 
    xlab = 'Maximums',
    ylab = 'Density and Function Values',
    main = 'KDE PDF and Density Histogram of Maximums'
  )
