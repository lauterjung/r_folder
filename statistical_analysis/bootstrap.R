data <- read.table("data.txt", header = TRUE, sep = "\t", dec = ",")

simulations <- 10000
alpha <- 0.05
upper <- simulations - alpha * simulations / 2
lower <- alpha * simulations / 2

bootstrap <- NA
for (i in 1:simulations) {
  bootstrap[i] <- mean(sample(data, length(data), replace = TRUE))
}

sorted_bootstraps <- sort(bootstrap)
icinf <- sorted_bootstraps[lower]
icsup <- sorted_bootstraps[upper]
results <- c(icinf, icsup)

print(results)