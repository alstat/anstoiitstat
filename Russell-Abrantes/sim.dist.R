sim.dist <- function(obs.dist,
                     size, 
                     norm.mean = 0, 
                     norm.sd = 1, 
                     expo.rate = 1, 
                     gamm.shape = 2,
                     chis.df = 1,
                     beta.shape1 = 5,
                     beta.shape2 = 1){
#Normal
norm.dist <- matrix(NA, nr = obs.dist, nc = size)
#Exponential
expo.dist <- matrix(NA, nr = obs.dist, nc = size)
#Gamma
gamm.dist <- matrix(NA, nr = obs.dist, nc = size)
#Chi-square
chis.dist <- matrix(NA, nr = obs.dist, nc = size)
#Beta
beta.dist <- matrix(NA, nr = obs.dist, nc = size)

for(i in 1:obs.dist){
  norm.dist[i,] <- rnorm(n = size, mean = norm.mean, sd = norm.sd)
  expo.dist[i,] <- rexp(n = size, rate = expo.rate)
  gamm.dist[i,] <- rgamma(n = size, shape = gamm.shape)
  chis.dist[i,] <- rchisq(n = size, df = chis.df)
  beta.dist[i,] <- rbeta(n = size, shape1 = beta.shape1, shape2 = beta.shape2)
}

norm.var <- t(norm.dist)
expo.var <- t(expo.dist)
gamm.var <- t(gamm.dist)
chis.var <- t(chis.dist)
beta.var <- t(beta.dist)

d.frame <- data.frame(norm.var, expo.var, gamm.var, chis.var, beta.var)
names(d.frame) <- c(paste("Norm.Var", 1:obs.dist, sep = ""),
                    paste("Expo.Var", 1:obs.dist, sep = ""),
                    paste("Gamm.Var", 1:obs.dist, sep = ""),
                    paste("Chis.Var", 1:obs.dist, sep = ""),
                    paste("Beta.Var", 1:obs.dist, sep = ""))
return(d.frame)
}
